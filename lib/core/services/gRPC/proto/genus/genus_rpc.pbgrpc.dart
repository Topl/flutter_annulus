///
//  Generated code. Do not modify.
//  source: genus/genus_rpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'genus_rpc.pb.dart' as $0;
export 'genus_rpc.pb.dart';

class GenusFullBlockServiceClient extends $grpc.Client {
  static final _$getBlockById =
      $grpc.ClientMethod<$0.GetBlockByIdRequest, $0.BlockResponse>(
          '/co.topl.genus.services.GenusFullBlockService/getBlockById',
          ($0.GetBlockByIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.BlockResponse.fromBuffer(value));
  static final _$getBlockByHeight =
      $grpc.ClientMethod<$0.GetBlockByHeightRequest, $0.BlockResponse>(
          '/co.topl.genus.services.GenusFullBlockService/getBlockByHeight',
          ($0.GetBlockByHeightRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.BlockResponse.fromBuffer(value));
  static final _$getBlockByDepth =
      $grpc.ClientMethod<$0.GetBlockByDepthRequest, $0.BlockResponse>(
          '/co.topl.genus.services.GenusFullBlockService/getBlockByDepth',
          ($0.GetBlockByDepthRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.BlockResponse.fromBuffer(value));

  GenusFullBlockServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.BlockResponse> getBlockById(
      $0.GetBlockByIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockById, request, options: options);
  }

  $grpc.ResponseFuture<$0.BlockResponse> getBlockByHeight(
      $0.GetBlockByHeightRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockByHeight, request, options: options);
  }

  $grpc.ResponseFuture<$0.BlockResponse> getBlockByDepth(
      $0.GetBlockByDepthRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockByDepth, request, options: options);
  }
}

abstract class GenusFullBlockServiceBase extends $grpc.Service {
  $core.String get $name => 'co.topl.genus.services.GenusFullBlockService';

  GenusFullBlockServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetBlockByIdRequest, $0.BlockResponse>(
        'getBlockById',
        getBlockById_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetBlockByIdRequest.fromBuffer(value),
        ($0.BlockResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetBlockByHeightRequest, $0.BlockResponse>(
            'getBlockByHeight',
            getBlockByHeight_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetBlockByHeightRequest.fromBuffer(value),
            ($0.BlockResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBlockByDepthRequest, $0.BlockResponse>(
        'getBlockByDepth',
        getBlockByDepth_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetBlockByDepthRequest.fromBuffer(value),
        ($0.BlockResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.BlockResponse> getBlockById_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetBlockByIdRequest> request) async {
    return getBlockById(call, await request);
  }

  $async.Future<$0.BlockResponse> getBlockByHeight_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetBlockByHeightRequest> request) async {
    return getBlockByHeight(call, await request);
  }

  $async.Future<$0.BlockResponse> getBlockByDepth_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetBlockByDepthRequest> request) async {
    return getBlockByDepth(call, await request);
  }

  $async.Future<$0.BlockResponse> getBlockById(
      $grpc.ServiceCall call, $0.GetBlockByIdRequest request);
  $async.Future<$0.BlockResponse> getBlockByHeight(
      $grpc.ServiceCall call, $0.GetBlockByHeightRequest request);
  $async.Future<$0.BlockResponse> getBlockByDepth(
      $grpc.ServiceCall call, $0.GetBlockByDepthRequest request);
}

class TransactionServiceClient extends $grpc.Client {
  static final _$getTransactionById =
      $grpc.ClientMethod<$0.GetTransactionByIdRequest, $0.TransactionResponse>(
          '/co.topl.genus.services.TransactionService/getTransactionById',
          ($0.GetTransactionByIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TransactionResponse.fromBuffer(value));
  static final _$getTransactionByAddressStream = $grpc.ClientMethod<
          $0.QueryByAddressRequest, $0.TransactionResponse>(
      '/co.topl.genus.services.TransactionService/getTransactionByAddressStream',
      ($0.QueryByAddressRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.TransactionResponse.fromBuffer(value));
  static final _$getTxosByAddress =
      $grpc.ClientMethod<$0.QueryByAddressRequest, $0.TxoAddressResponse>(
          '/co.topl.genus.services.TransactionService/getTxosByAddress',
          ($0.QueryByAddressRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TxoAddressResponse.fromBuffer(value));
  static final _$getTxosByAddressStream =
      $grpc.ClientMethod<$0.QueryByAddressRequest, $0.TxoAddressResponse>(
          '/co.topl.genus.services.TransactionService/getTxosByAddressStream',
          ($0.QueryByAddressRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TxoAddressResponse.fromBuffer(value));
  static final _$getTxosByAssetLabel =
      $grpc.ClientMethod<$0.QueryByAssetLabelRequest, $0.TxoResponse>(
          '/co.topl.genus.services.TransactionService/getTxosByAssetLabel',
          ($0.QueryByAssetLabelRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TxoResponse.fromBuffer(value));
  static final _$createOnChainTransactionIndex = $grpc.ClientMethod<
          $0.CreateOnChainTransactionIndexRequest,
          $0.CreateOnChainTransactionIndexResponse>(
      '/co.topl.genus.services.TransactionService/createOnChainTransactionIndex',
      ($0.CreateOnChainTransactionIndexRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateOnChainTransactionIndexResponse.fromBuffer(value));
  static final _$getExistingTransactionIndexes = $grpc.ClientMethod<
          $0.GetExistingTransactionIndexesRequest,
          $0.GetExistingTransactionIndexesResponse>(
      '/co.topl.genus.services.TransactionService/getExistingTransactionIndexes',
      ($0.GetExistingTransactionIndexesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetExistingTransactionIndexesResponse.fromBuffer(value));
  static final _$getIndexedTransactions = $grpc.ClientMethod<
          $0.GetIndexedTransactionsRequest, $0.TransactionResponse>(
      '/co.topl.genus.services.TransactionService/getIndexedTransactions',
      ($0.GetIndexedTransactionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.TransactionResponse.fromBuffer(value));
  static final _$dropIndex =
      $grpc.ClientMethod<$0.DropIndexRequest, $0.DropIndexResponse>(
          '/co.topl.genus.services.TransactionService/dropIndex',
          ($0.DropIndexRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DropIndexResponse.fromBuffer(value));

  TransactionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.TransactionResponse> getTransactionById(
      $0.GetTransactionByIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTransactionById, request, options: options);
  }

  $grpc.ResponseStream<$0.TransactionResponse> getTransactionByAddressStream(
      $0.QueryByAddressRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getTransactionByAddressStream, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.TxoAddressResponse> getTxosByAddress(
      $0.QueryByAddressRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTxosByAddress, request, options: options);
  }

  $grpc.ResponseStream<$0.TxoAddressResponse> getTxosByAddressStream(
      $0.QueryByAddressRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getTxosByAddressStream, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.TxoResponse> getTxosByAssetLabel(
      $0.QueryByAssetLabelRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getTxosByAssetLabel, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.CreateOnChainTransactionIndexResponse>
      createOnChainTransactionIndex(
          $0.CreateOnChainTransactionIndexRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOnChainTransactionIndex, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetExistingTransactionIndexesResponse>
      getExistingTransactionIndexes(
          $0.GetExistingTransactionIndexesRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getExistingTransactionIndexes, request,
        options: options);
  }

  $grpc.ResponseStream<$0.TransactionResponse> getIndexedTransactions(
      $0.GetIndexedTransactionsRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getIndexedTransactions, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.DropIndexResponse> dropIndex(
      $0.DropIndexRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dropIndex, request, options: options);
  }
}

abstract class TransactionServiceBase extends $grpc.Service {
  $core.String get $name => 'co.topl.genus.services.TransactionService';

  TransactionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetTransactionByIdRequest,
            $0.TransactionResponse>(
        'getTransactionById',
        getTransactionById_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetTransactionByIdRequest.fromBuffer(value),
        ($0.TransactionResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.QueryByAddressRequest, $0.TransactionResponse>(
            'getTransactionByAddressStream',
            getTransactionByAddressStream_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.QueryByAddressRequest.fromBuffer(value),
            ($0.TransactionResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.QueryByAddressRequest, $0.TxoAddressResponse>(
            'getTxosByAddress',
            getTxosByAddress_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryByAddressRequest.fromBuffer(value),
            ($0.TxoAddressResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.QueryByAddressRequest, $0.TxoAddressResponse>(
            'getTxosByAddressStream',
            getTxosByAddressStream_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.QueryByAddressRequest.fromBuffer(value),
            ($0.TxoAddressResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryByAssetLabelRequest, $0.TxoResponse>(
        'getTxosByAssetLabel',
        getTxosByAssetLabel_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.QueryByAssetLabelRequest.fromBuffer(value),
        ($0.TxoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateOnChainTransactionIndexRequest,
            $0.CreateOnChainTransactionIndexResponse>(
        'createOnChainTransactionIndex',
        createOnChainTransactionIndex_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateOnChainTransactionIndexRequest.fromBuffer(value),
        ($0.CreateOnChainTransactionIndexResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetExistingTransactionIndexesRequest,
            $0.GetExistingTransactionIndexesResponse>(
        'getExistingTransactionIndexes',
        getExistingTransactionIndexes_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetExistingTransactionIndexesRequest.fromBuffer(value),
        ($0.GetExistingTransactionIndexesResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetIndexedTransactionsRequest,
            $0.TransactionResponse>(
        'getIndexedTransactions',
        getIndexedTransactions_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.GetIndexedTransactionsRequest.fromBuffer(value),
        ($0.TransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DropIndexRequest, $0.DropIndexResponse>(
        'dropIndex',
        dropIndex_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DropIndexRequest.fromBuffer(value),
        ($0.DropIndexResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.TransactionResponse> getTransactionById_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetTransactionByIdRequest> request) async {
    return getTransactionById(call, await request);
  }

  $async.Stream<$0.TransactionResponse> getTransactionByAddressStream_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryByAddressRequest> request) async* {
    yield* getTransactionByAddressStream(call, await request);
  }

  $async.Future<$0.TxoAddressResponse> getTxosByAddress_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryByAddressRequest> request) async {
    return getTxosByAddress(call, await request);
  }

  $async.Stream<$0.TxoAddressResponse> getTxosByAddressStream_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryByAddressRequest> request) async* {
    yield* getTxosByAddressStream(call, await request);
  }

  $async.Stream<$0.TxoResponse> getTxosByAssetLabel_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryByAssetLabelRequest> request) async* {
    yield* getTxosByAssetLabel(call, await request);
  }

  $async.Future<$0.CreateOnChainTransactionIndexResponse>
      createOnChainTransactionIndex_Pre(
          $grpc.ServiceCall call,
          $async.Future<$0.CreateOnChainTransactionIndexRequest>
              request) async {
    return createOnChainTransactionIndex(call, await request);
  }

  $async.Future<$0.GetExistingTransactionIndexesResponse>
      getExistingTransactionIndexes_Pre(
          $grpc.ServiceCall call,
          $async.Future<$0.GetExistingTransactionIndexesRequest>
              request) async {
    return getExistingTransactionIndexes(call, await request);
  }

  $async.Stream<$0.TransactionResponse> getIndexedTransactions_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetIndexedTransactionsRequest> request) async* {
    yield* getIndexedTransactions(call, await request);
  }

  $async.Future<$0.DropIndexResponse> dropIndex_Pre($grpc.ServiceCall call,
      $async.Future<$0.DropIndexRequest> request) async {
    return dropIndex(call, await request);
  }

  $async.Future<$0.TransactionResponse> getTransactionById(
      $grpc.ServiceCall call, $0.GetTransactionByIdRequest request);
  $async.Stream<$0.TransactionResponse> getTransactionByAddressStream(
      $grpc.ServiceCall call, $0.QueryByAddressRequest request);
  $async.Future<$0.TxoAddressResponse> getTxosByAddress(
      $grpc.ServiceCall call, $0.QueryByAddressRequest request);
  $async.Stream<$0.TxoAddressResponse> getTxosByAddressStream(
      $grpc.ServiceCall call, $0.QueryByAddressRequest request);
  $async.Stream<$0.TxoResponse> getTxosByAssetLabel(
      $grpc.ServiceCall call, $0.QueryByAssetLabelRequest request);
  $async.Future<$0.CreateOnChainTransactionIndexResponse>
      createOnChainTransactionIndex($grpc.ServiceCall call,
          $0.CreateOnChainTransactionIndexRequest request);
  $async.Future<$0.GetExistingTransactionIndexesResponse>
      getExistingTransactionIndexes($grpc.ServiceCall call,
          $0.GetExistingTransactionIndexesRequest request);
  $async.Stream<$0.TransactionResponse> getIndexedTransactions(
      $grpc.ServiceCall call, $0.GetIndexedTransactionsRequest request);
  $async.Future<$0.DropIndexResponse> dropIndex(
      $grpc.ServiceCall call, $0.DropIndexRequest request);
}
