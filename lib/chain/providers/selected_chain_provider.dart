import 'package:flutter_annulus/chain/models/selected_chain_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedChainProvider = StateNotifierProvider<SelectedChainNotifier, AsyncValue<SelectedChainModel>>((ref) {
  return SelectedChainNotifier();
});

class SelectedChainNotifier extends StateNotifier<AsyncValue<SelectedChainModel>> {
  SelectedChainNotifier()
      : super(
          const AsyncLoading(),
        ) {
    // getSelectedChain().then(
    //   (value) => state = AsyncData(value),
    // );
  }

  /// This Reaches out to the API to get the selected chain
  Future<SelectedChainModel> getSelectedChain() async {
    const q = SelectedChainModel(
      dataThroughput: 0.0,
      averageTransactionFee: 0.0,
      uniqueActiveAddresses: 0,
    );

    state = const AsyncData(q);

    return q;
  }
}
