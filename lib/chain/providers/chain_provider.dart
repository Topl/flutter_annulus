import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/chain/utils/chain_utils.dart';
import 'package:flutter_annulus/genus/providers/genus_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/genus/services/transaction_grpc.dart';
import 'package:topl_common/proto/consensus/models/block_header.pb.dart';
import 'package:topl_common/proto/genus/genus_rpc.pb.dart';

final last10BlockHeadersProvider = FutureProvider<List<BlockHeader>>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  final GenusGRPCService genusClient = ref.read(genusProvider(selectedChain));

  final List<BlockHeader> last10Blocks = [];

  for (int i = 0; i < 10; i++) {
    final block = await genusClient.getBlockByDepth(depth: i);
    final blockHeader = block.block.header;
    last10Blocks.add(blockHeader);
  }

  return last10Blocks;
});

final chainProvider = StateNotifierProvider<ChainNotifier, AsyncValue<Chain>>((ref) {
  /// Adding some dev notes here
  ///
  /// THIS STILL NEEDS TO BE TESTED!
  ///
  /// Watching selected chain here and providing to the notifier
  /// Ideally, when the chain is changed, the notifier should be updated
  /// Since Annulus will support the ability to add new chains, we cant have pre-defined providers for each chain
  ///
  /// In Ribn we have a similar use case where we have a selected chain
  /// but we have individual providers for each chain since it currently only supports 3 chains
  final selectedChain = ref.watch(selectedChainProvider);

  return ChainNotifier(
    ref,
    selectedChain,
  );
});

class ChainNotifier extends StateNotifier<AsyncValue<Chain>> {
  final Chains selectedChain;
  final Ref ref;

  final GenusGRPCService genusClient;

  ChainNotifier(
    this.ref,
    this.selectedChain,
  )   : genusClient = ref.read(genusProvider(selectedChain)),
        super(
          const AsyncLoading(),
        ) {
    getSelectedChain(setState: true);
  }

  /// TODO: Implements with dart gRPC client
  ///
  /// It takes a bool [setState]
  ///
  /// If [setState] is true, it will update the state of the provider
  /// If [setState] is false, it will not update the state of the provider
  Future<Chain> getSelectedChain({bool setState = false}) async {
    if (setState) state = const AsyncLoading();

    final int activeStakes = await _getActiveStakes();
    final int inactiveStakes = await _getInactiveStakes();
    final int registeredStakes = activeStakes + inactiveStakes;

    final Chain chain = Chain(
      dataThroughput: await _getDataThroughPut(),
      averageTransactionFee: await _getAverageTransactionFee(),
      uniqueActiveAddresses: await _getUniqueActiveAddresses(),
      eon: await _getEon(),
      era: await _getEra(),
      epoch: await _getEpoch(),
      totalTransactionsInEpoch: await _getTotalTransactionsInEpoch(),
      height: await _getHeight(),
      averageBlockTime: await _getAverageBlockTime(),
      totalStake: activeStakes / registeredStakes,
      registeredStakes: registeredStakes,
      activeStakes: await _getActiveStakes(),
      inactiveStakes: await _getInactiveStakes(),
    );

    // Adding delay here to simulate API call
    if (setState) {
      state = AsyncData(chain);
    }

    return chain;
  }

  /// TODO: This probably can be simplified to reduce calls by using the blocks already in the block proovider
  /// QQQQ How do you actually calculate?
  /// Add the block size of each block and then divide by the difference in time between the first and last block?
  Future<double> _getDataThroughPut() async {
    if (selectedChain == Chains.mock) {
      return getMockChain().dataThroughput;
    } else {
      final List<BlockHeader> last10Blocks = await ref.read(last10BlockHeadersProvider.future);

      final List<double> averageDataThroughPut = [];

      last10Blocks.forEach((blockHeader) {
        final timeStamp = blockHeader.timestamp;
        return averageDataThroughPut.add(10);
      });

      return averageDataThroughPut.reduce((a, b) => a + b) / averageDataThroughPut.length;
    }
  }

  /// TODO: This probably can be simplified to reduce calls by using the transactions already in the transaction proovider
  Future<double> _getAverageTransactionFee() async {
    if (selectedChain == Chains.mock) {
      return getMockChain().averageTransactionFee;
    } else {
      /// QQQQ TODO: Implement
      /// How do you get the most recent transactions?
      Future<double?> _getSingleAverageTransactionFee() async {}

      const int amountOfTransactionsToCheck = 10;

      final List<double> averageTransactionFee = [];

      for (int i = 0; i < amountOfTransactionsToCheck; i++) {
        final transactionFee = await _getSingleAverageTransactionFee();

        if (transactionFee != null) {
          averageTransactionFee.add(transactionFee);
        }
      }

      return averageTransactionFee.reduce((a, b) => a + b) / averageTransactionFee.length;
    }
  }

  /// TODO: Implement
  /// QQQQ is this implemented?
  Future<int> _getUniqueActiveAddresses() async {
    return getMockChain().uniqueActiveAddresses;
  }

  /// TODO: Implement
  /// QQQQ is this implemented?
  Future<int> _getEon() async {
    return getMockChain().eon;
  }

  /// TODO: Implement
  /// QQQQ is this implemented?
  Future<int> _getEra() async {
    return getMockChain().era;
  }

  /// TODO: Implement
  Future<int> _getEpoch() async {
    if (selectedChain == Chains.mock) {
      return getMockChain().epoch;
    } else {
      final BlockResponse blockAtHeight1 = await genusClient.getBlockByHeight(height: 1);
      final BlockHeader blockHeader = blockAtHeight1.block.header;
      final int timeStamp = blockHeader.timestamp.toInt();

      /// QQQQ how do I get slots in node config
      return getMockChain().epoch;
    }
  }

  /// TODO: Implement
  Future<int> _getTotalTransactionsInEpoch() async {
    return getMockChain().totalTransactionsInEpoch;
  }

  Future<int> _getHeight() async {
    if (selectedChain == Chains.mock) return getMockChain().height;
    final List<BlockHeader> blocks = await ref.read(last10BlockHeadersProvider.future);

    final height = blocks[0].height;

    return height.toInt();
  }

  /// QQQQ question. Is the timestamp in the block header in milliseconds from epoch?
  Future<int> _getAverageBlockTime() async {
    if (selectedChain == Chains.mock) {
      return getMockChain().averageBlockTime;
    } else {
      final List<BlockHeader> last10Blocks = await ref.read(last10BlockHeadersProvider.future);

      final List<int> blockTimes = [];

      for (int i = 0; i < last10Blocks.length - 1; i++) {
        final currentBlock = last10Blocks[i];
        final previousBlock = last10Blocks[i + 1];

        final blockTime = currentBlock.timestamp.toInt() - previousBlock.timestamp.toInt();

        blockTimes.add(blockTime);
      }

      return (blockTimes.reduce((a, b) => a + b) / blockTimes.length).round();
    }
  }

  /// TODO: Implement
  /// QQQQ is this implemented?
  Future<int> _getActiveStakes() async {
    return getMockChain().activeStakes;
  }

  /// TODO: Implement
  /// QQQQ is this implemented?
  Future<int> _getInactiveStakes() async {
    return getMockChain().inactiveStakes;
  }
}
