import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/genus/providers/genus_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final blockProvider =
    StateNotifierProvider<BlockNotifier, AsyncValue<List<Block>>>((ref) {
  /// Notes:
  /// We'll need to watch for the selectedChain here since we will need to know which
  /// instance of Genus to target
  final selectedChain = ref.watch(selectedChainProvider);

  return BlockNotifier(
    ref,
    selectedChain,
  );
});

class BlockNotifier extends StateNotifier<AsyncValue<List<Block>>> {
  final Chains selectedChain;
  final Ref ref;
  BlockNotifier(
    this.ref,
    this.selectedChain,
  ) : super(
          const AsyncLoading(),
        ) {
    getLatestBlocks(setState: true);
  }

  /// TODO: Implements with dart gRPC client (target genus instance in selectedChain)
  /// TODO: update method so that multiple latest blocks are fetched (when this is ready)
  ///
  /// It takes a bool [setState]
  ///
  /// If [setState] is true, it will update the state of the provider
  /// If [setState] is false, it will not update the state of the provider
  Future<List<Block>> getLatestBlocks({bool setState = false}) async {
    final genusClient = ref.read(genusProvider(selectedChain));
    if (setState) state = const AsyncLoading();
    final List<Block> blocks = [];
    const chainHeight = 5932;
    const pageLimit = 10;

    for (int i = 0; i < pageLimit; i++) {
      final iString = i.toString();
      blocks.add(
        Block(
          blockId: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w$iString",
          header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZu$iString",
          epoch: 243827 - i,
          size: 5432.2,
          height: chainHeight - i,
          slot: 10,
          timestamp: 1683494060 + i,
          transactionNumber: 200,
          withdrawalNumber: 127,
        ),
      );
    }

    // Adding delay here to simulate API call
    if (setState) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          // Do API call here
          state = AsyncData(blocks);
        },
      );
    }

    return blocks;
  }

  /// This method is used to get a block by ID
  ///
  /// It takes a [blockId] as a parameter
  /// and returns a [AsyncValue<Block>]
  AsyncValue<Block> getBlockById({
    required String blockId,
  }) {
    return state.when(
      data: (data) =>
          AsyncData(data.firstWhere((element) => element.blockId == blockId)),
      error: (error, stakeTrace) => AsyncError(error, stakeTrace),
      loading: () => const AsyncLoading(),
    );
  }

  /// This method is used to get a block by height
  ///
  /// It takes a [height] as a parameter
  /// and returns a [AsyncValue<Block>]
  AsyncValue<Block> getBlockByHeight({
    required int height,
  }) {
    return state.when(
      data: (data) =>
          AsyncData(data.firstWhere((element) => element.height == height)),
      error: (error, stakeTrace) => AsyncError(error, stakeTrace),
      loading: () => const AsyncLoading(),
    );
  }
}
