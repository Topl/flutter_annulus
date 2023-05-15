
// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'utxo.freezed.dart';
part 'utxo.g.dart';

@freezed
class UTxO with _$UTxO {
  const factory UTxO({

  }) = _UTxO;

  factory UTxO.fromJson(Map<String, dynamic> json) => _$UTxOFromJson(json);
}
