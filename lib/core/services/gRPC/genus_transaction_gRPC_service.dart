import 'package:fixnum/fixnum.dart';
import 'package:flutter_annulus/core/services/gRPC/proto/brambl/models/address.pb.dart';
import 'package:flutter_annulus/core/services/gRPC/proto/brambl/models/evidence.pb.dart';
import 'package:flutter_annulus/core/services/gRPC/proto/brambl/models/identifier.pb.dart';
import 'package:flutter_annulus/core/services/gRPC/proto/brambl/models/transaction/io_transaction.pb.dart';
import 'package:flutter_annulus/core/services/gRPC/proto/consensus/models/block_id.pb.dart';
import 'package:flutter_annulus/core/services/gRPC/proto/genus/genus_models.pb.dart';
import 'package:flutter_annulus/core/services/gRPC/proto/genus/genus_rpc.pbgrpc.dart';
import 'package:flutter_annulus/core/services/gRPC/proto/quivr/models/shared.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

ConfidenceFactor? _getConfidenceFactor(double? confidence) {
  return confidence == null
      ? null
      : ConfidenceFactor(
          value: confidence,
        );
}

/// TODO: Question, will genus block and tansaaction be the same channel?
final genusChannelProvider = Provider<ClientChannel>((ref) {
  return ClientChannel(
    'host',
    port: 9001,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
});

final genusBlockStubProvider = Provider<GenusFullBlockServiceClient>((ref) {
  return GenusFullBlockServiceClient(ref.read(genusChannelProvider));
});

final genusTransactionStubProvider = Provider<TransactionServiceClient>((ref) {
  return TransactionServiceClient(ref.read(genusChannelProvider));
});

final genusGRPCServiceProvider = Provider<GenusGRPCService>((ref) {
  return GenusGRPCService(ref);
});

class GenusGRPCService {
  final Ref ref;

  GenusGRPCService(this.ref);

  /////////////////////////////
  /// Blocks

  /// Returns a [BlockResponse] object for the block at the given [height] and [confidence].
  ///
  /// [height] is an [int] representing the block height to retrieve
  ///
  /// [confidence] is a [double] representing the confidence factor of the block to retrieve.
  ///
  /// Throws an [Exception] if an error occurs during the RPC request.
  Future<BlockResponse> getBlockByHeight({
    int? height,
    double? confidence,
  }) async {
    final ChainDistance? chainHeight = height == null
        ? null
        : ChainDistance(
            value: Int64(height),
          );

    final GetBlockByHeightRequest request = GetBlockByHeightRequest(
      confidenceFactor: _getConfidenceFactor(confidence),
      height: chainHeight,
    );
    final BlockResponse response = await ref.read(genusBlockStubProvider).getBlockByHeight(request);
    return response;
  }

  /// Returns a [BlockResponse] object for the block at the given [depth] and [confidence].
  ///
  /// [depth] is an [int] representing the block depth to retrieve
  ///
  /// [confidence] is a [double] representing the confidence factor of the block to retrieve.
  ///
  /// Throws an [Exception] if an error occurs during the RPC request.
  Future<BlockResponse> getBlockByDepth({
    int? depth,
    double? confidence,
  }) async {
    final ChainDistance? chainDistance = depth == null
        ? null
        : ChainDistance(
            value: Int64(depth),
          );

    final GetBlockByDepthRequest request = GetBlockByDepthRequest(
      depth: chainDistance,
      confidenceFactor: _getConfidenceFactor(confidence),
    );
    final BlockResponse response = await ref.read(genusBlockStubProvider).getBlockByDepth(request);
    return response;
  }

  /// Returns a [BlockResponse] object for the block at the given [blockId] and [confidence].
  ///
  /// [blockId] is a [List<int>] representing the block id to retrieve
  ///
  /// [confidence] is a [double] representing the confidence factor of the block to retrieve.
  ///
  /// Throws an [Exception] if an error occurs during the RPC request.
  Future<BlockResponse> getBlockById({
    List<int>? blockId,
    double? confidence,
  }) async {
    final BlockId? _blockId = blockId == null
        ? null
        : BlockId(
            value: blockId,
          );

    final GetBlockByIdRequest request = GetBlockByIdRequest(
      blockId: _blockId,
      confidenceFactor: _getConfidenceFactor(confidence),
    );
    final BlockResponse response = await ref.read(genusBlockStubProvider).getBlockById(request);
    return response;
  }

  /////////////////////////////
  /// Transactions

  /// Returns a [TransactionResponse] object for the transaction at the given [transactionId] and [confidence].
  ///
  /// [transactionId] is a [List<int>] representing the transaction id to retrieve
  ///
  /// [confidence] is a [double] representing the confidence factor of the transaction to retrieve.
  ///
  /// Throws an [Exception] if an error occurs during the RPC request.
  Future<TransactionResponse> getTransactionById({
    List<int>? transactionId,
    double? confidence,
  }) async {
    final digest = Digest_Digest32(value: transactionId);
    final Evidence_Sized32 evidence = Evidence_Sized32(digest: digest);
    final Identifier_IoTransaction32? _transactionId = transactionId == null
        ? null
        : Identifier_IoTransaction32(
            evidence: evidence,
          );
    final GetTransactionByIdRequest request = GetTransactionByIdRequest(
      confidenceFactor: _getConfidenceFactor(confidence),
      transactionId: _transactionId,
    );
    final TransactionResponse response = await ref.read(genusTransactionStubProvider).getTransactionById(request);
    return response;
  }

  Stream<TransactionResponse> getTransactionByAddressStream() async* {
    final QueryByAddressRequest request = QueryByAddressRequest();
    final stream = ref.read(genusTransactionStubProvider).getTransactionByAddressStream(request);

    await for (final response in stream) {
      yield response;
    }
  }

  /////////////////////////////
  /// Transaction Ouputs

  /// QQQQ finish this up
  Future<TxoAddressResponse> getTxOById({
    List<Address>? txOId,
    double? confidence,
  }) async {
    final Identifier id = Identifier();
    final Address address = Address(
        // id:
        );
    final QueryByAddressRequest request = QueryByAddressRequest();
    final TxoAddressResponse response = await ref.read(genusTransactionStubProvider).getTxosByAddress(request);
    return response;
  }

  Stream<TxoAddressResponse> getTxOByAddressStream() async* {
    final QueryByAddressRequest request = QueryByAddressRequest();
    final Stream<TxoAddressResponse> stream = ref.read(genusTransactionStubProvider).getTxosByAddressStream(request);

    await for (TxoAddressResponse response in stream) {
      yield response;
    }
  }

  Stream<TxoResponse> getTxOByAddress() async* {
    final QueryByAssetLabelRequest request = QueryByAssetLabelRequest();
    final Stream<TxoResponse> stream = ref.read(genusTransactionStubProvider).getTxosByAssetLabel(request);

    await for (TxoResponse response in stream) {
      yield response;
    }
  }
}
