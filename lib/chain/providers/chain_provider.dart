import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
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
    getSelectedChain();
  }

  /// TODO: Implements with dart gRPC client
  Future<void> getSelectedChain() async {
    state = const AsyncLoading();
    // Adding delay here to simulate API call
    Future.delayed(
      Duration(seconds: 1),
      () {
        // Do API call here
        state = const AsyncData(
          Chain(
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
          ),
        );
      },
    );
  }
}
