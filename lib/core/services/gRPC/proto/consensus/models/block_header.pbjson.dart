///
//  Generated code. Do not modify.
//  source: consensus/models/block_header.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use blockHeaderDescriptor instead')
const BlockHeader$json = const {
  '1': 'BlockHeader',
  '2': const [
    const {'1': 'parentHeaderId', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockId', '8': const {}, '10': 'parentHeaderId'},
    const {'1': 'parentSlot', '3': 2, '4': 1, '5': 4, '10': 'parentSlot'},
    const {'1': 'txRoot', '3': 3, '4': 1, '5': 12, '8': const {}, '10': 'txRoot'},
    const {'1': 'bloomFilter', '3': 4, '4': 1, '5': 12, '8': const {}, '10': 'bloomFilter'},
    const {'1': 'timestamp', '3': 5, '4': 1, '5': 4, '10': 'timestamp'},
    const {'1': 'height', '3': 6, '4': 1, '5': 4, '10': 'height'},
    const {'1': 'slot', '3': 7, '4': 1, '5': 4, '10': 'slot'},
    const {'1': 'eligibilityCertificate', '3': 8, '4': 1, '5': 11, '6': '.co.topl.consensus.models.EligibilityCertificate', '8': const {}, '10': 'eligibilityCertificate'},
    const {'1': 'operationalCertificate', '3': 9, '4': 1, '5': 11, '6': '.co.topl.consensus.models.OperationalCertificate', '8': const {}, '10': 'operationalCertificate'},
    const {'1': 'metadata', '3': 10, '4': 1, '5': 12, '8': const {}, '10': 'metadata'},
    const {'1': 'address', '3': 11, '4': 1, '5': 11, '6': '.co.topl.consensus.models.StakingAddress', '8': const {}, '10': 'address'},
  ],
};

/// Descriptor for `BlockHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockHeaderDescriptor = $convert.base64Decode('CgtCbG9ja0hlYWRlchJTCg5wYXJlbnRIZWFkZXJJZBgBIAEoCzIhLmNvLnRvcGwuY29uc2Vuc3VzLm1vZGVscy5CbG9ja0lkQgj6QgWKAQIQAVIOcGFyZW50SGVhZGVySWQSHgoKcGFyZW50U2xvdBgCIAEoBFIKcGFyZW50U2xvdBIfCgZ0eFJvb3QYAyABKAxCB/pCBHoCaCBSBnR4Um9vdBIqCgtibG9vbUZpbHRlchgEIAEoDEII+kIFegNogAJSC2Jsb29tRmlsdGVyEhwKCXRpbWVzdGFtcBgFIAEoBFIJdGltZXN0YW1wEhYKBmhlaWdodBgGIAEoBFIGaGVpZ2h0EhIKBHNsb3QYByABKARSBHNsb3QScgoWZWxpZ2liaWxpdHlDZXJ0aWZpY2F0ZRgIIAEoCzIwLmNvLnRvcGwuY29uc2Vuc3VzLm1vZGVscy5FbGlnaWJpbGl0eUNlcnRpZmljYXRlQgj6QgWKAQIQAVIWZWxpZ2liaWxpdHlDZXJ0aWZpY2F0ZRJyChZvcGVyYXRpb25hbENlcnRpZmljYXRlGAkgASgLMjAuY28udG9wbC5jb25zZW5zdXMubW9kZWxzLk9wZXJhdGlvbmFsQ2VydGlmaWNhdGVCCPpCBYoBAhABUhZvcGVyYXRpb25hbENlcnRpZmljYXRlEiMKCG1ldGFkYXRhGAogASgMQgf6QgR6AhggUghtZXRhZGF0YRJMCgdhZGRyZXNzGAsgASgLMiguY28udG9wbC5jb25zZW5zdXMubW9kZWxzLlN0YWtpbmdBZGRyZXNzQgj6QgWKAQIQAVIHYWRkcmVzcw==');
