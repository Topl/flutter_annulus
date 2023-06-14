import 'package:flutter_annulus/shared/providers/mock_state_provider.dart';
import 'package:flutter_annulus/transactions/models/utxo.dart';
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
  if (ref.read(mockStateProvider)) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => _getMockUTxO(),
    );
  } else {
    throw Exception('UTxO RPC calls not yet implemented');
  }
});

UTxO _getMockUTxO() {
  return const UTxO(
    utxoId: '0x5be9d701Byd24neQfY1vXa987a',
    blockId: '242218',
    changeBackAddress: '3m21ucZ0pFyvxa1by9dnE2q87e3P6ic',
    fee: 0.1,
    inputAmount: [5.5, 123],
    outputAmount: [6, 0.63],
    receiverAddress: '7bY6Dne54qMU12cz3oPF4yVx5aG6a',
    senderAddress: '3m21ucZ0pFyvxa1by9dnE2q87e3P6ic',
  );
}
