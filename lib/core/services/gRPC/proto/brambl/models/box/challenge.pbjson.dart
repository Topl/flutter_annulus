///
//  Generated code. Do not modify.
//  source: brambl/models/box/challenge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use challengeDescriptor instead')
const Challenge$json = const {
  '1': 'Challenge',
  '2': const [
    const {'1': 'revealed', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Proposition', '9': 0, '10': 'revealed'},
    const {'1': 'previous', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Challenge.PreviousProposition', '9': 0, '10': 'previous'},
  ],
  '3': const [Challenge_PreviousProposition$json],
  '8': const [
    const {'1': 'proposition'},
  ],
};

@$core.Deprecated('Use challengeDescriptor instead')
const Challenge_PreviousProposition$json = const {
  '1': 'PreviousProposition',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.TransactionInputAddress', '10': 'address'},
    const {'1': 'index', '3': 2, '4': 1, '5': 13, '10': 'index'},
  ],
};

/// Descriptor for `Challenge`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List challengeDescriptor = $convert.base64Decode('CglDaGFsbGVuZ2USNwoIcmV2ZWFsZWQYASABKAsyGS5xdWl2ci5tb2RlbHMuUHJvcG9zaXRpb25IAFIIcmV2ZWFsZWQSVgoIcHJldmlvdXMYAiABKAsyOC5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LkNoYWxsZW5nZS5QcmV2aW91c1Byb3Bvc2l0aW9uSABSCHByZXZpb3VzGnUKE1ByZXZpb3VzUHJvcG9zaXRpb24SSAoHYWRkcmVzcxgBIAEoCzIuLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5UcmFuc2FjdGlvbklucHV0QWRkcmVzc1IHYWRkcmVzcxIUCgVpbmRleBgCIAEoDVIFaW5kZXhCDQoLcHJvcG9zaXRpb24=');
