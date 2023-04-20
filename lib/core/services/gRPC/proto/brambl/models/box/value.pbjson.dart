///
//  Generated code. Do not modify.
//  source: brambl/models/box/value.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use valueDescriptor instead')
const Value$json = const {
  '1': 'Value',
  '2': const [
    const {'1': 'lvl', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Value.LVL', '9': 0, '10': 'lvl'},
    const {'1': 'topl', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Value.TOPL', '9': 0, '10': 'topl'},
    const {'1': 'asset', '3': 3, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Value.Asset', '9': 0, '10': 'asset'},
    const {'1': 'registration', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Value.Registration', '9': 0, '10': 'registration'},
  ],
  '3': const [Value_LVL$json, Value_TOPL$json, Value_Asset$json, Value_Registration$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use valueDescriptor instead')
const Value_LVL$json = const {
  '1': 'LVL',
  '2': const [
    const {'1': 'quantity', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Int128', '8': const {}, '10': 'quantity'},
  ],
};

@$core.Deprecated('Use valueDescriptor instead')
const Value_TOPL$json = const {
  '1': 'TOPL',
  '2': const [
    const {'1': 'quantity', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Int128', '8': const {}, '10': 'quantity'},
    const {'1': 'stakingAddress', '3': 2, '4': 1, '5': 11, '6': '.co.topl.consensus.models.StakingAddress', '10': 'stakingAddress'},
  ],
};

@$core.Deprecated('Use valueDescriptor instead')
const Value_Asset$json = const {
  '1': 'Asset',
  '2': const [
    const {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'quantity', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Int128', '8': const {}, '10': 'quantity'},
    const {'1': 'metadata', '3': 3, '4': 1, '5': 11, '6': '.quivr.models.SmallData', '8': const {}, '10': 'metadata'},
  ],
};

@$core.Deprecated('Use valueDescriptor instead')
const Value_Registration$json = const {
  '1': 'Registration',
  '2': const [
    const {'1': 'registration', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.SignatureKesProduct', '8': const {}, '10': 'registration'},
    const {'1': 'stakingAddress', '3': 2, '4': 1, '5': 11, '6': '.co.topl.consensus.models.StakingAddress', '8': const {}, '10': 'stakingAddress'},
  ],
};

/// Descriptor for `Value`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueDescriptor = $convert.base64Decode('CgVWYWx1ZRI4CgNsdmwYASABKAsyJC5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LlZhbHVlLkxWTEgAUgNsdmwSOwoEdG9wbBgCIAEoCzIlLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guVmFsdWUuVE9QTEgAUgR0b3BsEj4KBWFzc2V0GAMgASgLMiYuY28udG9wbC5icmFtYmwubW9kZWxzLmJveC5WYWx1ZS5Bc3NldEgAUgVhc3NldBJTCgxyZWdpc3RyYXRpb24YBCABKAsyLS5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LlZhbHVlLlJlZ2lzdHJhdGlvbkgAUgxyZWdpc3RyYXRpb24aQQoDTFZMEjoKCHF1YW50aXR5GAEgASgLMhQucXVpdnIubW9kZWxzLkludDEyOEII+kIFigECEAFSCHF1YW50aXR5GpQBCgRUT1BMEjoKCHF1YW50aXR5GAEgASgLMhQucXVpdnIubW9kZWxzLkludDEyOEII+kIFigECEAFSCHF1YW50aXR5ElAKDnN0YWtpbmdBZGRyZXNzGAIgASgLMiguY28udG9wbC5jb25zZW5zdXMubW9kZWxzLlN0YWtpbmdBZGRyZXNzUg5zdGFraW5nQWRkcmVzcxqYAQoFQXNzZXQSFAoFbGFiZWwYASABKAlSBWxhYmVsEjoKCHF1YW50aXR5GAIgASgLMhQucXVpdnIubW9kZWxzLkludDEyOEII+kIFigECEAFSCHF1YW50aXR5Ej0KCG1ldGFkYXRhGAMgASgLMhcucXVpdnIubW9kZWxzLlNtYWxsRGF0YUII+kIFigECEAFSCG1ldGFkYXRhGscBCgxSZWdpc3RyYXRpb24SWwoMcmVnaXN0cmF0aW9uGAEgASgLMi0uY28udG9wbC5jb25zZW5zdXMubW9kZWxzLlNpZ25hdHVyZUtlc1Byb2R1Y3RCCPpCBYoBAhABUgxyZWdpc3RyYXRpb24SWgoOc3Rha2luZ0FkZHJlc3MYAiABKAsyKC5jby50b3BsLmNvbnNlbnN1cy5tb2RlbHMuU3Rha2luZ0FkZHJlc3NCCPpCBYoBAhABUg5zdGFraW5nQWRkcmVzc0IHCgV2YWx1ZQ==');
