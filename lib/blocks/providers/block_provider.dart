import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/genus/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/utils/get_chain_id.dart';
import 'package:flutter_annulus/shared/providers/config_provider.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getBlockByDepthProvider = FutureProvider.family<Block, int>((ref, depth) async {
  final selectedChain = ref.watch(selectedChainProvider);
  final genusClient = ref.read(genusProvider(selectedChain));

  final config = ref.read(configProvider.future);
  final presentConfig = await config;

  var blockRes = await genusClient.getBlockByDepth(depth: depth);

  return Block(
    header: getChainId(blockRes.block.header.headerId.value),
    epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
    size: 5432.2,
    height: blockRes.block.header.height.toInt(),
    slot: blockRes.block.header.slot.toInt(),
    timestamp: blockRes.block.header.timestamp.toInt(),
    transactionNumber: blockRes.block.fullBody.transactions.length,
  );
});

final getBlockByHeightProvider = FutureProvider.family<Block, int>((ref, height) async {
  final selectedChain = ref.watch(selectedChainProvider);
  final genusClient = ref.read(genusProvider(selectedChain));

  final config = ref.read(configProvider.future);
  final presentConfig = await config;

  var blockRes = await genusClient.getBlockByHeight(height: height);

  return Block(
    header: getChainId(blockRes.block.header.headerId.value),
    epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
    size: 5432.2,
    height: blockRes.block.header.height.toInt(),
    slot: blockRes.block.header.slot.toInt(),
    timestamp: blockRes.block.header.timestamp.toInt(),
    transactionNumber: blockRes.block.fullBody.transactions.length,
  );
});

final getBlockByIdProvider = FutureProvider.family<Block, String>((ref, header) async {
  final selectedChain = ref.watch(selectedChainProvider);
  final genusClient = ref.read(genusProvider(selectedChain));

  final config = ref.read(configProvider.future);
  final presentConfig = await config;

  var blockRes = await genusClient.getBlockById(blockIdString: header);

  return Block(
    header: getChainId(blockRes.block.header.headerId.value),
    epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
    size: 5432.2,
    height: blockRes.block.header.height.toInt(),
    slot: blockRes.block.header.slot.toInt(),
    timestamp: blockRes.block.header.timestamp.toInt(),
    transactionNumber: blockRes.block.fullBody.transactions.length,
  );
});

final blockProvider = StateNotifierProvider<BlockNotifier, AsyncValue<List<Block>>>((ref) {
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
          epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
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
}
