import 'package:fixnum/fixnum.dart';
import 'package:topl_common/proto/node/models/node_epochData.pb.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';
import 'package:topl_common/proto/quivr/models/shared.pb.dart';

getMockChainInfo() {
  return FetchEpochDataRes(
    epochData: EpochData(
      dataBytes: Int64(1),
      startTimestamp: Int64(DateTime.now().millisecondsSinceEpoch),
      transactionCount: Int64(1),
      totalTransactionReward: Int128(),
      endHeight: Int64(1),
      eon: Int64(1),
      era: Int64(1),
      epoch: Int64(1),
      activeStake: Int128(),
      inactiveStake: Int128(),
    ),
  );
}
