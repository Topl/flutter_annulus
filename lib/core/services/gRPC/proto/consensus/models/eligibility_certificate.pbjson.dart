///
//  Generated code. Do not modify.
//  source: consensus/models/eligibility_certificate.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use eligibilityCertificateDescriptor instead')
const EligibilityCertificate$json = const {
  '1': 'EligibilityCertificate',
  '2': const [
    const {'1': 'vrfSig', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'vrfSig'},
    const {'1': 'vrfVK', '3': 2, '4': 1, '5': 12, '8': const {}, '10': 'vrfVK'},
    const {'1': 'thresholdEvidence', '3': 3, '4': 1, '5': 12, '8': const {}, '10': 'thresholdEvidence'},
    const {'1': 'eta', '3': 4, '4': 1, '5': 12, '8': const {}, '10': 'eta'},
  ],
};

/// Descriptor for `EligibilityCertificate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eligibilityCertificateDescriptor = $convert.base64Decode('ChZFbGlnaWJpbGl0eUNlcnRpZmljYXRlEh8KBnZyZlNpZxgBIAEoDEIH+kIEegJoUFIGdnJmU2lnEh0KBXZyZlZLGAIgASgMQgf6QgR6AmggUgV2cmZWSxI1ChF0aHJlc2hvbGRFdmlkZW5jZRgDIAEoDEIH+kIEegJoIFIRdGhyZXNob2xkRXZpZGVuY2USGQoDZXRhGAQgASgMQgf6QgR6AmggUgNldGE=');
