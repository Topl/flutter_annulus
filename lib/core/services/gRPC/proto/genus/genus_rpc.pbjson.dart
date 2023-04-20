///
//  Generated code. Do not modify.
//  source: genus/genus_rpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getExistingTransactionIndexesResponseDescriptor instead')
const GetExistingTransactionIndexesResponse$json = const {
  '1': 'GetExistingTransactionIndexesResponse',
  '2': const [
    const {'1': 'indexSpecs', '3': 1, '4': 1, '5': 11, '6': '.co.topl.genus.services.IndexSpecs', '8': const {}, '10': 'indexSpecs'},
  ],
};

/// Descriptor for `GetExistingTransactionIndexesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getExistingTransactionIndexesResponseDescriptor = $convert.base64Decode('CiVHZXRFeGlzdGluZ1RyYW5zYWN0aW9uSW5kZXhlc1Jlc3BvbnNlEkwKCmluZGV4U3BlY3MYASABKAsyIi5jby50b3BsLmdlbnVzLnNlcnZpY2VzLkluZGV4U3BlY3NCCPpCBYoBAhABUgppbmRleFNwZWNz');
@$core.Deprecated('Use blockResponseDescriptor instead')
const BlockResponse$json = const {
  '1': 'BlockResponse',
  '2': const [
    const {'1': 'block', '3': 1, '4': 1, '5': 11, '6': '.co.topl.node.models.FullBlock', '8': const {}, '10': 'block'},
  ],
};

/// Descriptor for `BlockResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockResponseDescriptor = $convert.base64Decode('Cg1CbG9ja1Jlc3BvbnNlEj4KBWJsb2NrGAEgASgLMh4uY28udG9wbC5ub2RlLm1vZGVscy5GdWxsQmxvY2tCCPpCBYoBAhABUgVibG9jaw==');
@$core.Deprecated('Use transactionResponseDescriptor instead')
const TransactionResponse$json = const {
  '1': 'TransactionResponse',
  '2': const [
    const {'1': 'transactionReceipt', '3': 1, '4': 1, '5': 11, '6': '.co.topl.genus.services.TransactionReceipt', '8': const {}, '10': 'transactionReceipt'},
  ],
};

/// Descriptor for `TransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionResponseDescriptor = $convert.base64Decode('ChNUcmFuc2FjdGlvblJlc3BvbnNlEmQKEnRyYW5zYWN0aW9uUmVjZWlwdBgBIAEoCzIqLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuVHJhbnNhY3Rpb25SZWNlaXB0Qgj6QgWKAQIQAVISdHJhbnNhY3Rpb25SZWNlaXB0');
@$core.Deprecated('Use txoResponseDescriptor instead')
const TxoResponse$json = const {
  '1': 'TxoResponse',
  '2': const [
    const {'1': 'txo', '3': 1, '4': 1, '5': 11, '6': '.co.topl.genus.services.Txo', '8': const {}, '10': 'txo'},
  ],
};

/// Descriptor for `TxoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txoResponseDescriptor = $convert.base64Decode('CgtUeG9SZXNwb25zZRI3CgN0eG8YASABKAsyGy5jby50b3BsLmdlbnVzLnNlcnZpY2VzLlR4b0II+kIFigECEAFSA3R4bw==');
@$core.Deprecated('Use getBlockByIdRequestDescriptor instead')
const GetBlockByIdRequest$json = const {
  '1': 'GetBlockByIdRequest',
  '2': const [
    const {'1': 'blockId', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockId', '8': const {}, '10': 'blockId'},
    const {'1': 'confidenceFactor', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.ConfidenceFactor', '10': 'confidenceFactor'},
  ],
};

/// Descriptor for `GetBlockByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockByIdRequestDescriptor = $convert.base64Decode('ChNHZXRCbG9ja0J5SWRSZXF1ZXN0EkUKB2Jsb2NrSWQYASABKAsyIS5jby50b3BsLmNvbnNlbnN1cy5tb2RlbHMuQmxvY2tJZEII+kIFigECEAFSB2Jsb2NrSWQSVAoQY29uZmlkZW5jZUZhY3RvchgCIAEoCzIoLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuQ29uZmlkZW5jZUZhY3RvclIQY29uZmlkZW5jZUZhY3Rvcg==');
@$core.Deprecated('Use getBlockByHeightRequestDescriptor instead')
const GetBlockByHeightRequest$json = const {
  '1': 'GetBlockByHeightRequest',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 11, '6': '.co.topl.genus.services.ChainDistance', '8': const {}, '10': 'height'},
    const {'1': 'confidenceFactor', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.ConfidenceFactor', '10': 'confidenceFactor'},
  ],
};

/// Descriptor for `GetBlockByHeightRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockByHeightRequestDescriptor = $convert.base64Decode('ChdHZXRCbG9ja0J5SGVpZ2h0UmVxdWVzdBJHCgZoZWlnaHQYASABKAsyJS5jby50b3BsLmdlbnVzLnNlcnZpY2VzLkNoYWluRGlzdGFuY2VCCPpCBYoBAhABUgZoZWlnaHQSVAoQY29uZmlkZW5jZUZhY3RvchgCIAEoCzIoLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuQ29uZmlkZW5jZUZhY3RvclIQY29uZmlkZW5jZUZhY3Rvcg==');
@$core.Deprecated('Use getBlockByDepthRequestDescriptor instead')
const GetBlockByDepthRequest$json = const {
  '1': 'GetBlockByDepthRequest',
  '2': const [
    const {'1': 'depth', '3': 1, '4': 1, '5': 11, '6': '.co.topl.genus.services.ChainDistance', '8': const {}, '10': 'depth'},
    const {'1': 'confidenceFactor', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.ConfidenceFactor', '10': 'confidenceFactor'},
  ],
};

/// Descriptor for `GetBlockByDepthRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockByDepthRequestDescriptor = $convert.base64Decode('ChZHZXRCbG9ja0J5RGVwdGhSZXF1ZXN0EkUKBWRlcHRoGAEgASgLMiUuY28udG9wbC5nZW51cy5zZXJ2aWNlcy5DaGFpbkRpc3RhbmNlQgj6QgWKAQIQAVIFZGVwdGgSVAoQY29uZmlkZW5jZUZhY3RvchgCIAEoCzIoLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuQ29uZmlkZW5jZUZhY3RvclIQY29uZmlkZW5jZUZhY3Rvcg==');
@$core.Deprecated('Use getTransactionByIdRequestDescriptor instead')
const GetTransactionByIdRequest$json = const {
  '1': 'GetTransactionByIdRequest',
  '2': const [
    const {'1': 'transactionId', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.IoTransaction32', '8': const {}, '10': 'transactionId'},
    const {'1': 'confidenceFactor', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.ConfidenceFactor', '10': 'confidenceFactor'},
  ],
};

/// Descriptor for `GetTransactionByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionByIdRequestDescriptor = $convert.base64Decode('ChlHZXRUcmFuc2FjdGlvbkJ5SWRSZXF1ZXN0EmEKDXRyYW5zYWN0aW9uSWQYASABKAsyMS5jby50b3BsLmJyYW1ibC5tb2RlbHMuSWRlbnRpZmllci5Jb1RyYW5zYWN0aW9uMzJCCPpCBYoBAhABUg10cmFuc2FjdGlvbklkElQKEGNvbmZpZGVuY2VGYWN0b3IYAiABKAsyKC5jby50b3BsLmdlbnVzLnNlcnZpY2VzLkNvbmZpZGVuY2VGYWN0b3JSEGNvbmZpZGVuY2VGYWN0b3I=');
@$core.Deprecated('Use createOnChainTransactionIndexResponseDescriptor instead')
const CreateOnChainTransactionIndexResponse$json = const {
  '1': 'CreateOnChainTransactionIndexResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 8, '10': 'ok'},
  ],
};

/// Descriptor for `CreateOnChainTransactionIndexResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOnChainTransactionIndexResponseDescriptor = $convert.base64Decode('CiVDcmVhdGVPbkNoYWluVHJhbnNhY3Rpb25JbmRleFJlc3BvbnNlEg4KAm9rGAEgASgIUgJvaw==');
@$core.Deprecated('Use queryByAddressRequestDescriptor instead')
const QueryByAddressRequest$json = const {
  '1': 'QueryByAddressRequest',
  '2': const [
    const {'1': 'addresses', '3': 1, '4': 3, '5': 11, '6': '.co.topl.brambl.models.Address', '10': 'addresses'},
    const {'1': 'confidenceFactor', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.ConfidenceFactor', '10': 'confidenceFactor'},
  ],
};

/// Descriptor for `QueryByAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryByAddressRequestDescriptor = $convert.base64Decode('ChVRdWVyeUJ5QWRkcmVzc1JlcXVlc3QSPAoJYWRkcmVzc2VzGAEgAygLMh4uY28udG9wbC5icmFtYmwubW9kZWxzLkFkZHJlc3NSCWFkZHJlc3NlcxJUChBjb25maWRlbmNlRmFjdG9yGAIgASgLMiguY28udG9wbC5nZW51cy5zZXJ2aWNlcy5Db25maWRlbmNlRmFjdG9yUhBjb25maWRlbmNlRmFjdG9y');
@$core.Deprecated('Use queryByAssetLabelRequestDescriptor instead')
const QueryByAssetLabelRequest$json = const {
  '1': 'QueryByAssetLabelRequest',
  '2': const [
    const {'1': 'assetLabel', '3': 1, '4': 1, '5': 11, '6': '.co.topl.genus.services.AssetLabel', '8': const {}, '10': 'assetLabel'},
    const {'1': 'confidenceFactor', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.ConfidenceFactor', '10': 'confidenceFactor'},
  ],
};

/// Descriptor for `QueryByAssetLabelRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryByAssetLabelRequestDescriptor = $convert.base64Decode('ChhRdWVyeUJ5QXNzZXRMYWJlbFJlcXVlc3QSTAoKYXNzZXRMYWJlbBgBIAEoCzIiLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuQXNzZXRMYWJlbEII+kIFigECEAFSCmFzc2V0TGFiZWwSVAoQY29uZmlkZW5jZUZhY3RvchgCIAEoCzIoLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuQ29uZmlkZW5jZUZhY3RvclIQY29uZmlkZW5jZUZhY3Rvcg==');
@$core.Deprecated('Use txoAddressResponseDescriptor instead')
const TxoAddressResponse$json = const {
  '1': 'TxoAddressResponse',
  '2': const [
    const {'1': 'addressesToTxos', '3': 1, '4': 3, '5': 11, '6': '.co.topl.genus.services.TxoAddressResponse.AddressesToTxosEntry', '10': 'addressesToTxos'},
  ],
  '3': const [TxoAddressResponse_AddressesToTxosEntry$json, TxoAddressResponse_Txos$json],
};

@$core.Deprecated('Use txoAddressResponseDescriptor instead')
const TxoAddressResponse_AddressesToTxosEntry$json = const {
  '1': 'AddressesToTxosEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.Txo', '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use txoAddressResponseDescriptor instead')
const TxoAddressResponse_Txos$json = const {
  '1': 'Txos',
  '2': const [
    const {'1': 'txo', '3': 1, '4': 3, '5': 11, '6': '.co.topl.genus.services.Txo', '10': 'txo'},
  ],
};

/// Descriptor for `TxoAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txoAddressResponseDescriptor = $convert.base64Decode('ChJUeG9BZGRyZXNzUmVzcG9uc2USaQoPYWRkcmVzc2VzVG9UeG9zGAEgAygLMj8uY28udG9wbC5nZW51cy5zZXJ2aWNlcy5UeG9BZGRyZXNzUmVzcG9uc2UuQWRkcmVzc2VzVG9UeG9zRW50cnlSD2FkZHJlc3Nlc1RvVHhvcxpfChRBZGRyZXNzZXNUb1R4b3NFbnRyeRIQCgNrZXkYASABKAlSA2tleRIxCgV2YWx1ZRgCIAEoCzIbLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuVHhvUgV2YWx1ZToCOAEaNQoEVHhvcxItCgN0eG8YASADKAsyGy5jby50b3BsLmdlbnVzLnNlcnZpY2VzLlR4b1IDdHhv');
@$core.Deprecated('Use createOnChainTransactionIndexRequestDescriptor instead')
const CreateOnChainTransactionIndexRequest$json = const {
  '1': 'CreateOnChainTransactionIndexRequest',
  '2': const [
    const {'1': 'indexSpec', '3': 1, '4': 1, '5': 11, '6': '.co.topl.genus.services.IndexSpec', '8': const {}, '10': 'indexSpec'},
    const {'1': 'populate', '3': 2, '4': 1, '5': 8, '10': 'populate'},
  ],
};

/// Descriptor for `CreateOnChainTransactionIndexRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOnChainTransactionIndexRequestDescriptor = $convert.base64Decode('CiRDcmVhdGVPbkNoYWluVHJhbnNhY3Rpb25JbmRleFJlcXVlc3QSSQoJaW5kZXhTcGVjGAEgASgLMiEuY28udG9wbC5nZW51cy5zZXJ2aWNlcy5JbmRleFNwZWNCCPpCBYoBAhABUglpbmRleFNwZWMSGgoIcG9wdWxhdGUYAiABKAhSCHBvcHVsYXRl');
@$core.Deprecated('Use indexSpecsDescriptor instead')
const IndexSpecs$json = const {
  '1': 'IndexSpecs',
  '2': const [
    const {'1': 'indexSpec', '3': 1, '4': 3, '5': 11, '6': '.co.topl.genus.services.IndexSpec', '10': 'indexSpec'},
  ],
};

/// Descriptor for `IndexSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indexSpecsDescriptor = $convert.base64Decode('CgpJbmRleFNwZWNzEj8KCWluZGV4U3BlYxgBIAMoCzIhLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuSW5kZXhTcGVjUglpbmRleFNwZWM=');
@$core.Deprecated('Use indexDefDescriptor instead')
const IndexDef$json = const {
  '1': 'IndexDef',
  '2': const [
    const {'1': 'onChain', '3': 1, '4': 1, '5': 11, '6': '.co.topl.genus.services.CreateOnChainTransactionIndexRequest', '9': 0, '10': 'onChain'},
  ],
  '8': const [
    const {'1': 'xdev'},
  ],
};

/// Descriptor for `IndexDef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indexDefDescriptor = $convert.base64Decode('CghJbmRleERlZhJYCgdvbkNoYWluGAEgASgLMjwuY28udG9wbC5nZW51cy5zZXJ2aWNlcy5DcmVhdGVPbkNoYWluVHJhbnNhY3Rpb25JbmRleFJlcXVlc3RIAFIHb25DaGFpbkIGCgR4ZGV2');
@$core.Deprecated('Use getExistingTransactionIndexesRequestDescriptor instead')
const GetExistingTransactionIndexesRequest$json = const {
  '1': 'GetExistingTransactionIndexesRequest',
};

/// Descriptor for `GetExistingTransactionIndexesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getExistingTransactionIndexesRequestDescriptor = $convert.base64Decode('CiRHZXRFeGlzdGluZ1RyYW5zYWN0aW9uSW5kZXhlc1JlcXVlc3Q=');
@$core.Deprecated('Use dropIndexRequestDescriptor instead')
const DropIndexRequest$json = const {
  '1': 'DropIndexRequest',
  '2': const [
    const {'1': 'indexName', '3': 1, '4': 1, '5': 9, '10': 'indexName'},
  ],
};

/// Descriptor for `DropIndexRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dropIndexRequestDescriptor = $convert.base64Decode('ChBEcm9wSW5kZXhSZXF1ZXN0EhwKCWluZGV4TmFtZRgBIAEoCVIJaW5kZXhOYW1l');
@$core.Deprecated('Use dropIndexResponseDescriptor instead')
const DropIndexResponse$json = const {
  '1': 'DropIndexResponse',
  '2': const [
    const {'1': 'dropped', '3': 1, '4': 1, '5': 8, '10': 'dropped'},
  ],
};

/// Descriptor for `DropIndexResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dropIndexResponseDescriptor = $convert.base64Decode('ChFEcm9wSW5kZXhSZXNwb25zZRIYCgdkcm9wcGVkGAEgASgIUgdkcm9wcGVk');
@$core.Deprecated('Use getIndexedTransactionsRequestDescriptor instead')
const GetIndexedTransactionsRequest$json = const {
  '1': 'GetIndexedTransactionsRequest',
  '2': const [
    const {'1': 'indexName', '3': 1, '4': 1, '5': 9, '10': 'indexName'},
    const {'1': 'value', '3': 2, '4': 3, '5': 11, '6': '.co.topl.genus.services.IndexMatchValue', '10': 'value'},
    const {'1': 'maxResults', '3': 3, '4': 1, '5': 13, '10': 'maxResults'},
    const {'1': 'skipResults', '3': 4, '4': 1, '5': 4, '10': 'skipResults'},
  ],
};

/// Descriptor for `GetIndexedTransactionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIndexedTransactionsRequestDescriptor = $convert.base64Decode('Ch1HZXRJbmRleGVkVHJhbnNhY3Rpb25zUmVxdWVzdBIcCglpbmRleE5hbWUYASABKAlSCWluZGV4TmFtZRI9CgV2YWx1ZRgCIAMoCzInLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuSW5kZXhNYXRjaFZhbHVlUgV2YWx1ZRIeCgptYXhSZXN1bHRzGAMgASgNUgptYXhSZXN1bHRzEiAKC3NraXBSZXN1bHRzGAQgASgEUgtza2lwUmVzdWx0cw==');
@$core.Deprecated('Use indexMatchValueDescriptor instead')
const IndexMatchValue$json = const {
  '1': 'IndexMatchValue',
  '2': const [
    const {'1': 'stringValue', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
    const {'1': 'intValue', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'intValue'},
    const {'1': 'uintValue', '3': 3, '4': 1, '5': 4, '9': 0, '10': 'uintValue'},
    const {'1': 'fieldName', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'fieldName'},
  ],
  '8': const [
    const {'1': 'value'},
  ],
};

/// Descriptor for `IndexMatchValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indexMatchValueDescriptor = $convert.base64Decode('Cg9JbmRleE1hdGNoVmFsdWUSIgoLc3RyaW5nVmFsdWUYASABKAlIAFILc3RyaW5nVmFsdWUSHAoIaW50VmFsdWUYAiABKANIAFIIaW50VmFsdWUSHgoJdWludFZhbHVlGAMgASgESABSCXVpbnRWYWx1ZRI6CglmaWVsZE5hbWUYBCABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCWZpZWxkTmFtZUIHCgV2YWx1ZQ==');
