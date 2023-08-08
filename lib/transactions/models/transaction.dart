// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:topl_common/proto/genus/genus_rpc.pb.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/utils/decode_id.dart';
import '../utils/utils.dart';

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
    required double transactionSize,

    /// The quantity of the transaction
    required double quantity,

    /// The name of the asset
    required String name,
  }) = _Transaction;

  factory Transaction.fromBlockRes({required BlockResponse blockRes, required int index, required Block block}) {
    final outputList = blockRes.block.fullBody.transactions[index].outputs.toList();
    final inputList = blockRes.block.fullBody.transactions[index].inputs.toList();
    final txAmount = calculateAmount(outputs: outputList).toDouble();
    final txFees = calculateFees(inputs: inputList, outputs: outputList).toDouble();

    final transaction = Transaction(
        transactionId: decodeId(blockRes.block.fullBody.transactions[index].transactionId.value),
        status: TransactionStatus.pending,
        block: block,
        broadcastTimestamp: block.timestamp,
        confirmedTimestamp: 0,
        transactionType: TransactionType.transfer,
        amount: txAmount,
        transactionFee: txFees,
        senderAddress:
            blockRes.block.fullBody.transactions[index].inputs.map((e) => decodeId(e.address.id.value)).toList(),
        receiverAddress:
            blockRes.block.fullBody.transactions[index].outputs.map((e) => decodeId(e.address.id.value)).toList(),
        transactionSize: blockRes.block.fullBody.transactions[index].writeToBuffer().lengthInBytes.toDouble(),
        quantity: txAmount,
        name: blockRes.block.fullBody.transactions[index].inputs[0].value.hasLvl() ? 'Lvl' : 'Topl');

    return transaction;
  }

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}
