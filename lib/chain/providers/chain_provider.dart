import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chainProvider = StateNotifierProvider<ChainNotifier, AsyncValue<Chain>>((ref) {
  return ChainNotifier();
});

class ChainNotifier extends StateNotifier<AsyncValue<Chain>> {
  ChainNotifier()
      : super(
          const AsyncLoading(),
        ) {}

  /// This Reaches out to the API to get the selected chain
  // Future<Chain> getSelectedChain() async {}
}
