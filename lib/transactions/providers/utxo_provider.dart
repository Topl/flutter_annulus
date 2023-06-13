import 'package:flutter_annulus/search/models/utxo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final utxoProvider = StateNotifierProvider<UTxONotifier, AsyncValue<UTxO>>((ref) {
  return UTxONotifier();
});

class UTxONotifier extends StateNotifier<AsyncValue<UTxO>> {
  UTxONotifier() : super(const AsyncValue.loading());
}
