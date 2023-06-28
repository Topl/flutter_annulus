import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/chain/utils/chain_utils.dart';
import 'package:flutter_annulus/genus/providers/genus_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/genus/services/transaction_grpc.dart';

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
      totalStake: await _getTotalStake(),
      registeredStakes: await _getRegisteredStakes(),
      activeStakes: await _getActiveStakes(),
      inactiveStakes: await _getInactiveStakes(),
    );

    // Adding delay here to simulate API call
    if (setState) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          // Do API call here
          state = AsyncData(chain);
        },
      );
    }

    return chain;
  }

  /// TODO: This probably can be simplified to reduce calls by using the blocks already in the block proovider
  Future<double> _getDataThroughPut() async {
    if (selectedChain == Chains.mock)
      return getMockChain().dataThroughput;
    else {
      Future<double?> _getDataThroughPutForBlockAtDepth(int depth) async {
        try {
          final block = await genusClient.getBlockByDepth(depth: depth);
          final blockHeader = block.block.header;
          final timeStamp = blockHeader.timestamp;

          print('QQQQ block: $block');
          print('QQQQ block string: ${block.block.header}');
          return 10;
        } catch (e) {
          print('QQQQ error: $e');
          return null;
        }
      }

      const int amountOfBlocksToCheck = 10;
      final List<double> averageDataThroughPut = [];
      for (int i = 0; i < amountOfBlocksToCheck; i++) {
        final dataThroughput = await _getDataThroughPutForBlockAtDepth(i);

        if (dataThroughput != null) {
          averageDataThroughPut.add(dataThroughput);
        }
      }
      return averageDataThroughPut.reduce((a, b) => a + b) / averageDataThroughPut.length;
    }
  }

  /// TODO: This probably can be simplified to reduce calls by using the transactions already in the transaction proovider
  Future<double> _getAverageTransactionFee() async {
    if (selectedChain == Chains.mock)
      return getMockChain().averageTransactionFee;
    else {
      /// TODO: Implement=
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
  Future<int> _getUniqueActiveAddresses() async {
    return getMockChain().uniqueActiveAddresses;
  }

  /// TODO: Implement
  Future<int> _getEon() async {
    return getMockChain().eon;
  }

  /// TODO: Implement
  Future<int> _getEra() async {
    return getMockChain().era;
  }

  /// TODO: Implement
  Future<int> _getEpoch() async {
    return getMockChain().epoch;
  }

  /// TODO: Implement
  Future<int> _getTotalTransactionsInEpoch() async {
    return getMockChain().totalTransactionsInEpoch;
  }

  /// TODO: Probably can be simplified by using the blocks already in the block provider
  Future<int> _getHeight() async {
    if (selectedChain == Chains.mock) return getMockChain().height;
    final block = await genusClient.getBlockByDepth(depth: 0);

    final height = block.block.header.height;

    return height.toInt();
  }

  /// TODO: Implement
  Future<int> _getAverageBlockTime() async {
    return getMockChain().averageBlockTime;
  }

  /// TODO: Implement
  Future<double> _getTotalStake() async {
    return getMockChain().totalStake;
  }

  /// TODO: Implement
  Future<int> _getRegisteredStakes() async {
    return getMockChain().registeredStakes;
  }

  /// TODO: Implement
  Future<int> _getActiveStakes() async {
    return getMockChain().activeStakes;
  }

  /// TODO: Implement
  Future<int> _getInactiveStakes() async {
    return getMockChain().inactiveStakes;
  }
}
