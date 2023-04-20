///
//  Generated code. Do not modify.
//  source: brambl/models/builders.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use outputBuildRequestDescriptor instead')
const OutputBuildRequest$json = const {
  '1': 'OutputBuildRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.LockAddress', '8': const {}, '10': 'address'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Value', '8': const {}, '10': 'value'},
  ],
};

/// Descriptor for `OutputBuildRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outputBuildRequestDescriptor = $convert.base64Decode('ChJPdXRwdXRCdWlsZFJlcXVlc3QSRgoHYWRkcmVzcxgBIAEoCzIiLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5Mb2NrQWRkcmVzc0II+kIFigECEAFSB2FkZHJlc3MSQAoFdmFsdWUYAiABKAsyIC5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LlZhbHVlQgj6QgWKAQIQAVIFdmFsdWU=');
@$core.Deprecated('Use inputBuildRequestDescriptor instead')
const InputBuildRequest$json = const {
  '1': 'InputBuildRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.TransactionOutputAddress', '8': const {}, '10': 'address'},
  ],
};

/// Descriptor for `InputBuildRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputBuildRequestDescriptor = $convert.base64Decode('ChFJbnB1dEJ1aWxkUmVxdWVzdBJTCgdhZGRyZXNzGAEgASgLMi8uY28udG9wbC5icmFtYmwubW9kZWxzLlRyYW5zYWN0aW9uT3V0cHV0QWRkcmVzc0II+kIFigECEAFSB2FkZHJlc3M=');
