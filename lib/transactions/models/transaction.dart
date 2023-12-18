// Flutter imports:
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:flutter_annulus/transactions/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:topl_common/proto/brambl/models/transaction/io_transaction.pb.dart';
import 'package:topl_common/proto/genus/genus_rpc.pb.dart';

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
    required double transactionSize,

    /// The quantity of the transaction
    required double quantity,

    /// The name of the asset
    required String name,

    /// The metadata
    required String? metadata,
  }) = _Transaction;

  factory Transaction.fromBlockRes({required BlockResponse blockRes, required int index, required Block block}) {
    final IoTransaction ioTransaction = blockRes.block.fullBody.transactions[index];
    final String metadata = decodeId(ioTransaction.datum.event.metadata.value);

    final outputList = ioTransaction.outputs.toList();
    final inputList = ioTransaction.inputs.toList();
    final txAmount = calculateAmount(outputs: outputList).toDouble();
    final txFees = calculateFees(inputs: inputList, outputs: outputList).toDouble();

    final transaction = Transaction(
      transactionId: decodeId(ioTransaction.transactionId.value),
      status: TransactionStatus.pending,
      block: block,
      broadcastTimestamp: block.timestamp,
      confirmedTimestamp: 0,
      transactionType: TransactionType.transfer,
      amount: txAmount,
      transactionFee: txFees,
      senderAddress: ioTransaction.inputs.map((e) => decodeId(e.address.id.value)).toList(),
      receiverAddress: ioTransaction.outputs.map((e) => decodeId(e.address.id.value)).toList(),
      transactionSize: ioTransaction.writeToBuffer().lengthInBytes.toDouble(),
      quantity: txAmount,
      name: ioTransaction.inputs[0].value.hasLvl() ? 'Lvl' : 'Topl',
      metadata: metadata,
    );

    return transaction;
  }

  factory Transaction.fromIoTransaction({
    required IoTransaction ioTransaction,
    required Block associatedBlock,
  }) {
    final inputList = ioTransaction.inputs.toList();
    final outputList = ioTransaction.outputs.toList();
    final txAmount = calculateAmount(outputs: outputList);
    final txFees = calculateFees(inputs: inputList, outputs: outputList);
    final metadata = decodeId(ioTransaction.datum.event.metadata.value);

    final transaction = Transaction(
      transactionId: decodeId(ioTransaction.transactionId.value),
      status: TransactionStatus.pending,
      block: associatedBlock,
      broadcastTimestamp: associatedBlock.timestamp,
      confirmedTimestamp: 0, //for the latest block, it will never be confirmed (confirmation depth is 5)
      transactionType: TransactionType.transfer,
      amount: txAmount.toDouble(),
      quantity: txAmount.toDouble(),
      transactionFee: txFees.toDouble(),
      senderAddress: ioTransaction.inputs.map((e) => decodeId(e.address.id.value)).toList(),
      receiverAddress: ioTransaction.outputs.map((e) => decodeId(e.address.id.value)).toList(),
      transactionSize: ioTransaction.writeToBuffer().lengthInBytes.toDouble(),
      name: ioTransaction.inputs[0].value.hasLvl() ? 'Lvl' : 'Topl',
      metadata: metadata,
    );

    return transaction;
  }

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}
