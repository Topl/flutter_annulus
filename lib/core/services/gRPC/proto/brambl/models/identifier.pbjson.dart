///
//  Generated code. Do not modify.
//  source: brambl/models/identifier.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use identifierDescriptor instead')
const Identifier$json = const {
  '1': 'Identifier',
  '2': const [
    const {'1': 'lock32', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.Lock32', '9': 0, '10': 'lock32'},
    const {'1': 'lock64', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.Lock64', '9': 0, '10': 'lock64'},
    const {'1': 'ioTransaction32', '3': 3, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.IoTransaction32', '9': 0, '10': 'ioTransaction32'},
    const {'1': 'ioTransaction64', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.IoTransaction64', '9': 0, '10': 'ioTransaction64'},
    const {'1': 'accumulatorRoot32', '3': 5, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.AccumulatorRoot32', '9': 0, '10': 'accumulatorRoot32'},
    const {'1': 'accumulatorRoot64', '3': 6, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Identifier.AccumulatorRoot64', '9': 0, '10': 'accumulatorRoot64'},
  ],
  '3': const [Identifier_Lock32$json, Identifier_Lock64$json, Identifier_IoTransaction32$json, Identifier_IoTransaction64$json, Identifier_AccumulatorRoot32$json, Identifier_AccumulatorRoot64$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use identifierDescriptor instead')
const Identifier_Lock32$json = const {
  '1': 'Lock32',
  '2': const [
    const {'1': 'evidence', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Evidence.Sized32', '8': const {}, '10': 'evidence'},
  ],
};

@$core.Deprecated('Use identifierDescriptor instead')
const Identifier_Lock64$json = const {
  '1': 'Lock64',
  '2': const [
    const {'1': 'evidence', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Evidence.Sized64', '8': const {}, '10': 'evidence'},
  ],
};

@$core.Deprecated('Use identifierDescriptor instead')
const Identifier_IoTransaction32$json = const {
  '1': 'IoTransaction32',
  '2': const [
    const {'1': 'evidence', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Evidence.Sized32', '8': const {}, '10': 'evidence'},
  ],
};

@$core.Deprecated('Use identifierDescriptor instead')
const Identifier_IoTransaction64$json = const {
  '1': 'IoTransaction64',
  '2': const [
    const {'1': 'evidence', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Evidence.Sized64', '8': const {}, '10': 'evidence'},
  ],
};

@$core.Deprecated('Use identifierDescriptor instead')
const Identifier_AccumulatorRoot32$json = const {
  '1': 'AccumulatorRoot32',
  '2': const [
    const {'1': 'evidence', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Evidence.Sized32', '8': const {}, '10': 'evidence'},
  ],
};

@$core.Deprecated('Use identifierDescriptor instead')
const Identifier_AccumulatorRoot64$json = const {
  '1': 'AccumulatorRoot64',
  '2': const [
    const {'1': 'evidence', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Evidence.Sized64', '8': const {}, '10': 'evidence'},
  ],
};

/// Descriptor for `Identifier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List identifierDescriptor = $convert.base64Decode('CgpJZGVudGlmaWVyEkIKBmxvY2szMhgBIAEoCzIoLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5JZGVudGlmaWVyLkxvY2szMkgAUgZsb2NrMzISQgoGbG9jazY0GAIgASgLMiguY28udG9wbC5icmFtYmwubW9kZWxzLklkZW50aWZpZXIuTG9jazY0SABSBmxvY2s2NBJdCg9pb1RyYW5zYWN0aW9uMzIYAyABKAsyMS5jby50b3BsLmJyYW1ibC5tb2RlbHMuSWRlbnRpZmllci5Jb1RyYW5zYWN0aW9uMzJIAFIPaW9UcmFuc2FjdGlvbjMyEl0KD2lvVHJhbnNhY3Rpb242NBgEIAEoCzIxLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5JZGVudGlmaWVyLklvVHJhbnNhY3Rpb242NEgAUg9pb1RyYW5zYWN0aW9uNjQSYwoRYWNjdW11bGF0b3JSb290MzIYBSABKAsyMy5jby50b3BsLmJyYW1ibC5tb2RlbHMuSWRlbnRpZmllci5BY2N1bXVsYXRvclJvb3QzMkgAUhFhY2N1bXVsYXRvclJvb3QzMhJjChFhY2N1bXVsYXRvclJvb3Q2NBgGIAEoCzIzLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5JZGVudGlmaWVyLkFjY3VtdWxhdG9yUm9vdDY0SABSEWFjY3VtdWxhdG9yUm9vdDY0GlcKBkxvY2szMhJNCghldmlkZW5jZRgBIAEoCzInLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5FdmlkZW5jZS5TaXplZDMyQgj6QgWKAQIQAVIIZXZpZGVuY2UaVwoGTG9jazY0Ek0KCGV2aWRlbmNlGAEgASgLMicuY28udG9wbC5icmFtYmwubW9kZWxzLkV2aWRlbmNlLlNpemVkNjRCCPpCBYoBAhABUghldmlkZW5jZRpgCg9Jb1RyYW5zYWN0aW9uMzISTQoIZXZpZGVuY2UYASABKAsyJy5jby50b3BsLmJyYW1ibC5tb2RlbHMuRXZpZGVuY2UuU2l6ZWQzMkII+kIFigECEAFSCGV2aWRlbmNlGmAKD0lvVHJhbnNhY3Rpb242NBJNCghldmlkZW5jZRgBIAEoCzInLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5FdmlkZW5jZS5TaXplZDY0Qgj6QgWKAQIQAVIIZXZpZGVuY2UaYgoRQWNjdW11bGF0b3JSb290MzISTQoIZXZpZGVuY2UYASABKAsyJy5jby50b3BsLmJyYW1ibC5tb2RlbHMuRXZpZGVuY2UuU2l6ZWQzMkII+kIFigECEAFSCGV2aWRlbmNlGmIKEUFjY3VtdWxhdG9yUm9vdDY0Ek0KCGV2aWRlbmNlGAEgASgLMicuY28udG9wbC5icmFtYmwubW9kZWxzLkV2aWRlbmNlLlNpemVkNjRCCPpCBYoBAhABUghldmlkZW5jZUIHCgV2YWx1ZQ==');
