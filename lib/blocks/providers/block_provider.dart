import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/utils/utils.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final blockProvider = StateNotifierProvider<BlockNotifier, AsyncValue<List<Block>>>((ref) {
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

  /// TODO: Determine how to use GRPC and GRPC Web
  /// TODO: Determine how IDs should be represented to user
  /// TODO: Determine what to do for epoch
  /// TODO: Determine how size is computed
  /// TODO: Determine how to sync more blocks
  /// TODO: Determine what to do with withdrawal number
  /// TODO: update method so that multiple latest blocks are fetched (when this is ready)
  /// TODO: Remove blockId or header field
  ///
  /// It takes a bool [setState]
  ///
  /// If [setState] is true, it will update the state of the provider
  /// If [setState] is false, it will not update the state of the provider
  Future<List<Block>> getLatestBlocks({bool setState = false}) async {
    // TODO: Re-implement
    // final genusClient = ref.read(genusProvider(tempChain));

    if (setState) state = const AsyncLoading();

    final List<Block> blocks = [];
    const chainHeight = 5932;
    const pageLimit = 10;

    // var blockRes = await genusClient.getBlockByDepth(depth: 0);
    // print('height: ${blockRes.block.header.height}');

    for (int i = 0; i < pageLimit; i++) {
      // TODO: Re-implement
      // var blockRes = await genusClient.getBlockByDepth(depth: i);

      final iString = i.toString();
      blocks.add(
        Block(
          blockId: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w$iString",
          header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZu$iString",
          epoch: 243827 - i,
          size: 5432.2,
          height: getMockBlock().height + i,
          slot: getMockBlock().slot + i,
          timestamp: getMockBlock().timestamp,
          transactionNumber: getMockBlock().transactionNumber,
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
      data: (data) => AsyncData(data.firstWhere((element) => element.blockId == blockId)),
      error: (error, stakeTrace) => AsyncError(error, stakeTrace),
      loading: () => const AsyncLoading(),
    );
  }

  /// This method is used to get a block by height
  ///
  /// It takes a [height] as a parameter
  /// and returns a [AsyncValue<Block>]
  Future<Block> getBlockByHeight({
    required int height,
  }) async {
    const tempChain = Chains.private_network;
    final genusClient = ref.read(genusProvider(tempChain));

    var blockRes = await genusClient.getBlockByHeight(height: height);

    return Block(
      blockId: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w",
      header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZu",
      epoch: 243827,
      size: 5432.2,
      height: blockRes.block.header.height.toInt(),
      slot: blockRes.block.header.slot.toInt(),
      timestamp: blockRes.block.header.timestamp.toInt(),
      transactionNumber: blockRes.block.fullBody.transactions.length,
      withdrawalNumber: 127,
    );
  }
}
