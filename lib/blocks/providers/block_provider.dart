import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chainProvider =
    StateNotifierProvider<BlockNotifier, AsyncValue<Block>>((ref) {
  /// Notes:
  /// We'll need to watch for the selectedChain here since we will need to know which
  /// instance of Genus to target
  final selectedChain = ref.watch(selectedChainProvider);

  return BlockNotifier(
    ref,
    selectedChain,
  );
});

class BlockNotifier extends StateNotifier<AsyncValue<Block>> {
  final Chains selectedChain;
  final Ref ref;
  BlockNotifier(
    this.ref,
    this.selectedChain,
  ) : super(
          const AsyncLoading(),
        ) {
    getLatestBlock(setState: true);
  }

  /// TODO: Implements with dart gRPC client (target genus instance in selectedChain)
  /// TODO: update method so that multiple latest blocks are fetched (when this is ready)
  ///
  /// It takes a bool [setState]
  ///
  /// If [setState] is true, it will update the state of the provider
  /// If [setState] is false, it will not update the state of the provider
  Future<Block> getLatestBlock({bool setState = false}) async {
    if (setState) state = const AsyncLoading();

    const Block block = Block(
      blockId: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6wR",
      header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZuY",
      epoch: 243827,
      size: 5432.2,
      height: 5932,
      slot: 10,
      transactionNumber: 200,
      withdrawalNumber: 127,
    );
    // Adding delay here to simulate API call
    if (setState) {
      Future.delayed(
        Duration(seconds: 1),
        () {
          // Do API call here
          state = const AsyncData(block);
        },
      );
    }

    return block;
  }

  /// TODO: Implements with dart gRPC client (target genus instance in selectedChain)
  ///
  /// It takes a bool [setState]
  ///
  /// If [setState] is true, it will update the state of the provider
  /// If [setState] is false, it will not update the state of the provider
  Future<Block> getBlockByHeight(
      {bool setState = false, required int height}) async {
    if (setState) state = const AsyncLoading();

    final Block block = Block(
      blockId: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6wR",
      header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZuY",
      epoch: 243827,
      size: 5432.2,
      height: height,
      slot: 10,
      transactionNumber: 200,
      withdrawalNumber: 127,
    );
    // Adding delay here to simulate API call
    if (setState) {
      Future.delayed(
        Duration(seconds: 1),
        () {
          // Do API call here
          state = const AsyncData(block);
        },
      );
    }

    return block;
  }
}
