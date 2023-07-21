import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/utils/utils.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/shared/providers/config_provider.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Returns a block at the index
///
/// IMPORTANT: Only use this provider AFTER the blockProvider has been initialized
/// Ex.
/// ```
/// final blockProvider = ref.watch(blockProvider);
/// blockProvider.when(
///   data: (data) {
///    // Use data here
///    ref.watch(blockStateAtIndexProvider(index));
///    ...
///   },
///   ...
///   );
/// ```
final blockStateAtDepthProvider = FutureProvider.family<Block, int>((ref, depth) async {
  return ref.watch(blockProvider.notifier).getBlockFromStateAtDepth(depth);
});

final getBlockByDepthProvider = FutureProvider.family<Block, int>((ref, depth) async {
  final selectedChain = ref.watch(selectedChainProvider);
  final genusClient = ref.read(genusProvider(selectedChain));

  final config = ref.read(configProvider.future);
  final presentConfig = await config;

  var blockRes = await genusClient.getBlockByDepth(depth: depth);

  return Block(
    header: decodeId(blockRes.block.header.headerId.value),
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
    header: decodeId(blockRes.block.header.headerId.value),
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
    header: decodeId(blockRes.block.header.headerId.value),
    epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
    size: 5432.2,
    height: blockRes.block.header.height.toInt(),
    slot: blockRes.block.header.slot.toInt(),
    timestamp: blockRes.block.header.timestamp.toInt(),
    transactionNumber: blockRes.block.fullBody.transactions.length,
  );
});

final blockProvider = StateNotifierProvider<BlockNotifier, AsyncValue<Map<int, Block>>>((ref) {
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

class BlockNotifier extends StateNotifier<AsyncValue<Map<int, Block>>> {
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
    if (selectedChain == Chains.mock) {
      final List<Block> blocks = List.generate(100, (index) => getMockBlock());
      if (setState) {
        state = AsyncData(
          blocks.asMap(),
        );
      }
      return blocks;
    }
    try {
      final genusClient = ref.read(genusProvider(selectedChain));

      if (setState) state = const AsyncLoading();

      //futures
      final List<Block> blocks = [];
      const pageLimit = 10;
      final presentConfig = await config;
      List<Future> futures = [];
      for (int i = 0; i < pageLimit; i++) {
        futures.add(genusClient.getBlockByDepth(depth: i));
      }

      final blockResponses = await Future.wait(futures);
      blockResponses.asMap().forEach((i, blockRes) {
        blocks.add(
          Block(
            header: decodeId(blockRes.block.header.headerId.value),
            epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
            size: 5432.2,
            height: blockRes.block.header.height.toInt(),
            slot: blockRes.block.header.slot.toInt(),
            timestamp: blockRes.block.header.timestamp.toInt(),
            transactionNumber: blockRes.block.fullBody.transactions.length,
          ),
        );
      });

      // Adding delay here to simulate API call
      if (setState) {
        state = AsyncData(blocks.asMap());
      }

      return blocks;
    } catch (e) {
      throw Exception('Error in blockProvider: $e');
    }
  }

  /// This method is used to get a block at a specific index
  /// If the block is not in the state, it will fetch the block from Genus
  /// It takes an [index] as a parameter
  ///
  /// It returns a [Future<Block>]
  Future<Block> getBlockFromStateAtDepth(int depth) async {
    var blocks = state.asData?.value;

    if (blocks == null) {
      throw Exception('Error in blockProvider: blocks are null');
    }

    // If the index is less than the length of the list, return the block at that index
    if (blocks[depth] != null) {
      return blocks[depth]!;
    } else {
      blocks = {...blocks};
      // Get the next block by height from Genus
      final genusClient = ref.read(genusProvider(selectedChain));
      final blockRes = await genusClient.getBlockByDepth(depth: depth);
      final presentConfig = await config;
      // Add that block to state's list
      var newBlock = Block(
        header: decodeId(blockRes.block.header.headerId.value),
        epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
        size: 5432.2,
        height: blockRes.block.header.height.toInt(),
        slot: blockRes.block.header.slot.toInt(),
        timestamp: blockRes.block.header.timestamp.toInt(),
        transactionNumber: blockRes.block.fullBody.transactions.length,
      );
      blocks[depth] = newBlock;
      print('QQQQ newBlock: $newBlock');

      // Sort the blocks by depth so that they are in order
      List<MapEntry<int, Block>> sortedBlocks = blocks.entries.toList();
      sortedBlocks.sort((a, b) => b.key.compareTo(a.key));
      print('QQQQ sortedBlocks: $sortedBlocks');
      state = AsyncData({...Map.fromEntries(sortedBlocks)});

      // Return that block
      return newBlock;
    }
  }
}
