import 'package:fixnum/fixnum.dart';
import 'package:flutter_annulus/core/services/gRPC/proto/consensus/models/block_id.pb.dart';
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

  // QQQQ need to do
  Future<FetchTransactionRes> fetchTransaction() async {
    final FetchTransactionReq request = FetchTransactionReq();
    final FetchTransactionRes response = await ref.read(nodeStubProvider).fetchTransaction(request);
    return response;
  }

  /// Returns a [FetchBlockIdAtDepthRes] object for the block at the given [depth].
  ///
  /// [depth] is an [int] representing the block depth to retrieve
  ///
  /// [options] is an [CallOptions] for runtime options with RPC
  ///
  /// Throws an [Exception] if an error occurs during the RPC request.
  Future<FetchBlockIdAtDepthRes> fetchBlockIdAtDepth({
    required int depth,
    CallOptions? options,
  }) async {
    final FetchBlockIdAtDepthReq request = FetchBlockIdAtDepthReq(depth: Int64(depth));
    final FetchBlockIdAtDepthRes response = await ref.read(nodeStubProvider).fetchBlockIdAtDepth(
          request,
          options: options,
        );
    return response;
  }

  /// Returns a [FetchBlockIdAtHeightRes] object for the block at the given [height].
  ///
  /// [height] is an [int] representing the block height to retrieve
  ///
  /// [options] is an [CallOptions] for runtime options with RPC
  ///
  /// Throws an [Exception] if an error occurs during the RPC request.
  Future<FetchBlockIdAtHeightRes> fetchBlockIdAtHeight({
    required int height,
    CallOptions? options,
  }) async {
    final FetchBlockIdAtHeightReq request = FetchBlockIdAtHeightReq(height: Int64(height));
    final FetchBlockIdAtHeightRes response = await ref.read(nodeStubProvider).fetchBlockIdAtHeight(
          request,
          options: options,
        );
    return response;
  }

  Future<FetchBlockBodyRes> fetchBlockBody({
    int? id,
  }) async {
    final BlockId id = BlockId(value: id);
    final FetchBlockBodyReq request = FetchBlockBodyReq();
    final FetchBlockBodyRes response = await ref.read(nodeStubProvider).fetchBlockBody(request);
    return response;
  }

  Future<FetchBlockHeaderRes> fetchBlockHeader() async {
    final FetchBlockHeaderReq request = FetchBlockHeaderReq();
    final FetchBlockHeaderRes response = await ref.read(nodeStubProvider).fetchBlockHeader(request);
    return response;
  }

  Future<CurrentMempoolRes> currentMempool({
    CallOptions? options,
  }) async {
    final CurrentMempoolReq request = CurrentMempoolReq();
    final CurrentMempoolRes response = await ref.read(nodeStubProvider).currentMempool(
          request,
          options: options,
        );
    return response;
  }
}
