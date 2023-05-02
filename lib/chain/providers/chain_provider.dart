import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chainProvider = StateNotifierProvider<ChainNotifier, AsyncValue<Chain>>((ref) {
  return ChainNotifier(ref);
});

class ChainNotifier extends StateNotifier<AsyncValue<Chain>> {
  final Ref ref;
  ChainNotifier(this.ref)
      : super(
          const AsyncLoading(),
        ) {
    getSelectedChain();
  }

  /// TODO: Implements with dart gRPC client
  Future<void> getSelectedChain() async {
    state = const AsyncLoading();

    // Do API call here
    final selectedChain = ref.read(selectedChainProvider);
    state = const AsyncData(Chain(
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
    ));
  }
}
