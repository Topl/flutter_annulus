import 'package:flutter_annulus/core/services/gRPC/proto/genus/genus_rpc.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final genusBlockGRPCServiceProvider = Provider<GenusBlockGRPCService>((ref) {
  return GenusBlockGRPCService();
});

class GenusBlockGRPCService extends GenusFullBlockServiceBase {
  @override
  Future<BlockResponse> getBlockByDepth(ServiceCall call, GetBlockByDepthRequest request) {
    // TODO: implement getBlockByDepth
    throw UnimplementedError();
  }

  @override
  Future<BlockResponse> getBlockByHeight(ServiceCall call, GetBlockByHeightRequest request) {
    // TODO: implement getBlockByHeight
    throw UnimplementedError();
  }

  @override
  Future<BlockResponse> getBlockById(ServiceCall call, GetBlockByIdRequest request) {
    // TODO: implement getBlockById
    throw UnimplementedError();
  }
}
