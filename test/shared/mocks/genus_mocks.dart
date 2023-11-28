import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:topl_common/genus/services/transaction_grpc.dart';
import '../../utils/block_utils.dart';
import 'genus_mocks.mocks.dart';

@GenerateMocks([GenusGRPCService])
GenusGRPCService getMockGenus() {
  MockGenusGRPCService mockGenus = MockGenusGRPCService();

  when(mockGenus.getBlockByDepth(
    confidence: anyNamed('confidence'),
    depth: anyNamed('depth'),
    options: anyNamed('options'),
  )).thenAnswer(
    (realInvocation) async {
      return getMockBlockResponse();
    },
  );

  when(mockGenus.getBlockByHeight(
    confidence: anyNamed('confidence'),
    height: anyNamed('height'),
    options: anyNamed('options'),
  )).thenAnswer(
    (realInvocation) async {
      return getMockBlockResponse();
    },
  );

  return mockGenus;
}
