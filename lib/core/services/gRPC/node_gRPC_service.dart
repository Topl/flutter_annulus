import 'package:flutter_annulus/core/services/gRPC/proto/brambl/models/transaction/io_transaction.pb.dart';
import 'package:flutter_annulus/core/services/gRPC/proto/node/services/bifrost_rpc.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final nodeGRPCProvider = Provider<NodeGRPCService>((ref) {
  return NodeGRPCService();
});

class NodeGRPCService extends NodeRpcServiceBase {
  @override
  Future<CurrentMempoolRes> currentMempool(ServiceCall call, CurrentMempoolReq request) {
    // TODO: implement currentMempool
    throw UnimplementedError();
  }

  @override
  Future<FetchBlockBodyRes> fetchBlockBody(ServiceCall call, FetchBlockBodyReq request) {
    // TODO: implement fetchBlockBody
    throw UnimplementedError();
  }

  @override
  Future<FetchBlockIdAtDepthRes> fetchBlockIdAtDepth(ServiceCall call, FetchBlockIdAtDepthReq request) {
    // TODO: implement fetchBlockIdAtDepth
    throw UnimplementedError();
  }

  @override
  Future<FetchBlockIdAtHeightRes> fetchBlockIdAtHeight(ServiceCall call, FetchBlockIdAtHeightReq request) {
    // TODO: implement fetchBlockIdAtHeight
    throw UnimplementedError();
  }

  /// Fetches
  @override
  Future<FetchTransactionRes> fetchTransaction(ServiceCall call, FetchTransactionReq request) async {
    final IoTransaction _transaction;

    return FetchTransactionRes(transaction: q);
  }

  /////////////////////////////
  /// Unused Query's

  @override
  Stream<SynchronizationTraversalRes> synchronizationTraversal(ServiceCall call, SynchronizationTraversalReq request) {
    // TODO: implement synchronizationTraversal
    throw UnimplementedError();
  }

  @override
  Future<FetchBlockHeaderRes> fetchBlockHeader(ServiceCall call, FetchBlockHeaderReq request) {
    // TODO: implement fetchBlockHeader
    throw UnimplementedError();
  }

  @override
  Future<BroadcastTransactionRes> broadcastTransaction(ServiceCall call, BroadcastTransactionReq request) {
    // TODO: implement broadcastTransaction
    throw UnimplementedError();
  }
}
