import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/transactions/models/utxo.dart';
import 'package:flutter_annulus/transactions/utils/utxo_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// The [utxoByIdProvider] retrieves the [UTxO] by its [utxoId].
/// If [mockStateProvider] is true, the function returns a mock [UTxO] after a delay of 1 second.
/// Otherwise, it throws an exception and still needs to be implemented
///
/// Example usage:
///
/// ```
/// final UTxO utxo = await ref.read(utxoByIdProvider('utxoId').future);
///
/// final AsyncValue<UTxO> utxoAsyncValue = ref.watch(utxoByIdProvider('utxoId'));
///
/// return utxoAsyncValue.when(
///   data: (utxo) => Text('UTxO: $utxo'),
///   loading: () => CircularProgressIndicator(),
///   error: (error, stackTrace) => Text('Error: $error'),
/// );
/// ```
final utxoByIdProvider = FutureProvider.family.autoDispose<UTxO, String>((ref, utxoId) async {
  final selectedChain = ref.watch(selectedChainProvider);
  if (selectedChain == Chains.mock) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => getMockUTxO(),
    );
  } else {
    throw Exception('UTxO RPC calls not yet implemented');
  }
});
