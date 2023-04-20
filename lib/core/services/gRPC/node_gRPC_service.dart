import 'package:flutter_annulus/core/services/gRPC/proto/node/services/bifrost_rpc.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final nodeChannelProvider = Provider<ClientChannel>((ref) {
  return ClientChannel(
    'host',
    port: 9000,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
});

final nodeStubProvider = Provider<NodeRpcClient>((ref) {
  return NodeRpcClient(ref.read(nodeChannelProvider));
});

final nodeGRPCProvider = Provider<NodeGRPCService>((ref) {
  return NodeGRPCService(ref);
});

class NodeGRPCService {
  final Ref ref;
  NodeGRPCService(this.ref);

  Future<FetchTransactionRes> fetchTransaction() async {
    final FetchTransactionReq request = FetchTransactionReq();
    final FetchTransactionRes response = await ref.read(nodeStubProvider).fetchTransaction(request);
    return response;
  }

  Future<FetchBlockIdAtDepthRes> fetchBlockIdAtDepth() async {
    final FetchBlockIdAtDepthReq request = FetchBlockIdAtDepthReq();
    final FetchBlockIdAtDepthRes response = await ref.read(nodeStubProvider).fetchBlockIdAtDepth(request);
    return response;
  }

  Future<FetchBlockIdAtHeightRes> fetchBlockIdAtHeight() async {
    final FetchBlockIdAtHeightReq request = FetchBlockIdAtHeightReq();
    final FetchBlockIdAtHeightRes response = await ref.read(nodeStubProvider).fetchBlockIdAtHeight(request);
    return response;
  }

  Future<FetchBlockBodyRes> fetchBlockBody() async {
    final FetchBlockBodyReq request = FetchBlockBodyReq();
    final FetchBlockBodyRes response = await ref.read(nodeStubProvider).fetchBlockBody(request);
    return response;
  }

  Future<FetchBlockHeaderRes> fetchBlockHeader() async {
    final FetchBlockHeaderReq request = FetchBlockHeaderReq();
    final FetchBlockHeaderRes response = await ref.read(nodeStubProvider).fetchBlockHeader(request);
    return response;
  }

  Future<CurrentMempoolRes> currentMempool() async {
    final CurrentMempoolReq request = CurrentMempoolReq();
    final CurrentMempoolRes response = await ref.read(nodeStubProvider).currentMempool(request);
    return response;
  }
}
