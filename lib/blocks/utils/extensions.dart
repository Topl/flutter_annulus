import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:topl_common/proto/genus/genus_rpc.pbgrpc.dart';

extension BlockResponseExtension on BlockResponse {
  Block toBlock(int epochLength) {
    return Block(
      header: decodeId(block.header.headerId.value),
      epoch: block.header.slot.toInt() ~/ epochLength,
      size: block.writeToBuffer().lengthInBytes.toDouble(),
      height: block.header.height.toInt(),
      slot: block.header.slot.toInt(),
      timestamp: block.header.timestamp.toInt(),
      transactionNumber: block.fullBody.transactions.length,
    );
  }
}
