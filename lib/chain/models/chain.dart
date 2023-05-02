// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chain.freezed.dart';
part 'chain.g.dart';

@freezed
class Chain with _$Chain {
  const factory Chain({
    required double dataThroughput,
    required double averageTransactionFee,
    required int uniqueActiveAddresses,
    required int eon,
    required int era,
    required int epoch,
    // QQQQ what is txn? Is it transaction numbers?
    required int txn,
    required int height,
    required int averageBlockTime,
    required int totalStake,
    required int registeredStakes,
    required int activeStakes,
    required int inactiveStakes,
  }) = _Chain;

  factory Chain.fromJson(Map<String, dynamic> json) => _$ChainFromJson(json);
}
