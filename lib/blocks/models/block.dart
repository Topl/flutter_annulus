// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

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

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}
