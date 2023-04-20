///
//  Generated code. Do not modify.
//  source: quivr/models/proposition.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use propositionDescriptor instead')
const Proposition$json = const {
  '1': 'Proposition',
  '2': const [
    const {'1': 'locked', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Proposition.Locked', '9': 0, '10': 'locked'},
    const {'1': 'digest', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Proposition.Digest', '9': 0, '10': 'digest'},
    const {'1': 'digitalSignature', '3': 3, '4': 1, '5': 11, '6': '.quivr.models.Proposition.DigitalSignature', '9': 0, '10': 'digitalSignature'},
    const {'1': 'heightRange', '3': 4, '4': 1, '5': 11, '6': '.quivr.models.Proposition.HeightRange', '9': 0, '10': 'heightRange'},
    const {'1': 'tickRange', '3': 5, '4': 1, '5': 11, '6': '.quivr.models.Proposition.TickRange', '9': 0, '10': 'tickRange'},
    const {'1': 'exactMatch', '3': 6, '4': 1, '5': 11, '6': '.quivr.models.Proposition.ExactMatch', '9': 0, '10': 'exactMatch'},
    const {'1': 'lessThan', '3': 7, '4': 1, '5': 11, '6': '.quivr.models.Proposition.LessThan', '9': 0, '10': 'lessThan'},
    const {'1': 'greaterThan', '3': 8, '4': 1, '5': 11, '6': '.quivr.models.Proposition.GreaterThan', '9': 0, '10': 'greaterThan'},
    const {'1': 'equalTo', '3': 9, '4': 1, '5': 11, '6': '.quivr.models.Proposition.EqualTo', '9': 0, '10': 'equalTo'},
    const {'1': 'threshold', '3': 10, '4': 1, '5': 11, '6': '.quivr.models.Proposition.Threshold', '9': 0, '10': 'threshold'},
    const {'1': 'not', '3': 11, '4': 1, '5': 11, '6': '.quivr.models.Proposition.Not', '9': 0, '10': 'not'},
    const {'1': 'and', '3': 12, '4': 1, '5': 11, '6': '.quivr.models.Proposition.And', '9': 0, '10': 'and'},
    const {'1': 'or', '3': 13, '4': 1, '5': 11, '6': '.quivr.models.Proposition.Or', '9': 0, '10': 'or'},
  ],
  '3': const [Proposition_Locked$json, Proposition_Digest$json, Proposition_DigitalSignature$json, Proposition_HeightRange$json, Proposition_TickRange$json, Proposition_ExactMatch$json, Proposition_LessThan$json, Proposition_GreaterThan$json, Proposition_EqualTo$json, Proposition_Threshold$json, Proposition_Not$json, Proposition_And$json, Proposition_Or$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_Locked$json = const {
  '1': 'Locked',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Data', '10': 'data'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_Digest$json = const {
  '1': 'Digest',
  '2': const [
    const {'1': 'routine', '3': 1, '4': 1, '5': 9, '10': 'routine'},
    const {'1': 'digest', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Digest', '8': const {}, '10': 'digest'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_DigitalSignature$json = const {
  '1': 'DigitalSignature',
  '2': const [
    const {'1': 'routine', '3': 1, '4': 1, '5': 9, '10': 'routine'},
    const {'1': 'verificationKey', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.VerificationKey', '8': const {}, '10': 'verificationKey'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_HeightRange$json = const {
  '1': 'HeightRange',
  '2': const [
    const {'1': 'chain', '3': 1, '4': 1, '5': 9, '10': 'chain'},
    const {'1': 'min', '3': 2, '4': 1, '5': 4, '10': 'min'},
    const {'1': 'max', '3': 3, '4': 1, '5': 4, '10': 'max'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_TickRange$json = const {
  '1': 'TickRange',
  '2': const [
    const {'1': 'min', '3': 1, '4': 1, '5': 4, '10': 'min'},
    const {'1': 'max', '3': 2, '4': 1, '5': 4, '10': 'max'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_ExactMatch$json = const {
  '1': 'ExactMatch',
  '2': const [
    const {'1': 'location', '3': 1, '4': 1, '5': 9, '10': 'location'},
    const {'1': 'compareTo', '3': 2, '4': 1, '5': 12, '8': const {}, '10': 'compareTo'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_LessThan$json = const {
  '1': 'LessThan',
  '2': const [
    const {'1': 'location', '3': 1, '4': 1, '5': 9, '10': 'location'},
    const {'1': 'compareTo', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Int128', '8': const {}, '10': 'compareTo'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_GreaterThan$json = const {
  '1': 'GreaterThan',
  '2': const [
    const {'1': 'location', '3': 1, '4': 1, '5': 9, '10': 'location'},
    const {'1': 'compareTo', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Int128', '8': const {}, '10': 'compareTo'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_EqualTo$json = const {
  '1': 'EqualTo',
  '2': const [
    const {'1': 'location', '3': 1, '4': 1, '5': 9, '10': 'location'},
    const {'1': 'compareTo', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Int128', '8': const {}, '10': 'compareTo'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_Threshold$json = const {
  '1': 'Threshold',
  '2': const [
    const {'1': 'challenges', '3': 1, '4': 3, '5': 11, '6': '.quivr.models.Proposition', '10': 'challenges'},
    const {'1': 'threshold', '3': 2, '4': 1, '5': 13, '10': 'threshold'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_Not$json = const {
  '1': 'Not',
  '2': const [
    const {'1': 'proposition', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Proposition', '8': const {}, '10': 'proposition'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_And$json = const {
  '1': 'And',
  '2': const [
    const {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Proposition', '8': const {}, '10': 'left'},
    const {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Proposition', '8': const {}, '10': 'right'},
  ],
};

@$core.Deprecated('Use propositionDescriptor instead')
const Proposition_Or$json = const {
  '1': 'Or',
  '2': const [
    const {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Proposition', '8': const {}, '10': 'left'},
    const {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Proposition', '8': const {}, '10': 'right'},
  ],
};

/// Descriptor for `Proposition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List propositionDescriptor = $convert.base64Decode('CgtQcm9wb3NpdGlvbhI6CgZsb2NrZWQYASABKAsyIC5xdWl2ci5tb2RlbHMuUHJvcG9zaXRpb24uTG9ja2VkSABSBmxvY2tlZBI6CgZkaWdlc3QYAiABKAsyIC5xdWl2ci5tb2RlbHMuUHJvcG9zaXRpb24uRGlnZXN0SABSBmRpZ2VzdBJYChBkaWdpdGFsU2lnbmF0dXJlGAMgASgLMioucXVpdnIubW9kZWxzLlByb3Bvc2l0aW9uLkRpZ2l0YWxTaWduYXR1cmVIAFIQZGlnaXRhbFNpZ25hdHVyZRJJCgtoZWlnaHRSYW5nZRgEIAEoCzIlLnF1aXZyLm1vZGVscy5Qcm9wb3NpdGlvbi5IZWlnaHRSYW5nZUgAUgtoZWlnaHRSYW5nZRJDCgl0aWNrUmFuZ2UYBSABKAsyIy5xdWl2ci5tb2RlbHMuUHJvcG9zaXRpb24uVGlja1JhbmdlSABSCXRpY2tSYW5nZRJGCgpleGFjdE1hdGNoGAYgASgLMiQucXVpdnIubW9kZWxzLlByb3Bvc2l0aW9uLkV4YWN0TWF0Y2hIAFIKZXhhY3RNYXRjaBJACghsZXNzVGhhbhgHIAEoCzIiLnF1aXZyLm1vZGVscy5Qcm9wb3NpdGlvbi5MZXNzVGhhbkgAUghsZXNzVGhhbhJJCgtncmVhdGVyVGhhbhgIIAEoCzIlLnF1aXZyLm1vZGVscy5Qcm9wb3NpdGlvbi5HcmVhdGVyVGhhbkgAUgtncmVhdGVyVGhhbhI9CgdlcXVhbFRvGAkgASgLMiEucXVpdnIubW9kZWxzLlByb3Bvc2l0aW9uLkVxdWFsVG9IAFIHZXF1YWxUbxJDCgl0aHJlc2hvbGQYCiABKAsyIy5xdWl2ci5tb2RlbHMuUHJvcG9zaXRpb24uVGhyZXNob2xkSABSCXRocmVzaG9sZBIxCgNub3QYCyABKAsyHS5xdWl2ci5tb2RlbHMuUHJvcG9zaXRpb24uTm90SABSA25vdBIxCgNhbmQYDCABKAsyHS5xdWl2ci5tb2RlbHMuUHJvcG9zaXRpb24uQW5kSABSA2FuZBIuCgJvchgNIAEoCzIcLnF1aXZyLm1vZGVscy5Qcm9wb3NpdGlvbi5PckgAUgJvchowCgZMb2NrZWQSJgoEZGF0YRgBIAEoCzISLnF1aXZyLm1vZGVscy5EYXRhUgRkYXRhGloKBkRpZ2VzdBIYCgdyb3V0aW5lGAEgASgJUgdyb3V0aW5lEjYKBmRpZ2VzdBgCIAEoCzIULnF1aXZyLm1vZGVscy5EaWdlc3RCCPpCBYoBAhABUgZkaWdlc3QafwoQRGlnaXRhbFNpZ25hdHVyZRIYCgdyb3V0aW5lGAEgASgJUgdyb3V0aW5lElEKD3ZlcmlmaWNhdGlvbktleRgCIAEoCzIdLnF1aXZyLm1vZGVscy5WZXJpZmljYXRpb25LZXlCCPpCBYoBAhABUg92ZXJpZmljYXRpb25LZXkaRwoLSGVpZ2h0UmFuZ2USFAoFY2hhaW4YASABKAlSBWNoYWluEhAKA21pbhgCIAEoBFIDbWluEhAKA21heBgDIAEoBFIDbWF4Gi8KCVRpY2tSYW5nZRIQCgNtaW4YASABKARSA21pbhIQCgNtYXgYAiABKARSA21heBpPCgpFeGFjdE1hdGNoEhoKCGxvY2F0aW9uGAEgASgJUghsb2NhdGlvbhIlCgljb21wYXJlVG8YAiABKAxCB/pCBHoCGEBSCWNvbXBhcmVUbxpkCghMZXNzVGhhbhIaCghsb2NhdGlvbhgBIAEoCVIIbG9jYXRpb24SPAoJY29tcGFyZVRvGAIgASgLMhQucXVpdnIubW9kZWxzLkludDEyOEII+kIFigECEAFSCWNvbXBhcmVUbxpnCgtHcmVhdGVyVGhhbhIaCghsb2NhdGlvbhgBIAEoCVIIbG9jYXRpb24SPAoJY29tcGFyZVRvGAIgASgLMhQucXVpdnIubW9kZWxzLkludDEyOEII+kIFigECEAFSCWNvbXBhcmVUbxpjCgdFcXVhbFRvEhoKCGxvY2F0aW9uGAEgASgJUghsb2NhdGlvbhI8Cgljb21wYXJlVG8YAiABKAsyFC5xdWl2ci5tb2RlbHMuSW50MTI4Qgj6QgWKAQIQAVIJY29tcGFyZVRvGmQKCVRocmVzaG9sZBI5CgpjaGFsbGVuZ2VzGAEgAygLMhkucXVpdnIubW9kZWxzLlByb3Bvc2l0aW9uUgpjaGFsbGVuZ2VzEhwKCXRocmVzaG9sZBgCIAEoDVIJdGhyZXNob2xkGkwKA05vdBJFCgtwcm9wb3NpdGlvbhgBIAEoCzIZLnF1aXZyLm1vZGVscy5Qcm9wb3NpdGlvbkII+kIFigECEAFSC3Byb3Bvc2l0aW9uGnkKA0FuZBI3CgRsZWZ0GAEgASgLMhkucXVpdnIubW9kZWxzLlByb3Bvc2l0aW9uQgj6QgWKAQIQAVIEbGVmdBI5CgVyaWdodBgCIAEoCzIZLnF1aXZyLm1vZGVscy5Qcm9wb3NpdGlvbkII+kIFigECEAFSBXJpZ2h0GngKAk9yEjcKBGxlZnQYASABKAsyGS5xdWl2ci5tb2RlbHMuUHJvcG9zaXRpb25CCPpCBYoBAhABUgRsZWZ0EjkKBXJpZ2h0GAIgASgLMhkucXVpdnIubW9kZWxzLlByb3Bvc2l0aW9uQgj6QgWKAQIQAVIFcmlnaHRCBwoFdmFsdWU=');
