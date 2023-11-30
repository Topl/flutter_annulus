// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topl_common/proto/genus/genus_rpc.pb.dart';

import '../../shared/utils/decode_id.dart';

part 'block.freezed.dart';
part 'block.g.dart';

@freezed
class Block with _$Block {
  const factory Block({
    /// String representing block header.
    required String header,

    /// An epoch is a unit of time when validators of the network remain constant.
    /// It is measured in blocks
    required int epoch,

    /// The size of the block
    required double size,

    /// The number of blocks preceding the current block
    required int height,

    /// The slot in which the block was forged.
    required int slot,

    /// Timestamp of block forging
    required int timestamp,

    /// The number of transactions
    required int transactionNumber,
  }) = _Block;

  factory Block.fromBlockRes({required BlockResponse blockRes, required int epochLength}) {
    final block = Block(
      header: decodeId(blockRes.block.header.headerId.value),
      // QQQQ remove the hardcoded 10
      epoch: (blockRes.block.header.slot.toInt() ~/ epochLength) ~/ 10,
      size: blockRes.writeToBuffer().lengthInBytes.toDouble(),
      height: blockRes.block.header.height.toInt(),
      slot: blockRes.block.header.slot.toInt(),
      timestamp: blockRes.block.header.timestamp.toInt(),
      transactionNumber: blockRes.block.fullBody.transactions.length,
    );
    return block;
  }

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}
