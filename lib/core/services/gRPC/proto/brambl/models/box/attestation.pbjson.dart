///
//  Generated code. Do not modify.
//  source: brambl/models/box/attestation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use attestationDescriptor instead')
const Attestation$json = const {
  '1': 'Attestation',
  '2': const [
    const {'1': 'predicate', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Attestation.Predicate', '9': 0, '10': 'predicate'},
    const {'1': 'image32', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Attestation.Image32', '9': 0, '10': 'image32'},
    const {'1': 'image64', '3': 3, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Attestation.Image64', '9': 0, '10': 'image64'},
    const {'1': 'commitment32', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Attestation.Commitment32', '9': 0, '10': 'commitment32'},
    const {'1': 'commitment64', '3': 5, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Attestation.Commitment64', '9': 0, '10': 'commitment64'},
  ],
  '3': const [Attestation_Predicate$json, Attestation_Image32$json, Attestation_Image64$json, Attestation_Commitment32$json, Attestation_Commitment64$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use attestationDescriptor instead')
const Attestation_Predicate$json = const {
  '1': 'Predicate',
  '2': const [
    const {'1': 'lock', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Lock.Predicate', '8': const {}, '10': 'lock'},
    const {'1': 'responses', '3': 2, '4': 3, '5': 11, '6': '.quivr.models.Proof', '10': 'responses'},
  ],
};

@$core.Deprecated('Use attestationDescriptor instead')
const Attestation_Image32$json = const {
  '1': 'Image32',
  '2': const [
    const {'1': 'lock', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Lock.Image32', '8': const {}, '10': 'lock'},
    const {'1': 'known', '3': 2, '4': 3, '5': 11, '6': '.co.topl.brambl.models.box.Challenge', '10': 'known'},
    const {'1': 'responses', '3': 3, '4': 3, '5': 11, '6': '.quivr.models.Proof', '10': 'responses'},
  ],
};

@$core.Deprecated('Use attestationDescriptor instead')
const Attestation_Image64$json = const {
  '1': 'Image64',
  '2': const [
    const {'1': 'lock', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Lock.Image64', '8': const {}, '10': 'lock'},
    const {'1': 'known', '3': 2, '4': 3, '5': 11, '6': '.co.topl.brambl.models.box.Challenge', '10': 'known'},
    const {'1': 'responses', '3': 3, '4': 3, '5': 11, '6': '.quivr.models.Proof', '10': 'responses'},
  ],
};

@$core.Deprecated('Use attestationDescriptor instead')
const Attestation_Commitment32$json = const {
  '1': 'Commitment32',
  '2': const [
    const {'1': 'lock', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Lock.Commitment32', '8': const {}, '10': 'lock'},
    const {'1': 'known', '3': 2, '4': 3, '5': 11, '6': '.co.topl.brambl.models.box.Challenge', '10': 'known'},
    const {'1': 'witness', '3': 3, '4': 3, '5': 11, '6': '.quivr.models.Witness', '10': 'witness'},
    const {'1': 'responses', '3': 4, '4': 3, '5': 11, '6': '.quivr.models.Proof', '10': 'responses'},
  ],
};

@$core.Deprecated('Use attestationDescriptor instead')
const Attestation_Commitment64$json = const {
  '1': 'Commitment64',
  '2': const [
    const {'1': 'lock', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.box.Lock.Commitment64', '8': const {}, '10': 'lock'},
    const {'1': 'known', '3': 2, '4': 3, '5': 11, '6': '.co.topl.brambl.models.box.Challenge', '10': 'known'},
    const {'1': 'witness', '3': 3, '4': 3, '5': 11, '6': '.quivr.models.Witness', '10': 'witness'},
    const {'1': 'responses', '3': 4, '4': 3, '5': 11, '6': '.quivr.models.Proof', '10': 'responses'},
  ],
};

/// Descriptor for `Attestation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attestationDescriptor = $convert.base64Decode('CgtBdHRlc3RhdGlvbhJQCglwcmVkaWNhdGUYASABKAsyMC5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LkF0dGVzdGF0aW9uLlByZWRpY2F0ZUgAUglwcmVkaWNhdGUSSgoHaW1hZ2UzMhgCIAEoCzIuLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guQXR0ZXN0YXRpb24uSW1hZ2UzMkgAUgdpbWFnZTMyEkoKB2ltYWdlNjQYAyABKAsyLi5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LkF0dGVzdGF0aW9uLkltYWdlNjRIAFIHaW1hZ2U2NBJZCgxjb21taXRtZW50MzIYBCABKAsyMy5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LkF0dGVzdGF0aW9uLkNvbW1pdG1lbnQzMkgAUgxjb21taXRtZW50MzISWQoMY29tbWl0bWVudDY0GAUgASgLMjMuY28udG9wbC5icmFtYmwubW9kZWxzLmJveC5BdHRlc3RhdGlvbi5Db21taXRtZW50NjRIAFIMY29tbWl0bWVudDY0GocBCglQcmVkaWNhdGUSRwoEbG9jaxgBIAEoCzIpLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guTG9jay5QcmVkaWNhdGVCCPpCBYoBAhABUgRsb2NrEjEKCXJlc3BvbnNlcxgCIAMoCzITLnF1aXZyLm1vZGVscy5Qcm9vZlIJcmVzcG9uc2VzGr8BCgdJbWFnZTMyEkUKBGxvY2sYASABKAsyJy5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LkxvY2suSW1hZ2UzMkII+kIFigECEAFSBGxvY2sSOgoFa25vd24YAiADKAsyJC5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LkNoYWxsZW5nZVIFa25vd24SMQoJcmVzcG9uc2VzGAMgAygLMhMucXVpdnIubW9kZWxzLlByb29mUglyZXNwb25zZXMavwEKB0ltYWdlNjQSRQoEbG9jaxgBIAEoCzInLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guTG9jay5JbWFnZTY0Qgj6QgWKAQIQAVIEbG9jaxI6CgVrbm93bhgCIAMoCzIkLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guQ2hhbGxlbmdlUgVrbm93bhIxCglyZXNwb25zZXMYAyADKAsyEy5xdWl2ci5tb2RlbHMuUHJvb2ZSCXJlc3BvbnNlcxr6AQoMQ29tbWl0bWVudDMyEkoKBGxvY2sYASABKAsyLC5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LkxvY2suQ29tbWl0bWVudDMyQgj6QgWKAQIQAVIEbG9jaxI6CgVrbm93bhgCIAMoCzIkLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5ib3guQ2hhbGxlbmdlUgVrbm93bhIvCgd3aXRuZXNzGAMgAygLMhUucXVpdnIubW9kZWxzLldpdG5lc3NSB3dpdG5lc3MSMQoJcmVzcG9uc2VzGAQgAygLMhMucXVpdnIubW9kZWxzLlByb29mUglyZXNwb25zZXMa+gEKDENvbW1pdG1lbnQ2NBJKCgRsb2NrGAEgASgLMiwuY28udG9wbC5icmFtYmwubW9kZWxzLmJveC5Mb2NrLkNvbW1pdG1lbnQ2NEII+kIFigECEAFSBGxvY2sSOgoFa25vd24YAiADKAsyJC5jby50b3BsLmJyYW1ibC5tb2RlbHMuYm94LkNoYWxsZW5nZVIFa25vd24SLwoHd2l0bmVzcxgDIAMoCzIVLnF1aXZyLm1vZGVscy5XaXRuZXNzUgd3aXRuZXNzEjEKCXJlc3BvbnNlcxgEIAMoCzITLnF1aXZyLm1vZGVscy5Qcm9vZlIJcmVzcG9uc2VzQgcKBXZhbHVl');
