import 'package:fixnum/fixnum.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:topl_common/proto/brambl/models/address.pb.dart';
import 'package:topl_common/proto/brambl/models/box/value.pb.dart';
import 'package:topl_common/proto/brambl/models/datum.pb.dart';
import 'package:topl_common/proto/brambl/models/event.pb.dart';
import 'package:topl_common/proto/brambl/models/identifier.pb.dart';
import 'package:topl_common/proto/brambl/models/transaction/io_transaction.pb.dart';
import 'package:topl_common/proto/brambl/models/transaction/schedule.pb.dart';
import 'package:topl_common/proto/brambl/models/transaction/spent_transaction_output.pb.dart';
import 'package:topl_common/proto/brambl/models/transaction/unspent_transaction_output.pb.dart';
import 'package:topl_common/proto/consensus/models/block_id.pb.dart';
import 'package:topl_common/proto/genus/genus_models.pb.dart';
import 'package:topl_common/proto/genus/genus_rpc.pb.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';
import 'package:topl_common/proto/quivr/models/shared.pb.dart';
import 'package:fast_base58/fast_base58.dart';

IoTransaction getMockIoTransaction({
  String id = '1',
}) {
  return IoTransaction(
    datum: Datum_IoTransaction(
      event: Event_IoTransaction(
        schedule: Schedule(
          max: Int64(2),
          min: Int64(1),
          timestamp: Int64(
            DateTime.now().millisecondsSinceEpoch,
          ),
        ),
        metadata: SmallData(
          value: [],
        ),
      ),
    ),
    inputs: [
      _getSpentTransactionOutput(id: id),
    ],
    outputs: [
      _getUnspentTransactionOutput(),
    ],
    transactionId: _getTransactionId(id),
  );
}

TransactionResponse getMockTransactionResponse({
  String id = '1',
  String blockId = '1',
}) {
  return TransactionResponse(
    transactionReceipt: TransactionReceipt(
      transaction: getMockIoTransaction(id: id),
      blockId: BlockId(value: Base58Decode(blockId)),
    ),
  );
}

getMockBroadcastTransactionRes() {
  return BroadcastTransactionRes();
}

TransactionId _getTransactionId(String id) {
  print('QQQQ id: $id');
  return TransactionId(
    value: encodeId(id),
  );
}

UnspentTransactionOutput _getUnspentTransactionOutput() {
  return UnspentTransactionOutput(
    address: LockAddress.getDefault(),
    value: Value(
      lvl: Value_LVL(
        quantity: Int128(
          value: [100],
        ),
      ),
    ),
  );
}

SpentTransactionOutput _getSpentTransactionOutput({
  required String id,
}) {
  return SpentTransactionOutput(
    address: TransactionOutputAddress(
      id: TransactionId(value: encodeId(id)),
      index: 1,
      ledger: 1,
      network: 1,
    ),
    value: Value(
      lvl: Value_LVL(
        quantity: Int128(
          value: [100],
        ),
      ),
    ),
  );
}
