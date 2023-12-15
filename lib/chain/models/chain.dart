// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chain.freezed.dart';

part 'chain.g.dart';

@freezed
class Chain with _$Chain {
  const factory Chain({
    /// The current data throughput for the network in kilobytes per second.
    required double dataThroughput,

    /// The average transaction fee for the network in LVL
    required double averageTransactionFee,

    /// The ratio of unique active addresses to total addresses.
    required int uniqueActiveAddresses,

    /// A unit of time to define a specific length in the blockchain.
    required int eon,

    /// A unit of time to define a specific set of rule or parameters in the blockchain.
    required int era,

    /// An epoch is a unit of time when validators of the network remain constant.
    /// It is measured in blocks
    required int epoch,

    /// The total number of transactions in current epoch
    /// Also known as Txn
    required int totalTransactionsInEpoch,

    /// The number of blocks preceding the current block
    required int height,

    /// Average Time for a block to be added to a blockchain
    required int averageBlockTime,

    /// The percentage of staked cypto
    required double totalRegisteredStake,

    /// Stakes that have been officially recorded on the blockchain
    required int totalStakes,

    /// Portion of a cryptocurrency that is currently being staked
    required int activeStakes,

    /// Portion of a cryptocurrency that is not staked
    required int inactiveStakes,
  }) = _Chain;

  factory Chain.fromJson(Map<String, dynamic> json) => _$ChainFromJson(json);
}
