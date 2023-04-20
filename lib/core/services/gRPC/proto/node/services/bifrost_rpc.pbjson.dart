///
//  Generated code. Do not modify.
//  source: node/services/bifrost_rpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use broadcastTransactionReqDescriptor instead')
const BroadcastTransactionReq$json = const {
  '1': 'BroadcastTransactionReq',
  '2': const [
    const {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.transaction.IoTransaction', '8': const {}, '10': 'transaction'},
  ],
};

/// Descriptor for `BroadcastTransactionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastTransactionReqDescriptor = $convert.base64Decode('ChdCcm9hZGNhc3RUcmFuc2FjdGlvblJlcRJcCgt0cmFuc2FjdGlvbhgBIAEoCzIwLmNvLnRvcGwuYnJhbWJsLm1vZGVscy50cmFuc2FjdGlvbi5Jb1RyYW5zYWN0aW9uQgj6QgWKAQIQAVILdHJhbnNhY3Rpb24=');
@$core.Deprecated('Use broadcastTransactionResDescriptor instead')
const BroadcastTransactionRes$json = const {
  '1': 'BroadcastTransactionRes',
};

/// Descriptor for `BroadcastTransactionRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastTransactionResDescriptor = $convert.base64Decode('ChdCcm9hZGNhc3RUcmFuc2FjdGlvblJlcw==');
@$core.Deprecated('Use currentMempoolReqDescriptor instead')
const CurrentMempoolReq$json = const {
  '1': 'CurrentMempoolReq',
};

/// Descriptor for `CurrentMempoolReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List currentMempoolReqDescriptor = $convert.base64Decode('ChFDdXJyZW50TWVtcG9vbFJlcQ==');
@$core.Deprecated('Use currentMempoolResDescriptor instead')
const CurrentMempoolRes$json = const {
  '1': 'CurrentMempoolRes',
  '2': const [
    const {'1': 'transactionIds', '3': 1, '4': 3, '5': 11, '6': '.co.topl.brambl.models.Identifier.IoTransaction32', '10': 'transactionIds'},
  ],
};

/// Descriptor for `CurrentMempoolRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List currentMempoolResDescriptor = $convert.base64Decode('ChFDdXJyZW50TWVtcG9vbFJlcxJZCg50cmFuc2FjdGlvbklkcxgBIAMoCzIxLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5JZGVudGlmaWVyLklvVHJhbnNhY3Rpb24zMlIOdHJhbnNhY3Rpb25JZHM=');
@$core.Deprecated('Use fetchBlockHeaderReqDescriptor instead')
const FetchBlockHeaderReq$json = const {
  '1': 'FetchBlockHeaderReq',
  '2': const [
    const {'1': 'blockId', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockId', '8': const {}, '10': 'blockId'},
  ],
};

/// Descriptor for `FetchBlockHeaderReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchBlockHeaderReqDescriptor = $convert.base64Decode('ChNGZXRjaEJsb2NrSGVhZGVyUmVxEkUKB2Jsb2NrSWQYASABKAsyIS5jby50b3BsLmNvbnNlbnN1cy5tb2RlbHMuQmxvY2tJZEII+kIFigECEAFSB2Jsb2NrSWQ=');
@$core.Deprecated('Use fetchBlockHeaderResDescriptor instead')
const FetchBlockHeaderRes$json = const {
  '1': 'FetchBlockHeaderRes',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockHeader', '10': 'header'},
  ],
};

/// Descriptor for `FetchBlockHeaderRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchBlockHeaderResDescriptor = $convert.base64Decode('ChNGZXRjaEJsb2NrSGVhZGVyUmVzEj0KBmhlYWRlchgBIAEoCzIlLmNvLnRvcGwuY29uc2Vuc3VzLm1vZGVscy5CbG9ja0hlYWRlclIGaGVhZGVy');
@$core.Deprecated('Use fetchBlockBodyReqDescriptor instead')
const FetchBlockBodyReq$json = const {
  '1': 'FetchBlockBodyReq',
  '2': const [
    const {'1': 'blockId', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockId', '8': const {}, '10': 'blockId'},
  ],
};

/// Descriptor for `FetchBlockBodyReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchBlockBodyReqDescriptor = $convert.base64Decode('ChFGZXRjaEJsb2NrQm9keVJlcRJFCgdibG9ja0lkGAEgASgLMiEuY28udG9wbC5jb25zZW5zdXMubW9kZWxzLkJsb2NrSWRCCPpCBYoBAhABUgdibG9ja0lk');
@$core.Deprecated('Use fetchBlockBodyResDescriptor instead')
const FetchBlockBodyRes$json = const {
  '1': 'FetchBlockBodyRes',
  '2': const [
    const {'1': 'body', '3': 1, '4': 1, '5': 11, '6': '.co.topl.node.models.BlockBody', '10': 'body'},
  ],
};

/// Descriptor for `FetchBlockBodyRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchBlockBodyResDescriptor = $convert.base64Decode('ChFGZXRjaEJsb2NrQm9keVJlcxIyCgRib2R5GAEgASgLMh4uY28udG9wbC5ub2RlLm1vZGVscy5CbG9ja0JvZHlSBGJvZHk=');
@$core.Deprecated('Use fetchTransactionReqDescriptor instead')
const FetchTransactionReq$json = const {
  '1': 'FetchTransactionReq',
  '2': const [
    const {'1': 'transactionId', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.IoTransaction32', '8': const {}, '10': 'transactionId'},
  ],
};

/// Descriptor for `FetchTransactionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchTransactionReqDescriptor = $convert.base64Decode('ChNGZXRjaFRyYW5zYWN0aW9uUmVxEmEKDXRyYW5zYWN0aW9uSWQYASABKAsyMS5jby50b3BsLmJyYW1ibC5tb2RlbHMuSWRlbnRpZmllci5Jb1RyYW5zYWN0aW9uMzJCCPpCBYoBAhABUg10cmFuc2FjdGlvbklk');
@$core.Deprecated('Use fetchTransactionResDescriptor instead')
const FetchTransactionRes$json = const {
  '1': 'FetchTransactionRes',
  '2': const [
    const {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.transaction.IoTransaction', '10': 'transaction'},
  ],
};

/// Descriptor for `FetchTransactionRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchTransactionResDescriptor = $convert.base64Decode('ChNGZXRjaFRyYW5zYWN0aW9uUmVzElIKC3RyYW5zYWN0aW9uGAEgASgLMjAuY28udG9wbC5icmFtYmwubW9kZWxzLnRyYW5zYWN0aW9uLklvVHJhbnNhY3Rpb25SC3RyYW5zYWN0aW9u');
@$core.Deprecated('Use fetchBlockIdAtHeightReqDescriptor instead')
const FetchBlockIdAtHeightReq$json = const {
  '1': 'FetchBlockIdAtHeightReq',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 4, '10': 'height'},
  ],
};

/// Descriptor for `FetchBlockIdAtHeightReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchBlockIdAtHeightReqDescriptor = $convert.base64Decode('ChdGZXRjaEJsb2NrSWRBdEhlaWdodFJlcRIWCgZoZWlnaHQYASABKARSBmhlaWdodA==');
@$core.Deprecated('Use fetchBlockIdAtHeightResDescriptor instead')
const FetchBlockIdAtHeightRes$json = const {
  '1': 'FetchBlockIdAtHeightRes',
  '2': const [
    const {'1': 'blockId', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockId', '10': 'blockId'},
  ],
};

/// Descriptor for `FetchBlockIdAtHeightRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchBlockIdAtHeightResDescriptor = $convert.base64Decode('ChdGZXRjaEJsb2NrSWRBdEhlaWdodFJlcxI7CgdibG9ja0lkGAEgASgLMiEuY28udG9wbC5jb25zZW5zdXMubW9kZWxzLkJsb2NrSWRSB2Jsb2NrSWQ=');
@$core.Deprecated('Use fetchBlockIdAtDepthReqDescriptor instead')
const FetchBlockIdAtDepthReq$json = const {
  '1': 'FetchBlockIdAtDepthReq',
  '2': const [
    const {'1': 'depth', '3': 1, '4': 1, '5': 4, '10': 'depth'},
  ],
};

/// Descriptor for `FetchBlockIdAtDepthReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchBlockIdAtDepthReqDescriptor = $convert.base64Decode('ChZGZXRjaEJsb2NrSWRBdERlcHRoUmVxEhQKBWRlcHRoGAEgASgEUgVkZXB0aA==');
@$core.Deprecated('Use fetchBlockIdAtDepthResDescriptor instead')
const FetchBlockIdAtDepthRes$json = const {
  '1': 'FetchBlockIdAtDepthRes',
  '2': const [
    const {'1': 'blockId', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockId', '10': 'blockId'},
  ],
};

/// Descriptor for `FetchBlockIdAtDepthRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchBlockIdAtDepthResDescriptor = $convert.base64Decode('ChZGZXRjaEJsb2NrSWRBdERlcHRoUmVzEjsKB2Jsb2NrSWQYASABKAsyIS5jby50b3BsLmNvbnNlbnN1cy5tb2RlbHMuQmxvY2tJZFIHYmxvY2tJZA==');
@$core.Deprecated('Use synchronizationTraversalReqDescriptor instead')
const SynchronizationTraversalReq$json = const {
  '1': 'SynchronizationTraversalReq',
};

/// Descriptor for `SynchronizationTraversalReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List synchronizationTraversalReqDescriptor = $convert.base64Decode('ChtTeW5jaHJvbml6YXRpb25UcmF2ZXJzYWxSZXE=');
@$core.Deprecated('Use synchronizationTraversalResDescriptor instead')
const SynchronizationTraversalRes$json = const {
  '1': 'SynchronizationTraversalRes',
  '2': const [
    const {'1': 'applied', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockId', '9': 0, '10': 'applied'},
    const {'1': 'unapplied', '3': 2, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockId', '9': 0, '10': 'unapplied'},
  ],
  '8': const [
    const {'1': 'status'},
  ],
};

/// Descriptor for `SynchronizationTraversalRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List synchronizationTraversalResDescriptor = $convert.base64Decode('ChtTeW5jaHJvbml6YXRpb25UcmF2ZXJzYWxSZXMSPQoHYXBwbGllZBgBIAEoCzIhLmNvLnRvcGwuY29uc2Vuc3VzLm1vZGVscy5CbG9ja0lkSABSB2FwcGxpZWQSQQoJdW5hcHBsaWVkGAIgASgLMiEuY28udG9wbC5jb25zZW5zdXMubW9kZWxzLkJsb2NrSWRIAFIJdW5hcHBsaWVkQggKBnN0YXR1cw==');
