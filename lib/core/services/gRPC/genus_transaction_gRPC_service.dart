import 'package:flutter_annulus/core/services/gRPC/proto/genus/genus_rpc.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final genusTransactionGRPCServiceProvider = Provider<GenusTransactionGRPCService>((ref) {
  return GenusTransactionGRPCService();
});

class GenusTransactionGRPCService extends TransactionServiceBase {
  @override
  Future<GetExistingTransactionIndexesResponse> getExistingTransactionIndexes(
      ServiceCall call, GetExistingTransactionIndexesRequest request) {
    // TODO: implement getExistingTransactionIndexes
    throw UnimplementedError();
  }

  @override
  Stream<TransactionResponse> getIndexedTransactions(ServiceCall call, GetIndexedTransactionsRequest request) {
    // TODO: implement getIndexedTransactions
    throw UnimplementedError();
  }

  @override
  Stream<TransactionResponse> getTransactionByAddressStream(ServiceCall call, QueryByAddressRequest request) {
    // TODO: implement getTransactionByAddressStream
    throw UnimplementedError();
  }

  @override
  Future<TransactionResponse> getTransactionById(ServiceCall call, GetTransactionByIdRequest request) {
    // TODO: implement getTransactionById
    throw UnimplementedError();
  }

  @override
  Future<TxoAddressResponse> getTxosByAddress(ServiceCall call, QueryByAddressRequest request) {
    // TODO: implement getTxosByAddress
    throw UnimplementedError();
  }

  @override
  Stream<TxoAddressResponse> getTxosByAddressStream(ServiceCall call, QueryByAddressRequest request) {
    // TODO: implement getTxosByAddressStream
    throw UnimplementedError();
  }

  @override
  Stream<TxoResponse> getTxosByAssetLabel(ServiceCall call, QueryByAssetLabelRequest request) {
    // TODO: implement getTxosByAssetLabel
    throw UnimplementedError();
  }

  /////////////////////////////
  /// Unused Query's
  @override
  Future<CreateOnChainTransactionIndexResponse> createOnChainTransactionIndex(
      ServiceCall call, CreateOnChainTransactionIndexRequest request) {
    // TODO: implement createOnChainTransactionIndex
    throw UnimplementedError();
  }

  @override
  Future<DropIndexResponse> dropIndex(ServiceCall call, DropIndexRequest request) {
    // TODO: implement dropIndex
    throw UnimplementedError();
  }
}
