import 'package:fixnum/fixnum.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:topl_common/genus/services/node_grpc.dart';
import 'package:topl_common/proto/node/models/node_config.pb.dart';
import 'package:topl_common/proto/node/models/node_epochData.pb.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';
import 'package:topl_common/proto/quivr/models/shared.pb.dart';

import 'node_config_mocks.mocks.dart';

@GenerateMocks([NodeGRPCService])
MockNodeGRPCService getMockNodeGRPCService() {
  final mockNodeService = MockNodeGRPCService();

  when(mockNodeService.fetchNodeConfig()).thenAnswer((_) async* {
    yield FetchNodeConfigRes(
      config: NodeConfig(
        epochLength: Int64(1),
        slot: Int64(1),
        slotDurationMillis: Int64(1),
      ),
    );
  });

  when(mockNodeService.fetchEpochData(epoch: anyNamed('epoch'))).thenAnswer((realInvocation) async {
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
  });
  return mockNodeService;
}
