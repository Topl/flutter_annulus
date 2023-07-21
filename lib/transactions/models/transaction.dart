// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';

part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    /// The unique identifier of the transaction
    required String transactionId,

    /// The status of the transaction
    required TransactionStatus status,

    /// The block number of the transaction
    required Block block,

    /// The time the transaction was broadcasted
    required int broadcastTimestamp,

    /// The time the transaction was confirmed
    required int confirmedTimestamp,

    /// The type of transaction
    required TransactionType transactionType,

    /// The amount of the transaction
    required double amount,

    /// The fee of the transaction
    required double transactionFee,

    /// The address of the sender
    required List<String> senderAddress,

    /// The address of the receiver
    required List<String> receiverAddress,

    /// The size of the transaction
    required int transactionSize,

    /// The quantity of the transaction
    required int quantity,

    /// The name of the asset
    required String name,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}
