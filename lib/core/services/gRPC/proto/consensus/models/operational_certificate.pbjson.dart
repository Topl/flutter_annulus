///
//  Generated code. Do not modify.
//  source: consensus/models/operational_certificate.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use operationalCertificateDescriptor instead')
const OperationalCertificate$json = const {
  '1': 'OperationalCertificate',
  '2': const [
    const {'1': 'parentVK', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.VerificationKeyKesProduct', '8': const {}, '10': 'parentVK'},
    const {'1': 'parentSignature', '3': 2, '4': 1, '5': 11, '6': '.co.topl.consensus.models.SignatureKesProduct', '8': const {}, '10': 'parentSignature'},
    const {'1': 'childVK', '3': 3, '4': 1, '5': 12, '8': const {}, '10': 'childVK'},
    const {'1': 'childSignature', '3': 4, '4': 1, '5': 12, '8': const {}, '10': 'childSignature'},
  ],
};

/// Descriptor for `OperationalCertificate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List operationalCertificateDescriptor = $convert.base64Decode('ChZPcGVyYXRpb25hbENlcnRpZmljYXRlElkKCHBhcmVudFZLGAEgASgLMjMuY28udG9wbC5jb25zZW5zdXMubW9kZWxzLlZlcmlmaWNhdGlvbktleUtlc1Byb2R1Y3RCCPpCBYoBAhABUghwYXJlbnRWSxJhCg9wYXJlbnRTaWduYXR1cmUYAiABKAsyLS5jby50b3BsLmNvbnNlbnN1cy5tb2RlbHMuU2lnbmF0dXJlS2VzUHJvZHVjdEII+kIFigECEAFSD3BhcmVudFNpZ25hdHVyZRIhCgdjaGlsZFZLGAMgASgMQgf6QgR6AmggUgdjaGlsZFZLEi8KDmNoaWxkU2lnbmF0dXJlGAQgASgMQgf6QgR6AmhAUg5jaGlsZFNpZ25hdHVyZQ==');
@$core.Deprecated('Use verificationKeyKesProductDescriptor instead')
const VerificationKeyKesProduct$json = const {
  '1': 'VerificationKeyKesProduct',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'value'},
    const {'1': 'step', '3': 2, '4': 1, '5': 13, '10': 'step'},
  ],
};

/// Descriptor for `VerificationKeyKesProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verificationKeyKesProductDescriptor = $convert.base64Decode('ChlWZXJpZmljYXRpb25LZXlLZXNQcm9kdWN0Eh0KBXZhbHVlGAEgASgMQgf6QgR6AmggUgV2YWx1ZRISCgRzdGVwGAIgASgNUgRzdGVw');
@$core.Deprecated('Use signatureKesSumDescriptor instead')
const SignatureKesSum$json = const {
  '1': 'SignatureKesSum',
  '2': const [
    const {'1': 'verificationKey', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'verificationKey'},
    const {'1': 'signature', '3': 2, '4': 1, '5': 12, '8': const {}, '10': 'signature'},
    const {'1': 'witness', '3': 3, '4': 3, '5': 12, '8': const {}, '10': 'witness'},
  ],
};

/// Descriptor for `SignatureKesSum`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signatureKesSumDescriptor = $convert.base64Decode('Cg9TaWduYXR1cmVLZXNTdW0SMQoPdmVyaWZpY2F0aW9uS2V5GAEgASgMQgf6QgR6AmggUg92ZXJpZmljYXRpb25LZXkSJQoJc2lnbmF0dXJlGAIgASgMQgf6QgR6AmhAUglzaWduYXR1cmUSJgoHd2l0bmVzcxgDIAMoDEIM+kIJkgEGIgR6AmggUgd3aXRuZXNz');
@$core.Deprecated('Use signatureKesProductDescriptor instead')
const SignatureKesProduct$json = const {
  '1': 'SignatureKesProduct',
  '2': const [
    const {'1': 'superSignature', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.SignatureKesSum', '8': const {}, '10': 'superSignature'},
    const {'1': 'subSignature', '3': 2, '4': 1, '5': 11, '6': '.co.topl.consensus.models.SignatureKesSum', '8': const {}, '10': 'subSignature'},
    const {'1': 'subRoot', '3': 3, '4': 1, '5': 12, '8': const {}, '10': 'subRoot'},
  ],
};

/// Descriptor for `SignatureKesProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signatureKesProductDescriptor = $convert.base64Decode('ChNTaWduYXR1cmVLZXNQcm9kdWN0ElsKDnN1cGVyU2lnbmF0dXJlGAEgASgLMikuY28udG9wbC5jb25zZW5zdXMubW9kZWxzLlNpZ25hdHVyZUtlc1N1bUII+kIFigECEAFSDnN1cGVyU2lnbmF0dXJlElcKDHN1YlNpZ25hdHVyZRgCIAEoCzIpLmNvLnRvcGwuY29uc2Vuc3VzLm1vZGVscy5TaWduYXR1cmVLZXNTdW1CCPpCBYoBAhABUgxzdWJTaWduYXR1cmUSIQoHc3ViUm9vdBgDIAEoDEIH+kIEegJoIFIHc3ViUm9vdA==');
