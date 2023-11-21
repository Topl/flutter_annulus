import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/proto/brambl/models/transaction/io_transaction.pb.dart';
import 'package:topl_common/proto/genus/genus_models.pb.dart';
import 'package:topl_common/proto/genus/genus_rpc.pbgrpc.dart';

import 'utils.dart';

extension TransactionResponseExtension on TransactionResponse {
  Future<Transaction> toTransaction(Ref ref) async {
    final TransactionReceipt transactionReceipt = this.transactionReceipt;
    final IoTransaction ioTransaction = transactionReceipt.transaction;

    final String blockId = decodeId(transactionReceipt.blockId.value);

    final outputList = ioTransaction.outputs.toList();
    final inputList = ioTransaction.inputs.toList();
    final txAmount = calculateAmount(outputs: outputList).toDouble();
    final txFees = calculateFees(inputs: inputList, outputs: outputList).toDouble();

    final Block block = await ref.read(getBlockByIdProvider(blockId).future);

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
    );
    return transaction;
  }
}
