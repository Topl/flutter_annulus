///
//  Generated code. Do not modify.
//  source: quivr/models/proof.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use proofDescriptor instead')
const Proof$json = const {
  '1': 'Proof',
  '2': const [
    const {'1': 'locked', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Proof.Locked', '9': 0, '10': 'locked'},
    const {'1': 'digest', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Proof.Digest', '9': 0, '10': 'digest'},
    const {'1': 'digitalSignature', '3': 3, '4': 1, '5': 11, '6': '.quivr.models.Proof.DigitalSignature', '9': 0, '10': 'digitalSignature'},
    const {'1': 'heightRange', '3': 4, '4': 1, '5': 11, '6': '.quivr.models.Proof.HeightRange', '9': 0, '10': 'heightRange'},
    const {'1': 'tickRange', '3': 5, '4': 1, '5': 11, '6': '.quivr.models.Proof.TickRange', '9': 0, '10': 'tickRange'},
    const {'1': 'exactMatch', '3': 6, '4': 1, '5': 11, '6': '.quivr.models.Proof.ExactMatch', '9': 0, '10': 'exactMatch'},
    const {'1': 'lessThan', '3': 7, '4': 1, '5': 11, '6': '.quivr.models.Proof.LessThan', '9': 0, '10': 'lessThan'},
    const {'1': 'greaterThan', '3': 8, '4': 1, '5': 11, '6': '.quivr.models.Proof.GreaterThan', '9': 0, '10': 'greaterThan'},
    const {'1': 'equalTo', '3': 9, '4': 1, '5': 11, '6': '.quivr.models.Proof.EqualTo', '9': 0, '10': 'equalTo'},
    const {'1': 'threshold', '3': 10, '4': 1, '5': 11, '6': '.quivr.models.Proof.Threshold', '9': 0, '10': 'threshold'},
    const {'1': 'not', '3': 11, '4': 1, '5': 11, '6': '.quivr.models.Proof.Not', '9': 0, '10': 'not'},
    const {'1': 'and', '3': 12, '4': 1, '5': 11, '6': '.quivr.models.Proof.And', '9': 0, '10': 'and'},
    const {'1': 'or', '3': 13, '4': 1, '5': 11, '6': '.quivr.models.Proof.Or', '9': 0, '10': 'or'},
  ],
  '3': const [Proof_Locked$json, Proof_Digest$json, Proof_DigitalSignature$json, Proof_HeightRange$json, Proof_TickRange$json, Proof_ExactMatch$json, Proof_LessThan$json, Proof_GreaterThan$json, Proof_EqualTo$json, Proof_Threshold$json, Proof_Not$json, Proof_And$json, Proof_Or$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_Locked$json = const {
  '1': 'Locked',
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_Digest$json = const {
  '1': 'Digest',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
    const {'1': 'preimage', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Preimage', '8': const {}, '10': 'preimage'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_DigitalSignature$json = const {
  '1': 'DigitalSignature',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
    const {'1': 'witness', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Witness', '8': const {}, '10': 'witness'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_HeightRange$json = const {
  '1': 'HeightRange',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_TickRange$json = const {
  '1': 'TickRange',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_ExactMatch$json = const {
  '1': 'ExactMatch',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_LessThan$json = const {
  '1': 'LessThan',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_GreaterThan$json = const {
  '1': 'GreaterThan',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_EqualTo$json = const {
  '1': 'EqualTo',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_Threshold$json = const {
  '1': 'Threshold',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
    const {'1': 'responses', '3': 2, '4': 3, '5': 11, '6': '.quivr.models.Proof', '10': 'responses'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_Not$json = const {
  '1': 'Not',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
    const {'1': 'proof', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Proof', '8': const {}, '10': 'proof'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_And$json = const {
  '1': 'And',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
    const {'1': 'left', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Proof', '8': const {}, '10': 'left'},
    const {'1': 'right', '3': 3, '4': 1, '5': 11, '6': '.quivr.models.Proof', '8': const {}, '10': 'right'},
  ],
};

@$core.Deprecated('Use proofDescriptor instead')
const Proof_Or$json = const {
  '1': 'Or',
  '2': const [
    const {'1': 'transactionBind', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.TxBind', '8': const {}, '10': 'transactionBind'},
    const {'1': 'left', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Proof', '8': const {}, '10': 'left'},
    const {'1': 'right', '3': 3, '4': 1, '5': 11, '6': '.quivr.models.Proof', '8': const {}, '10': 'right'},
  ],
};

/// Descriptor for `Proof`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proofDescriptor = $convert.base64Decode('CgVQcm9vZhI0CgZsb2NrZWQYASABKAsyGi5xdWl2ci5tb2RlbHMuUHJvb2YuTG9ja2VkSABSBmxvY2tlZBI0CgZkaWdlc3QYAiABKAsyGi5xdWl2ci5tb2RlbHMuUHJvb2YuRGlnZXN0SABSBmRpZ2VzdBJSChBkaWdpdGFsU2lnbmF0dXJlGAMgASgLMiQucXVpdnIubW9kZWxzLlByb29mLkRpZ2l0YWxTaWduYXR1cmVIAFIQZGlnaXRhbFNpZ25hdHVyZRJDCgtoZWlnaHRSYW5nZRgEIAEoCzIfLnF1aXZyLm1vZGVscy5Qcm9vZi5IZWlnaHRSYW5nZUgAUgtoZWlnaHRSYW5nZRI9Cgl0aWNrUmFuZ2UYBSABKAsyHS5xdWl2ci5tb2RlbHMuUHJvb2YuVGlja1JhbmdlSABSCXRpY2tSYW5nZRJACgpleGFjdE1hdGNoGAYgASgLMh4ucXVpdnIubW9kZWxzLlByb29mLkV4YWN0TWF0Y2hIAFIKZXhhY3RNYXRjaBI6CghsZXNzVGhhbhgHIAEoCzIcLnF1aXZyLm1vZGVscy5Qcm9vZi5MZXNzVGhhbkgAUghsZXNzVGhhbhJDCgtncmVhdGVyVGhhbhgIIAEoCzIfLnF1aXZyLm1vZGVscy5Qcm9vZi5HcmVhdGVyVGhhbkgAUgtncmVhdGVyVGhhbhI3CgdlcXVhbFRvGAkgASgLMhsucXVpdnIubW9kZWxzLlByb29mLkVxdWFsVG9IAFIHZXF1YWxUbxI9Cgl0aHJlc2hvbGQYCiABKAsyHS5xdWl2ci5tb2RlbHMuUHJvb2YuVGhyZXNob2xkSABSCXRocmVzaG9sZBIrCgNub3QYCyABKAsyFy5xdWl2ci5tb2RlbHMuUHJvb2YuTm90SABSA25vdBIrCgNhbmQYDCABKAsyFy5xdWl2ci5tb2RlbHMuUHJvb2YuQW5kSABSA2FuZBIoCgJvchgNIAEoCzIWLnF1aXZyLm1vZGVscy5Qcm9vZi5PckgAUgJvchoICgZMb2NrZWQakAEKBkRpZ2VzdBJICg90cmFuc2FjdGlvbkJpbmQYASABKAsyFC5xdWl2ci5tb2RlbHMuVHhCaW5kQgj6QgWKAQIQAVIPdHJhbnNhY3Rpb25CaW5kEjwKCHByZWltYWdlGAIgASgLMhYucXVpdnIubW9kZWxzLlByZWltYWdlQgj6QgWKAQIQAVIIcHJlaW1hZ2UalwEKEERpZ2l0YWxTaWduYXR1cmUSSAoPdHJhbnNhY3Rpb25CaW5kGAEgASgLMhQucXVpdnIubW9kZWxzLlR4QmluZEII+kIFigECEAFSD3RyYW5zYWN0aW9uQmluZBI5Cgd3aXRuZXNzGAIgASgLMhUucXVpdnIubW9kZWxzLldpdG5lc3NCCPpCBYoBAhABUgd3aXRuZXNzGlcKC0hlaWdodFJhbmdlEkgKD3RyYW5zYWN0aW9uQmluZBgBIAEoCzIULnF1aXZyLm1vZGVscy5UeEJpbmRCCPpCBYoBAhABUg90cmFuc2FjdGlvbkJpbmQaVQoJVGlja1JhbmdlEkgKD3RyYW5zYWN0aW9uQmluZBgBIAEoCzIULnF1aXZyLm1vZGVscy5UeEJpbmRCCPpCBYoBAhABUg90cmFuc2FjdGlvbkJpbmQaVgoKRXhhY3RNYXRjaBJICg90cmFuc2FjdGlvbkJpbmQYASABKAsyFC5xdWl2ci5tb2RlbHMuVHhCaW5kQgj6QgWKAQIQAVIPdHJhbnNhY3Rpb25CaW5kGlQKCExlc3NUaGFuEkgKD3RyYW5zYWN0aW9uQmluZBgBIAEoCzIULnF1aXZyLm1vZGVscy5UeEJpbmRCCPpCBYoBAhABUg90cmFuc2FjdGlvbkJpbmQaVwoLR3JlYXRlclRoYW4SSAoPdHJhbnNhY3Rpb25CaW5kGAEgASgLMhQucXVpdnIubW9kZWxzLlR4QmluZEII+kIFigECEAFSD3RyYW5zYWN0aW9uQmluZBpTCgdFcXVhbFRvEkgKD3RyYW5zYWN0aW9uQmluZBgBIAEoCzIULnF1aXZyLm1vZGVscy5UeEJpbmRCCPpCBYoBAhABUg90cmFuc2FjdGlvbkJpbmQaiAEKCVRocmVzaG9sZBJICg90cmFuc2FjdGlvbkJpbmQYASABKAsyFC5xdWl2ci5tb2RlbHMuVHhCaW5kQgj6QgWKAQIQAVIPdHJhbnNhY3Rpb25CaW5kEjEKCXJlc3BvbnNlcxgCIAMoCzITLnF1aXZyLm1vZGVscy5Qcm9vZlIJcmVzcG9uc2VzGoQBCgNOb3QSSAoPdHJhbnNhY3Rpb25CaW5kGAEgASgLMhQucXVpdnIubW9kZWxzLlR4QmluZEII+kIFigECEAFSD3RyYW5zYWN0aW9uQmluZBIzCgVwcm9vZhgCIAEoCzITLnF1aXZyLm1vZGVscy5Qcm9vZkII+kIFigECEAFSBXByb29mGrcBCgNBbmQSSAoPdHJhbnNhY3Rpb25CaW5kGAEgASgLMhQucXVpdnIubW9kZWxzLlR4QmluZEII+kIFigECEAFSD3RyYW5zYWN0aW9uQmluZBIxCgRsZWZ0GAIgASgLMhMucXVpdnIubW9kZWxzLlByb29mQgj6QgWKAQIQAVIEbGVmdBIzCgVyaWdodBgDIAEoCzITLnF1aXZyLm1vZGVscy5Qcm9vZkII+kIFigECEAFSBXJpZ2h0GrYBCgJPchJICg90cmFuc2FjdGlvbkJpbmQYASABKAsyFC5xdWl2ci5tb2RlbHMuVHhCaW5kQgj6QgWKAQIQAVIPdHJhbnNhY3Rpb25CaW5kEjEKBGxlZnQYAiABKAsyEy5xdWl2ci5tb2RlbHMuUHJvb2ZCCPpCBYoBAhABUgRsZWZ0EjMKBXJpZ2h0GAMgASgLMhMucXVpdnIubW9kZWxzLlByb29mQgj6QgWKAQIQAVIFcmlnaHRCBwoFdmFsdWU=');
