import 'package:flutter_annulus/blocks/models/block.dart';

Block getMockBlock([int? i]) {
  const baseBlock = Block(
    header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZu",
    epoch: 243827,
    size: 5432.2,
    slot: 10,
    timestamp: 1702976253149,
    transactionNumber: 200,
    height: 100000,
  );

  return i != null ? baseBlock.copyWith(height: 100000 + i) : baseBlock;
}

String blockTimeStampToDifference(Block block) {
  final difference = DateTime.now().millisecondsSinceEpoch - block.timestamp;
  return "${difference ~/ 1000} sec ago";
}
