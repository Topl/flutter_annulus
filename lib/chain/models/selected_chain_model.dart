// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_chain_model.freezed.dart';
part 'selected_chain_model.g.dart';

@freezed
class SelectedChainModel with _$SelectedChainModel {
  const factory SelectedChainModel({
    required double dataThroughput,
    required double averageTransactionFee,
    required int uniqueActiveAddresses,
  }) = _SelectedChainModel;

  factory SelectedChainModel.fromJson(Map<String, dynamic> json) => _$SelectedChainModelFromJson(json);
}
