// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'utxo.freezed.dart';

part 'utxo.g.dart';

@freezed
class UTxO with _$UTxO {
  const factory UTxO({
    // The unique identifier for this unspent transaction output.
    required String utxoId,

    // The identifier of the block that contains this unspent transaction output.
    required String blockId,

    // The address of the sender of this unspent transaction output.
    required String senderAddress,

    // The address of the receiver of this unspent transaction output.
    required String receiverAddress,

    // The address to which any change from this transaction should be sent.
    required String changeBackAddress,

    // The amounts of the inputs to this transaction.
    required List<int> inputAmount,

    // The amounts of the outputs from this transaction.
    required List<int> outputAmount,

    // The fee for this transaction.
    required int fee,
  }) = _UTxO;

  factory UTxO.fromJson(Map<String, dynamic> json) => _$UTxOFromJson(json);
}
