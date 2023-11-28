
import 'package:fixnum/fixnum.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:topl_common/genus/services/node_grpc.dart';
import 'package:topl_common/proto/node/models/node_config.pb.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';

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
  return mockNodeService;
}
