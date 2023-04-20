///
//  Generated code. Do not modify.
//  source: brambl/models/datum.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use datumDescriptor instead')
const Datum$json = const {
  '1': 'Datum',
  '2': const [
    const {'1': 'eon', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Datum.Eon', '9': 0, '10': 'eon'},
    const {'1': 'era', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Datum.Era', '9': 0, '10': 'era'},
    const {'1': 'epoch', '3': 3, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Datum.Epoch', '9': 0, '10': 'epoch'},
    const {'1': 'header', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Datum.Header', '9': 0, '10': 'header'},
    const {'1': 'ioTransaction', '3': 5, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Datum.IoTransaction', '9': 0, '10': 'ioTransaction'},
  ],
  '3': const [Datum_Eon$json, Datum_Era$json, Datum_Epoch$json, Datum_Header$json, Datum_IoTransaction$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use datumDescriptor instead')
const Datum_Eon$json = const {
  '1': 'Eon',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Event.Eon', '8': const {}, '10': 'event'},
  ],
};

@$core.Deprecated('Use datumDescriptor instead')
const Datum_Era$json = const {
  '1': 'Era',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Event.Era', '8': const {}, '10': 'event'},
  ],
};

@$core.Deprecated('Use datumDescriptor instead')
const Datum_Epoch$json = const {
  '1': 'Epoch',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Event.Epoch', '8': const {}, '10': 'event'},
  ],
};

@$core.Deprecated('Use datumDescriptor instead')
const Datum_Header$json = const {
  '1': 'Header',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Event.Header', '8': const {}, '10': 'event'},
  ],
};

@$core.Deprecated('Use datumDescriptor instead')
const Datum_IoTransaction$json = const {
  '1': 'IoTransaction',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Event.IoTransaction', '8': const {}, '10': 'event'},
  ],
};

/// Descriptor for `Datum`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List datumDescriptor = $convert.base64Decode('CgVEYXR1bRI0CgNlb24YASABKAsyIC5jby50b3BsLmJyYW1ibC5tb2RlbHMuRGF0dW0uRW9uSABSA2VvbhI0CgNlcmEYAiABKAsyIC5jby50b3BsLmJyYW1ibC5tb2RlbHMuRGF0dW0uRXJhSABSA2VyYRI6CgVlcG9jaBgDIAEoCzIiLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5EYXR1bS5FcG9jaEgAUgVlcG9jaBI9CgZoZWFkZXIYBCABKAsyIy5jby50b3BsLmJyYW1ibC5tb2RlbHMuRGF0dW0uSGVhZGVySABSBmhlYWRlchJSCg1pb1RyYW5zYWN0aW9uGAUgASgLMiouY28udG9wbC5icmFtYmwubW9kZWxzLkRhdHVtLklvVHJhbnNhY3Rpb25IAFINaW9UcmFuc2FjdGlvbhpHCgNFb24SQAoFZXZlbnQYASABKAsyIC5jby50b3BsLmJyYW1ibC5tb2RlbHMuRXZlbnQuRW9uQgj6QgWKAQIQAVIFZXZlbnQaRwoDRXJhEkAKBWV2ZW50GAEgASgLMiAuY28udG9wbC5icmFtYmwubW9kZWxzLkV2ZW50LkVyYUII+kIFigECEAFSBWV2ZW50GksKBUVwb2NoEkIKBWV2ZW50GAEgASgLMiIuY28udG9wbC5icmFtYmwubW9kZWxzLkV2ZW50LkVwb2NoQgj6QgWKAQIQAVIFZXZlbnQaTQoGSGVhZGVyEkMKBWV2ZW50GAEgASgLMiMuY28udG9wbC5icmFtYmwubW9kZWxzLkV2ZW50LkhlYWRlckII+kIFigECEAFSBWV2ZW50GlsKDUlvVHJhbnNhY3Rpb24SSgoFZXZlbnQYASABKAsyKi5jby50b3BsLmJyYW1ibC5tb2RlbHMuRXZlbnQuSW9UcmFuc2FjdGlvbkII+kIFigECEAFSBWV2ZW50QgcKBXZhbHVl');
