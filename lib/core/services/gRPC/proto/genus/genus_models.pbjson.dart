///
//  Generated code. Do not modify.
//  source: genus/genus_models.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use txoStateDescriptor instead')
const TxoState$json = const {
  '1': 'TxoState',
  '2': const [
    const {'1': 'SPENT', '2': 0},
    const {'1': 'UNSPENT', '2': 1},
    const {'1': 'PENDING', '2': 2},
  ],
};

/// Descriptor for `TxoState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List txoStateDescriptor = $convert.base64Decode('CghUeG9TdGF0ZRIJCgVTUEVOVBAAEgsKB1VOU1BFTlQQARILCgdQRU5ESU5HEAI=');
@$core.Deprecated('Use sortOrderDescriptor instead')
const SortOrder$json = const {
  '1': 'SortOrder',
  '2': const [
    const {'1': 'ASCENDING', '2': 0},
    const {'1': 'DESCENDING', '2': 1},
    const {'1': 'UNSORTED', '2': 2},
  ],
};

/// Descriptor for `SortOrder`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sortOrderDescriptor = $convert.base64Decode('CglTb3J0T3JkZXISDQoJQVNDRU5ESU5HEAASDgoKREVTQ0VORElORxABEgwKCFVOU09SVEVEEAI=');
@$core.Deprecated('Use labelTypeDescriptor instead')
const LabelType$json = const {
  '1': 'LabelType',
  '2': const [
    const {'1': 'EMPTY', '2': 0},
    const {'1': 'LVL', '2': 1},
    const {'1': 'TOPL', '2': 2},
    const {'1': 'V1', '2': 3},
    const {'1': 'TAM2', '2': 4},
  ],
};

/// Descriptor for `LabelType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List labelTypeDescriptor = $convert.base64Decode('CglMYWJlbFR5cGUSCQoFRU1QVFkQABIHCgNMVkwQARIICgRUT1BMEAISBgoCVjEQAxIICgRUQU0yEAQ=');
@$core.Deprecated('Use txoDescriptor instead')
const Txo$json = const {
  '1': 'Txo',
  '2': const [
    const {'1': 'box', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Box', '8': const {}, '10': 'box'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.co.topl.genus.services.TxoState', '10': 'state'},
    const {'1': 'outputAddress', '3': 3, '4': 1, '5': 11, '6': '.co.topl.brambl.models.TransactionOutputAddress', '10': 'outputAddress'},
    const {'1': 'lockAddress', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.LockAddress', '10': 'lockAddress'},
  ],
};

/// Descriptor for `Txo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txoDescriptor = $convert.base64Decode('CgNUeG8SOgoDYm94GAEgASgLMh4uY28udG9wbC5icmFtYmwubW9kZWxzLmJveC5Cb3hCCPpCBYoBAhABUgNib3gSNgoFc3RhdGUYAiABKA4yIC5jby50b3BsLmdlbnVzLnNlcnZpY2VzLlR4b1N0YXRlUgVzdGF0ZRJVCg1vdXRwdXRBZGRyZXNzGAMgASgLMi8uY28udG9wbC5icmFtYmwubW9kZWxzLlRyYW5zYWN0aW9uT3V0cHV0QWRkcmVzc1INb3V0cHV0QWRkcmVzcxJECgtsb2NrQWRkcmVzcxgEIAEoCzIiLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5Mb2NrQWRkcmVzc1ILbG9ja0FkZHJlc3M=');
@$core.Deprecated('Use confidenceFactorDescriptor instead')
const ConfidenceFactor$json = const {
  '1': 'ConfidenceFactor',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 1, '10': 'value'},
  ],
};

/// Descriptor for `ConfidenceFactor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confidenceFactorDescriptor = $convert.base64Decode('ChBDb25maWRlbmNlRmFjdG9yEhQKBXZhbHVlGAEgASgBUgV2YWx1ZQ==');
@$core.Deprecated('Use chainDistanceDescriptor instead')
const ChainDistance$json = const {
  '1': 'ChainDistance',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 3, '10': 'value'},
  ],
};

/// Descriptor for `ChainDistance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainDistanceDescriptor = $convert.base64Decode('Cg1DaGFpbkRpc3RhbmNlEhQKBXZhbHVlGAEgASgDUgV2YWx1ZQ==');
@$core.Deprecated('Use assetLabelDescriptor instead')
const AssetLabel$json = const {
  '1': 'AssetLabel',
  '2': const [
    const {'1': 'labelType', '3': 1, '4': 1, '5': 14, '6': '.co.topl.genus.services.LabelType', '10': 'labelType'},
    const {'1': 'empty', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.AssetLabel.Empty', '9': 0, '10': 'empty'},
    const {'1': 'v1Label', '3': 3, '4': 1, '5': 11, '6': '.co.topl.genus.services.AssetLabel.V1Label', '9': 0, '10': 'v1Label'},
    const {'1': 'tam2Label', '3': 4, '4': 1, '5': 11, '6': '.co.topl.genus.services.AssetLabel.Tam2Label', '9': 0, '10': 'tam2Label'},
  ],
  '3': const [AssetLabel_Empty$json, AssetLabel_V1Label$json, AssetLabel_Tam2Label$json],
  '8': const [
    const {'1': 'label'},
  ],
};

@$core.Deprecated('Use assetLabelDescriptor instead')
const AssetLabel_Empty$json = const {
  '1': 'Empty',
};

@$core.Deprecated('Use assetLabelDescriptor instead')
const AssetLabel_V1Label$json = const {
  '1': 'V1Label',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    const {'1': 'mintingAddress', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Address', '8': const {}, '10': 'mintingAddress'},
  ],
};

@$core.Deprecated('Use assetLabelDescriptor instead')
const AssetLabel_Tam2Label$json = const {
  '1': 'Tam2Label',
  '2': const [
    const {'1': 'groupHashMostSignificant', '3': 1, '4': 1, '5': 6, '10': 'groupHashMostSignificant'},
    const {'1': 'groupHashMoreSignificant', '3': 2, '4': 1, '5': 6, '10': 'groupHashMoreSignificant'},
    const {'1': 'groupHashLessSignificant', '3': 3, '4': 1, '5': 6, '10': 'groupHashLessSignificant'},
    const {'1': 'groupHashLeastSignificant', '3': 4, '4': 1, '5': 6, '10': 'groupHashLeastSignificant'},
    const {'1': 'seriesHashMostSignificant', '3': 5, '4': 1, '5': 6, '10': 'seriesHashMostSignificant'},
    const {'1': 'seriesHashMoreSignificant', '3': 6, '4': 1, '5': 6, '10': 'seriesHashMoreSignificant'},
    const {'1': 'seriesHashLessSignificant', '3': 7, '4': 1, '5': 6, '10': 'seriesHashLessSignificant'},
    const {'1': 'seriesHashLeastSignificant', '3': 8, '4': 1, '5': 6, '10': 'seriesHashLeastSignificant'},
  ],
};

/// Descriptor for `AssetLabel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetLabelDescriptor = $convert.base64Decode('CgpBc3NldExhYmVsEj8KCWxhYmVsVHlwZRgBIAEoDjIhLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuTGFiZWxUeXBlUglsYWJlbFR5cGUSQAoFZW1wdHkYAiABKAsyKC5jby50b3BsLmdlbnVzLnNlcnZpY2VzLkFzc2V0TGFiZWwuRW1wdHlIAFIFZW1wdHkSRgoHdjFMYWJlbBgDIAEoCzIqLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuQXNzZXRMYWJlbC5WMUxhYmVsSABSB3YxTGFiZWwSTAoJdGFtMkxhYmVsGAQgASgLMiwuY28udG9wbC5nZW51cy5zZXJ2aWNlcy5Bc3NldExhYmVsLlRhbTJMYWJlbEgAUgl0YW0yTGFiZWwaBwoFRW1wdHkadQoHVjFMYWJlbBIYCgd2ZXJzaW9uGAEgASgNUgd2ZXJzaW9uElAKDm1pbnRpbmdBZGRyZXNzGAIgASgLMh4uY28udG9wbC5icmFtYmwubW9kZWxzLkFkZHJlc3NCCPpCBYoBAhABUg5taW50aW5nQWRkcmVzcxr3AwoJVGFtMkxhYmVsEjoKGGdyb3VwSGFzaE1vc3RTaWduaWZpY2FudBgBIAEoBlIYZ3JvdXBIYXNoTW9zdFNpZ25pZmljYW50EjoKGGdyb3VwSGFzaE1vcmVTaWduaWZpY2FudBgCIAEoBlIYZ3JvdXBIYXNoTW9yZVNpZ25pZmljYW50EjoKGGdyb3VwSGFzaExlc3NTaWduaWZpY2FudBgDIAEoBlIYZ3JvdXBIYXNoTGVzc1NpZ25pZmljYW50EjwKGWdyb3VwSGFzaExlYXN0U2lnbmlmaWNhbnQYBCABKAZSGWdyb3VwSGFzaExlYXN0U2lnbmlmaWNhbnQSPAoZc2VyaWVzSGFzaE1vc3RTaWduaWZpY2FudBgFIAEoBlIZc2VyaWVzSGFzaE1vc3RTaWduaWZpY2FudBI8ChlzZXJpZXNIYXNoTW9yZVNpZ25pZmljYW50GAYgASgGUhlzZXJpZXNIYXNoTW9yZVNpZ25pZmljYW50EjwKGXNlcmllc0hhc2hMZXNzU2lnbmlmaWNhbnQYByABKAZSGXNlcmllc0hhc2hMZXNzU2lnbmlmaWNhbnQSPgoac2VyaWVzSGFzaExlYXN0U2lnbmlmaWNhbnQYCCABKAZSGnNlcmllc0hhc2hMZWFzdFNpZ25pZmljYW50QgcKBWxhYmVs');
@$core.Deprecated('Use indexSpecDescriptor instead')
const IndexSpec$json = const {
  '1': 'IndexSpec',
  '2': const [
    const {'1': 'indexName', '3': 1, '4': 1, '5': 9, '10': 'indexName'},
    const {'1': 'indexFieldSpec', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.IndexFieldSpec', '8': const {}, '10': 'indexFieldSpec'},
    const {'1': 'indexFilter', '3': 3, '4': 1, '5': 11, '6': '.co.topl.genus.services.IndexFilter', '10': 'indexFilter'},
  ],
};

/// Descriptor for `IndexSpec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indexSpecDescriptor = $convert.base64Decode('CglJbmRleFNwZWMSHAoJaW5kZXhOYW1lGAEgASgJUglpbmRleE5hbWUSWAoOaW5kZXhGaWVsZFNwZWMYAiABKAsyJi5jby50b3BsLmdlbnVzLnNlcnZpY2VzLkluZGV4RmllbGRTcGVjQgj6QgWKAQIQAVIOaW5kZXhGaWVsZFNwZWMSRQoLaW5kZXhGaWx0ZXIYAyABKAsyIy5jby50b3BsLmdlbnVzLnNlcnZpY2VzLkluZGV4RmlsdGVyUgtpbmRleEZpbHRlcg==');
@$core.Deprecated('Use indexFieldSpecDescriptor instead')
const IndexFieldSpec$json = const {
  '1': 'IndexFieldSpec',
  '2': const [
    const {'1': 'jsonSpecs', '3': 1, '4': 1, '5': 11, '6': '.co.topl.genus.services.JsonIndexSpecs', '9': 0, '10': 'jsonSpecs'},
    const {'1': 'csvSpecs', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.CsvIndexSpecs', '9': 0, '10': 'csvSpecs'},
  ],
  '8': const [
    const {'1': 'spec'},
  ],
};

/// Descriptor for `IndexFieldSpec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indexFieldSpecDescriptor = $convert.base64Decode('Cg5JbmRleEZpZWxkU3BlYxJGCglqc29uU3BlY3MYASABKAsyJi5jby50b3BsLmdlbnVzLnNlcnZpY2VzLkpzb25JbmRleFNwZWNzSABSCWpzb25TcGVjcxJDCghjc3ZTcGVjcxgCIAEoCzIlLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuQ3N2SW5kZXhTcGVjc0gAUghjc3ZTcGVjc0IGCgRzcGVj');
@$core.Deprecated('Use csvIndexSpecsDescriptor instead')
const CsvIndexSpecs$json = const {
  '1': 'CsvIndexSpecs',
  '2': const [
    const {'1': 'specs', '3': 1, '4': 3, '5': 11, '6': '.co.topl.genus.services.CsvIndexSpec', '10': 'specs'},
    const {'1': 'separatorChar', '3': 2, '4': 1, '5': 13, '10': 'separatorChar'},
    const {'1': 'quoteChar', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.UInt32Value', '10': 'quoteChar'},
  ],
};

/// Descriptor for `CsvIndexSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List csvIndexSpecsDescriptor = $convert.base64Decode('Cg1Dc3ZJbmRleFNwZWNzEjoKBXNwZWNzGAEgAygLMiQuY28udG9wbC5nZW51cy5zZXJ2aWNlcy5Dc3ZJbmRleFNwZWNSBXNwZWNzEiQKDXNlcGFyYXRvckNoYXIYAiABKA1SDXNlcGFyYXRvckNoYXISOgoJcXVvdGVDaGFyGAMgASgLMhwuZ29vZ2xlLnByb3RvYnVmLlVJbnQzMlZhbHVlUglxdW90ZUNoYXI=');
@$core.Deprecated('Use csvIndexSpecDescriptor instead')
const CsvIndexSpec$json = const {
  '1': 'CsvIndexSpec',
  '2': const [
    const {'1': 'fieldIndex', '3': 1, '4': 1, '5': 13, '10': 'fieldIndex'},
    const {'1': 'sortOrder', '3': 2, '4': 1, '5': 14, '6': '.co.topl.genus.services.SortOrder', '10': 'sortOrder'},
    const {'1': 'isNumeric', '3': 3, '4': 1, '5': 8, '10': 'isNumeric'},
  ],
};

/// Descriptor for `CsvIndexSpec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List csvIndexSpecDescriptor = $convert.base64Decode('CgxDc3ZJbmRleFNwZWMSHgoKZmllbGRJbmRleBgBIAEoDVIKZmllbGRJbmRleBI/Cglzb3J0T3JkZXIYAiABKA4yIS5jby50b3BsLmdlbnVzLnNlcnZpY2VzLlNvcnRPcmRlclIJc29ydE9yZGVyEhwKCWlzTnVtZXJpYxgDIAEoCFIJaXNOdW1lcmlj');
@$core.Deprecated('Use jsonIndexSpecsDescriptor instead')
const JsonIndexSpecs$json = const {
  '1': 'JsonIndexSpecs',
  '2': const [
    const {'1': 'specs', '3': 1, '4': 3, '5': 11, '6': '.co.topl.genus.services.JsonIndexSpec', '10': 'specs'},
  ],
};

/// Descriptor for `JsonIndexSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jsonIndexSpecsDescriptor = $convert.base64Decode('Cg5Kc29uSW5kZXhTcGVjcxI7CgVzcGVjcxgBIAMoCzIlLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuSnNvbkluZGV4U3BlY1IFc3BlY3M=');
@$core.Deprecated('Use jsonIndexSpecDescriptor instead')
const JsonIndexSpec$json = const {
  '1': 'JsonIndexSpec',
  '2': const [
    const {'1': 'jsonPath', '3': 1, '4': 1, '5': 9, '10': 'jsonPath'},
    const {'1': 'sortOrder', '3': 2, '4': 1, '5': 14, '6': '.co.topl.genus.services.SortOrder', '10': 'sortOrder'},
  ],
};

/// Descriptor for `JsonIndexSpec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jsonIndexSpecDescriptor = $convert.base64Decode('Cg1Kc29uSW5kZXhTcGVjEhoKCGpzb25QYXRoGAEgASgJUghqc29uUGF0aBI/Cglzb3J0T3JkZXIYAiABKA4yIS5jby50b3BsLmdlbnVzLnNlcnZpY2VzLlNvcnRPcmRlclIJc29ydE9yZGVy');
@$core.Deprecated('Use indexFilterDescriptor instead')
const IndexFilter$json = const {
  '1': 'IndexFilter',
  '2': const [
    const {'1': 'regexIndexFilter', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'regexIndexFilter'},
  ],
  '8': const [
    const {'1': 'filter'},
  ],
};

/// Descriptor for `IndexFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indexFilterDescriptor = $convert.base64Decode('CgtJbmRleEZpbHRlchIsChByZWdleEluZGV4RmlsdGVyGAEgASgJSABSEHJlZ2V4SW5kZXhGaWx0ZXJCCAoGZmlsdGVy');
@$core.Deprecated('Use transactionReceiptDescriptor instead')
const TransactionReceipt$json = const {
  '1': 'TransactionReceipt',
  '2': const [
    const {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.transaction.IoTransaction', '8': const {}, '10': 'transaction'},
    const {'1': 'confidenceFactor', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.ConfidenceFactor', '8': const {}, '10': 'confidenceFactor'},
    const {'1': 'blockId', '3': 3, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockId', '8': const {}, '10': 'blockId'},
    const {'1': 'depth', '3': 4, '4': 1, '5': 11, '6': '.co.topl.genus.services.ChainDistance', '8': const {}, '10': 'depth'},
  ],
};

/// Descriptor for `TransactionReceipt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionReceiptDescriptor = $convert.base64Decode('ChJUcmFuc2FjdGlvblJlY2VpcHQSXAoLdHJhbnNhY3Rpb24YASABKAsyMC5jby50b3BsLmJyYW1ibC5tb2RlbHMudHJhbnNhY3Rpb24uSW9UcmFuc2FjdGlvbkII+kIFigECEAFSC3RyYW5zYWN0aW9uEl4KEGNvbmZpZGVuY2VGYWN0b3IYAiABKAsyKC5jby50b3BsLmdlbnVzLnNlcnZpY2VzLkNvbmZpZGVuY2VGYWN0b3JCCPpCBYoBAhABUhBjb25maWRlbmNlRmFjdG9yEkUKB2Jsb2NrSWQYAyABKAsyIS5jby50b3BsLmNvbnNlbnN1cy5tb2RlbHMuQmxvY2tJZEII+kIFigECEAFSB2Jsb2NrSWQSRQoFZGVwdGgYBCABKAsyJS5jby50b3BsLmdlbnVzLnNlcnZpY2VzLkNoYWluRGlzdGFuY2VCCPpCBYoBAhABUgVkZXB0aA==');
@$core.Deprecated('Use heightDataDescriptor instead')
const HeightData$json = const {
  '1': 'HeightData',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 3, '10': 'height'},
    const {'1': 'blockData', '3': 2, '4': 1, '5': 11, '6': '.co.topl.genus.services.BlockData', '10': 'blockData'},
  ],
};

/// Descriptor for `HeightData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heightDataDescriptor = $convert.base64Decode('CgpIZWlnaHREYXRhEhYKBmhlaWdodBgBIAEoA1IGaGVpZ2h0Ej8KCWJsb2NrRGF0YRgCIAEoCzIhLmNvLnRvcGwuZ2VudXMuc2VydmljZXMuQmxvY2tEYXRhUglibG9ja0RhdGE=');
@$core.Deprecated('Use blockDataDescriptor instead')
const BlockData$json = const {
  '1': 'BlockData',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockHeader', '8': const {}, '10': 'header'},
    const {'1': 'body', '3': 2, '4': 1, '5': 11, '6': '.co.topl.node.models.BlockBody', '8': const {}, '10': 'body'},
    const {'1': 'transactions', '3': 3, '4': 3, '5': 11, '6': '.co.topl.brambl.models.transaction.IoTransaction', '10': 'transactions'},
  ],
};

/// Descriptor for `BlockData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockDataDescriptor = $convert.base64Decode('CglCbG9ja0RhdGESRwoGaGVhZGVyGAEgASgLMiUuY28udG9wbC5jb25zZW5zdXMubW9kZWxzLkJsb2NrSGVhZGVyQgj6QgWKAQIQAVIGaGVhZGVyEjwKBGJvZHkYAiABKAsyHi5jby50b3BsLm5vZGUubW9kZWxzLkJsb2NrQm9keUII+kIFigECEAFSBGJvZHkSVAoMdHJhbnNhY3Rpb25zGAMgAygLMjAuY28udG9wbC5icmFtYmwubW9kZWxzLnRyYW5zYWN0aW9uLklvVHJhbnNhY3Rpb25SDHRyYW5zYWN0aW9ucw==');
