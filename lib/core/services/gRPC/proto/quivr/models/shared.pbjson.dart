///
//  Generated code. Do not modify.
//  source: quivr/models/shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use dataDescriptor instead')
const Data$json = const {
  '1': 'Data',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `Data`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataDescriptor = $convert.base64Decode('CgREYXRhEhQKBXZhbHVlGAEgASgMUgV2YWx1ZQ==');
@$core.Deprecated('Use smallDataDescriptor instead')
const SmallData$json = const {
  '1': 'SmallData',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'value'},
  ],
};

/// Descriptor for `SmallData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smallDataDescriptor = $convert.base64Decode('CglTbWFsbERhdGESHQoFdmFsdWUYASABKAxCB/pCBHoCGEBSBXZhbHVl');
@$core.Deprecated('Use rootDescriptor instead')
const Root$json = const {
  '1': 'Root',
  '2': const [
    const {'1': 'root32', '3': 1, '4': 1, '5': 12, '8': const {}, '9': 0, '10': 'root32'},
    const {'1': 'root64', '3': 2, '4': 1, '5': 12, '8': const {}, '9': 0, '10': 'root64'},
  ],
  '8': const [
    const {'1': 'value'},
  ],
};

/// Descriptor for `Root`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rootDescriptor = $convert.base64Decode('CgRSb290EiEKBnJvb3QzMhgBIAEoDEIH+kIEegJoIEgAUgZyb290MzISIQoGcm9vdDY0GAIgASgMQgf6QgR6AmhASABSBnJvb3Q2NEIHCgV2YWx1ZQ==');
@$core.Deprecated('Use preimageDescriptor instead')
const Preimage$json = const {
  '1': 'Preimage',
  '2': const [
    const {'1': 'input', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'input'},
    const {'1': 'salt', '3': 2, '4': 1, '5': 12, '8': const {}, '10': 'salt'},
  ],
};

/// Descriptor for `Preimage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preimageDescriptor = $convert.base64Decode('CghQcmVpbWFnZRIfCgVpbnB1dBgBIAEoDEIJ+kIGegQYgIABUgVpbnB1dBIdCgRzYWx0GAIgASgMQgn6QgZ6BBiAgAFSBHNhbHQ=');
@$core.Deprecated('Use digestDescriptor instead')
const Digest$json = const {
  '1': 'Digest',
  '2': const [
    const {'1': 'digest32', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Digest.Digest32', '9': 0, '10': 'digest32'},
    const {'1': 'digest64', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Digest.Digest64', '9': 0, '10': 'digest64'},
  ],
  '3': const [Digest_Digest32$json, Digest_Digest64$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use digestDescriptor instead')
const Digest_Digest32$json = const {
  '1': 'Digest32',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'value'},
  ],
};

@$core.Deprecated('Use digestDescriptor instead')
const Digest_Digest64$json = const {
  '1': 'Digest64',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'value'},
  ],
};

/// Descriptor for `Digest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List digestDescriptor = $convert.base64Decode('CgZEaWdlc3QSOwoIZGlnZXN0MzIYASABKAsyHS5xdWl2ci5tb2RlbHMuRGlnZXN0LkRpZ2VzdDMySABSCGRpZ2VzdDMyEjsKCGRpZ2VzdDY0GAIgASgLMh0ucXVpdnIubW9kZWxzLkRpZ2VzdC5EaWdlc3Q2NEgAUghkaWdlc3Q2NBopCghEaWdlc3QzMhIdCgV2YWx1ZRgBIAEoDEIH+kIEegJoIFIFdmFsdWUaKQoIRGlnZXN0NjQSHQoFdmFsdWUYASABKAxCB/pCBHoCaEBSBXZhbHVlQgcKBXZhbHVl');
@$core.Deprecated('Use digestVerificationDescriptor instead')
const DigestVerification$json = const {
  '1': 'DigestVerification',
  '2': const [
    const {'1': 'digest', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.Digest', '8': const {}, '10': 'digest'},
    const {'1': 'preimage', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Preimage', '8': const {}, '10': 'preimage'},
  ],
};

/// Descriptor for `DigestVerification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List digestVerificationDescriptor = $convert.base64Decode('ChJEaWdlc3RWZXJpZmljYXRpb24SNgoGZGlnZXN0GAEgASgLMhQucXVpdnIubW9kZWxzLkRpZ2VzdEII+kIFigECEAFSBmRpZ2VzdBI8CghwcmVpbWFnZRgCIAEoCzIWLnF1aXZyLm1vZGVscy5QcmVpbWFnZUII+kIFigECEAFSCHByZWltYWdl');
@$core.Deprecated('Use verificationKeyDescriptor instead')
const VerificationKey$json = const {
  '1': 'VerificationKey',
  '2': const [
    const {'1': 'ed25519', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.VerificationKey.Ed25519Vk', '9': 0, '10': 'ed25519'},
    const {'1': 'extendedEd25519', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.VerificationKey.ExtendedEd25519Vk', '9': 0, '10': 'extendedEd25519'},
  ],
  '3': const [VerificationKey_Ed25519Vk$json, VerificationKey_ExtendedEd25519Vk$json],
  '8': const [
    const {'1': 'vk', '2': const {}},
  ],
};

@$core.Deprecated('Use verificationKeyDescriptor instead')
const VerificationKey_Ed25519Vk$json = const {
  '1': 'Ed25519Vk',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'value'},
  ],
};

@$core.Deprecated('Use verificationKeyDescriptor instead')
const VerificationKey_ExtendedEd25519Vk$json = const {
  '1': 'ExtendedEd25519Vk',
  '2': const [
    const {'1': 'vk', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.VerificationKey.Ed25519Vk', '8': const {}, '10': 'vk'},
    const {'1': 'chainCode', '3': 2, '4': 1, '5': 12, '8': const {}, '10': 'chainCode'},
  ],
};

/// Descriptor for `VerificationKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verificationKeyDescriptor = $convert.base64Decode('Cg9WZXJpZmljYXRpb25LZXkSQwoHZWQyNTUxORgBIAEoCzInLnF1aXZyLm1vZGVscy5WZXJpZmljYXRpb25LZXkuRWQyNTUxOVZrSABSB2VkMjU1MTkSWwoPZXh0ZW5kZWRFZDI1NTE5GAIgASgLMi8ucXVpdnIubW9kZWxzLlZlcmlmaWNhdGlvbktleS5FeHRlbmRlZEVkMjU1MTlWa0gAUg9leHRlbmRlZEVkMjU1MTkaKgoJRWQyNTUxOVZrEh0KBXZhbHVlGAEgASgMQgf6QgR6AmggUgV2YWx1ZRp9ChFFeHRlbmRlZEVkMjU1MTlWaxJBCgJ2axgBIAEoCzInLnF1aXZyLm1vZGVscy5WZXJpZmljYXRpb25LZXkuRWQyNTUxOVZrQgj6QgWKAQIQAVICdmsSJQoJY2hhaW5Db2RlGAIgASgMQgf6QgR6AmggUgljaGFpbkNvZGVCCQoCdmsSA/hCAQ==');
@$core.Deprecated('Use signingKeyDescriptor instead')
const SigningKey$json = const {
  '1': 'SigningKey',
  '2': const [
    const {'1': 'ed25519', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.SigningKey.Ed25519Sk', '9': 0, '10': 'ed25519'},
    const {'1': 'extendedEd25519', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.SigningKey.ExtendedEd25519Sk', '9': 0, '10': 'extendedEd25519'},
  ],
  '3': const [SigningKey_Ed25519Sk$json, SigningKey_ExtendedEd25519Sk$json],
  '8': const [
    const {'1': 'sk', '2': const {}},
  ],
};

@$core.Deprecated('Use signingKeyDescriptor instead')
const SigningKey_Ed25519Sk$json = const {
  '1': 'Ed25519Sk',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'value'},
  ],
};

@$core.Deprecated('Use signingKeyDescriptor instead')
const SigningKey_ExtendedEd25519Sk$json = const {
  '1': 'ExtendedEd25519Sk',
  '2': const [
    const {'1': 'leftKey', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'leftKey'},
    const {'1': 'rightKey', '3': 2, '4': 1, '5': 12, '8': const {}, '10': 'rightKey'},
    const {'1': 'chainCode', '3': 3, '4': 1, '5': 12, '8': const {}, '10': 'chainCode'},
  ],
};

/// Descriptor for `SigningKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingKeyDescriptor = $convert.base64Decode('CgpTaWduaW5nS2V5Ej4KB2VkMjU1MTkYASABKAsyIi5xdWl2ci5tb2RlbHMuU2lnbmluZ0tleS5FZDI1NTE5U2tIAFIHZWQyNTUxORJWCg9leHRlbmRlZEVkMjU1MTkYAiABKAsyKi5xdWl2ci5tb2RlbHMuU2lnbmluZ0tleS5FeHRlbmRlZEVkMjU1MTlTa0gAUg9leHRlbmRlZEVkMjU1MTkaKgoJRWQyNTUxOVNrEh0KBXZhbHVlGAEgASgMQgf6QgR6AmggUgV2YWx1ZRqCAQoRRXh0ZW5kZWRFZDI1NTE5U2sSIQoHbGVmdEtleRgBIAEoDEIH+kIEegJoIFIHbGVmdEtleRIjCghyaWdodEtleRgCIAEoDEIH+kIEegJoIFIIcmlnaHRLZXkSJQoJY2hhaW5Db2RlGAMgASgMQgf6QgR6AmggUgljaGFpbkNvZGVCCQoCc2sSA/hCAQ==');
@$core.Deprecated('Use keyPairDescriptor instead')
const KeyPair$json = const {
  '1': 'KeyPair',
  '2': const [
    const {'1': 'vk', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.VerificationKey', '8': const {}, '10': 'vk'},
    const {'1': 'sk', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.SigningKey', '8': const {}, '10': 'sk'},
  ],
};

/// Descriptor for `KeyPair`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyPairDescriptor = $convert.base64Decode('CgdLZXlQYWlyEjcKAnZrGAEgASgLMh0ucXVpdnIubW9kZWxzLlZlcmlmaWNhdGlvbktleUII+kIFigECEAFSAnZrEjIKAnNrGAIgASgLMhgucXVpdnIubW9kZWxzLlNpZ25pbmdLZXlCCPpCBYoBAhABUgJzaw==');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEhQKBXZhbHVlGAEgASgMUgV2YWx1ZQ==');
@$core.Deprecated('Use witnessDescriptor instead')
const Witness$json = const {
  '1': 'Witness',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'value'},
  ],
};

/// Descriptor for `Witness`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List witnessDescriptor = $convert.base64Decode('CgdXaXRuZXNzEh0KBXZhbHVlGAEgASgMQgf6QgR6AmhAUgV2YWx1ZQ==');
@$core.Deprecated('Use signatureVerificationDescriptor instead')
const SignatureVerification$json = const {
  '1': 'SignatureVerification',
  '2': const [
    const {'1': 'verificationKey', '3': 1, '4': 1, '5': 11, '6': '.quivr.models.VerificationKey', '8': const {}, '10': 'verificationKey'},
    const {'1': 'signature', '3': 2, '4': 1, '5': 11, '6': '.quivr.models.Witness', '8': const {}, '10': 'signature'},
    const {'1': 'message', '3': 3, '4': 1, '5': 11, '6': '.quivr.models.Message', '8': const {}, '10': 'message'},
  ],
};

/// Descriptor for `SignatureVerification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signatureVerificationDescriptor = $convert.base64Decode('ChVTaWduYXR1cmVWZXJpZmljYXRpb24SUQoPdmVyaWZpY2F0aW9uS2V5GAEgASgLMh0ucXVpdnIubW9kZWxzLlZlcmlmaWNhdGlvbktleUII+kIFigECEAFSD3ZlcmlmaWNhdGlvbktleRI9CglzaWduYXR1cmUYAiABKAsyFS5xdWl2ci5tb2RlbHMuV2l0bmVzc0II+kIFigECEAFSCXNpZ25hdHVyZRI5CgdtZXNzYWdlGAMgASgLMhUucXVpdnIubW9kZWxzLk1lc3NhZ2VCCPpCBYoBAhABUgdtZXNzYWdl');
@$core.Deprecated('Use signableBytesDescriptor instead')
const SignableBytes$json = const {
  '1': 'SignableBytes',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `SignableBytes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signableBytesDescriptor = $convert.base64Decode('Cg1TaWduYWJsZUJ5dGVzEhQKBXZhbHVlGAEgASgMUgV2YWx1ZQ==');
@$core.Deprecated('Use txBindDescriptor instead')
const TxBind$json = const {
  '1': 'TxBind',
  '2': const [
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '8': const {}, '10': 'value'},
  ],
};

/// Descriptor for `TxBind`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txBindDescriptor = $convert.base64Decode('CgZUeEJpbmQSHQoFdmFsdWUYAiABKAxCB/pCBHoCaCBSBXZhbHVl');
@$core.Deprecated('Use int128Descriptor instead')
const Int128$json = const {
  '1': 'Int128',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'value'},
  ],
};

/// Descriptor for `Int128`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List int128Descriptor = $convert.base64Decode('CgZJbnQxMjgSHQoFdmFsdWUYASABKAxCB/pCBHoCGBBSBXZhbHVl');
