///
//  Generated code. Do not modify.
//  source: brambl/models/evidence.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use evidenceDescriptor instead')
const Evidence$json = const {
  '1': 'Evidence',
  '2': const [
    const {'1': 'sized32', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Evidence.Sized32', '9': 0, '10': 'sized32'},
    const {'1': 'sized64', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Evidence.Sized64', '9': 0, '10': 'sized64'},
  ],
  '3': const [Evidence_Sized32$json, Evidence_Sized64$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use evidenceDescriptor instead')
const Evidence_Sized32$json = const {
  '1': 'Sized32',
  '2': const [
    const {'1': 'digest', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Digest.Digest32', '8': const {}, '10': 'digest'},
  ],
};

@$core.Deprecated('Use evidenceDescriptor instead')
const Evidence_Sized64$json = const {
  '1': 'Sized64',
  '2': const [
    const {'1': 'digest', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Digest.Digest64', '8': const {}, '10': 'digest'},
  ],
};

/// Descriptor for `Evidence`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List evidenceDescriptor = $convert.base64Decode('CghFdmlkZW5jZRJDCgdzaXplZDMyGAEgASgLMicuY28udG9wbC5icmFtYmwubW9kZWxzLkV2aWRlbmNlLlNpemVkMzJIAFIHc2l6ZWQzMhJDCgdzaXplZDY0GAIgASgLMicuY28udG9wbC5icmFtYmwubW9kZWxzLkV2aWRlbmNlLlNpemVkNjRIAFIHc2l6ZWQ2NBpKCgdTaXplZDMyEj8KBmRpZ2VzdBgBIAEoCzIdLnF1aXZyLm1vZGVscy5EaWdlc3QuRGlnZXN0MzJCCPpCBYoBAhABUgZkaWdlc3QaSgoHU2l6ZWQ2NBI/CgZkaWdlc3QYASABKAsyHS5xdWl2ci5tb2RlbHMuRGlnZXN0LkRpZ2VzdDY0Qgj6QgWKAQIQAVIGZGlnZXN0QgcKBXZhbHVl');
