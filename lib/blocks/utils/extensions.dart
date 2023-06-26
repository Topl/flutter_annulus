import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/utils/utils.dart';
import 'package:topl_common/proto/genus/genus_rpc.pbgrpc.dart';

extension BlockResponseExtension on BlockResponse {
  // TODO: Implement once response models are finalized
  Block toBlock() {
    return getMockBlock();
  }
}
