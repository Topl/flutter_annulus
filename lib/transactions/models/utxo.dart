// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'utxo.freezed.dart';

part 'utxo.g.dart';

@freezed
class UTxO with _$UTxO {
  const factory UTxO({
    // The unique identifier for this unspent transaction output.
    required String utxoId,

    // The amount of the unspent transaction output.
    required double utxoAmount,

    // The transactionId of the transaction that contains this unspent transaction output.
    required String transactionId,
  }) = _UTxO;

  factory UTxO.fromJson(Map<String, dynamic> json) => _$UTxOFromJson(json);
}
