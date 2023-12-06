import 'package:fixnum/fixnum.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:topl_common/proto/consensus/models/block_header.pb.dart';
import 'package:topl_common/proto/consensus/models/block_id.pb.dart';
import 'package:topl_common/proto/consensus/models/eligibility_certificate.pb.dart';
import 'package:topl_common/proto/consensus/models/operational_certificate.pb.dart';
import 'package:topl_common/proto/consensus/models/staking.pb.dart';
import 'package:topl_common/proto/genus/genus_rpc.pb.dart';
import 'package:topl_common/proto/node/models/block.pb.dart';

import 'transaction_utils.dart';

BlockResponse getMockBlockResponse({
  String? blockId,
  BlockResponse? blockResponse,
  String? transactionId,
}) {
  blockId ??= createId();
  transactionId ??= createId();

  return blockResponse ??
      BlockResponse(
        block: FullBlock(
          header: BlockHeader(
            address: StakingAddress(value: [1, 2, 3, 4, 5, 6, 7, 8]),
            height: Int64(1),
            bloomFilter: [],
            eligibilityCertificate: EligibilityCertificate(),
            headerId: BlockId(value: encodeId(blockId)),
            metadata: [],
            operationalCertificate: OperationalCertificate(),
            parentHeaderId: BlockId(value: [1, 2, 3, 4, 5, 6, 7, 8]),
            parentSlot: Int64(1),
            slot: Int64(1),
            timestamp: Int64(DateTime.now().millisecondsSinceEpoch),
            txRoot: [],
          ),
          fullBody: FullBlockBody(
            transactions: List.generate(
              10,
              (index) => getMockIoTransaction(
                id: '$transactionId',
              ),
            ),
          ),
        ),
      );
}
