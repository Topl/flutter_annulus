import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/genus/providers/genus_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  ChainNotifier(
    this.ref,
    this.selectedChain,
  ) : super(
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

    await _dataThroughPut();

    const Chain chain = Chain(
      dataThroughput: 39.887,
      averageTransactionFee: 3.71,
      uniqueActiveAddresses: 2076,
      eon: 2,
      era: 5,
      epoch: 72109,
      totalTransactionsInEpoch: 266,
      height: 22100762,
      averageBlockTime: 127,
      totalStake: .77,
      registeredStakes: 519,
      activeStakes: 453,
      inactiveStakes: 66,
    );
    // Adding delay here to simulate API call
    if (setState) {
      Future.delayed(
        Duration(seconds: 1),
        () {
          // Do API call here
          state = const AsyncData(chain);
        },
      );
    }

    return chain;
  }

  Future<void> _dataThroughPut() async {
    print('QQQQ dataThroughPut');

    try {
      final genusClient = ref.read(genusProvider(selectedChain));
      final block = await genusClient.getBlockByDepth(depth: 0);
      final blockHeader = block.block.header;
      print('QQQQ block: $block');
      print('QQQQ block string: ${block.block.header}');
    } catch (e) {
      print('QQQQ error: $e');
    }
  }
}
