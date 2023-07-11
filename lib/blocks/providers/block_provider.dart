import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/genus/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/utils/get_chain_id.dart';
import 'package:flutter_annulus/config/providers/config_provider.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final blockProvider =
    StateNotifierProvider<BlockNotifier, AsyncValue<List<Block>>>((ref) {
  /// Notes:
  /// We'll need to watch for the selectedChain here since we will need to know which
  /// instance of Genus to target
  final selectedChain = ref.watch(selectedChainProvider);
  final config = ref.watch(configProvider.future);

  return BlockNotifier(
    ref,
    selectedChain,
    config,
  );
});

class BlockNotifier extends StateNotifier<AsyncValue<List<Block>>> {
  final Chains selectedChain;
  final Ref ref;
  final Future<FetchNodeConfigRes> config;
  BlockNotifier(
    this.ref,
    this.selectedChain,
    this.config,
  ) : super(
          const AsyncLoading(),
        ) {
    getLatestBlocks(setState: true);
  }

  /// It takes a bool [setState]
  ///
  /// If [setState] is true, it will update the state of the provider
  /// If [setState] is false, it will not update the state of the provider
  Future<List<Block>> getLatestBlocks({bool setState = false}) async {
    final genusClient = ref.read(genusProvider(selectedChain));

    if (setState) state = const AsyncLoading();

    final List<Block> blocks = [];
    const pageLimit = 10;
    final presentConfig = await config;

    for (int i = 0; i < pageLimit; i++) {
      var blockRes = await genusClient.getBlockByDepth(depth: i);

      final iString = i.toString();
      blocks.add(
        Block(
          header: getChainId(blockRes.block.header.headerId.value),
          epoch: blockRes.block.header.slot.toInt() ~/
              presentConfig.config.epochLength.toInt(),
          size: 5432.2,
          height: blockRes.block.header.height.toInt(),
          slot: blockRes.block.header.slot.toInt(),
          timestamp: blockRes.block.header.timestamp.toInt(),
          transactionNumber: blockRes.block.fullBody.transactions.length,
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
  /// It takes a [header] as a parameter
  /// and returns a [AsyncValue<Block>]
  AsyncValue<Block> getBlockById({
    required String header,
  }) {
    return state.when(
      data: (data) =>
          AsyncData(data.firstWhere((element) => element.header == header)),
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
    final genusClient = ref.read(genusProvider(selectedChain));

    var blockRes = await genusClient.getBlockByHeight(height: height);
    final presentConfig = await config;

    return Block(
      header: getChainId(blockRes.block.header.headerId.value),
      epoch: blockRes.block.header.slot.toInt() ~/
          presentConfig.config.epochLength.toInt(),
      size: 5432.2,
      height: blockRes.block.header.height.toInt(),
      slot: blockRes.block.header.slot.toInt(),
      timestamp: blockRes.block.header.timestamp.toInt(),
      transactionNumber: blockRes.block.fullBody.transactions.length,
    );
  }

  /// This method is used to get a block by height
  ///
  /// It takes a [depth] as a parameter
  /// and returns a [AsyncValue<Block>]
  Future<Block> getBlockByDepth({
    required int depth,
  }) async {
    final genusClient = ref.read(genusProvider(selectedChain));

    var blockRes = await genusClient.getBlockByDepth(depth: depth);
    final presentConfig = await config;

    return Block(
      header: getChainId(blockRes.block.header.headerId.value),
      epoch: blockRes.block.header.slot.toInt() ~/
          presentConfig.config.epochLength.toInt(),
      size: 5432.2,
      height: blockRes.block.header.height.toInt(),
      slot: blockRes.block.header.slot.toInt(),
      timestamp: blockRes.block.header.timestamp.toInt(),
      transactionNumber: blockRes.block.fullBody.transactions.length,
    );
  }
}
