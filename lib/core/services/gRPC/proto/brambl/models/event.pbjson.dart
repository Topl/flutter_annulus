///
//  Generated code. Do not modify.
//  source: brambl/models/event.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use eventDescriptor instead')
const Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'eon', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Event.Eon', '9': 0, '10': 'eon'},
    const {'1': 'era', '3': 2, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Event.Era', '9': 0, '10': 'era'},
    const {'1': 'epoch', '3': 3, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Event.Epoch', '9': 0, '10': 'epoch'},
    const {'1': 'header', '3': 4, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Event.Header', '9': 0, '10': 'header'},
    const {'1': 'ioTransaction', '3': 5, '4': 1, '5': 11, '6': '.co.topl.brambl.models.Event.IoTransaction', '9': 0, '10': 'ioTransaction'},
  ],
  '3': const [Event_Eon$json, Event_Era$json, Event_Epoch$json, Event_Header$json, Event_IoTransaction$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use eventDescriptor instead')
const Event_Eon$json = const {
  '1': 'Eon',
  '2': const [
    const {'1': 'beginSlot', '3': 1, '4': 1, '5': 4, '10': 'beginSlot'},
    const {'1': 'height', '3': 2, '4': 1, '5': 4, '10': 'height'},
  ],
};

@$core.Deprecated('Use eventDescriptor instead')
const Event_Era$json = const {
  '1': 'Era',
  '2': const [
    const {'1': 'beginSlot', '3': 1, '4': 1, '5': 4, '10': 'beginSlot'},
    const {'1': 'height', '3': 2, '4': 1, '5': 4, '10': 'height'},
  ],
};

@$core.Deprecated('Use eventDescriptor instead')
const Event_Epoch$json = const {
  '1': 'Epoch',
  '2': const [
    const {'1': 'beginSlot', '3': 1, '4': 1, '5': 4, '10': 'beginSlot'},
    const {'1': 'height', '3': 2, '4': 1, '5': 4, '10': 'height'},
  ],
};

@$core.Deprecated('Use eventDescriptor instead')
const Event_Header$json = const {
  '1': 'Header',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 4, '10': 'height'},
  ],
};

@$core.Deprecated('Use eventDescriptor instead')
const Event_IoTransaction$json = const {
  '1': 'IoTransaction',
  '2': const [
    const {'1': 'schedule', '3': 1, '4': 1, '5': 11, '6': '.co.topl.brambl.models.transaction.Schedule', '8': const {}, '10': 'schedule'},
    const {'1': 'metadata', '3': 4, '4': 1, '5': 11, '6': '.quivr.models.SmallData', '8': const {}, '10': 'metadata'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode('CgVFdmVudBI0CgNlb24YASABKAsyIC5jby50b3BsLmJyYW1ibC5tb2RlbHMuRXZlbnQuRW9uSABSA2VvbhI0CgNlcmEYAiABKAsyIC5jby50b3BsLmJyYW1ibC5tb2RlbHMuRXZlbnQuRXJhSABSA2VyYRI6CgVlcG9jaBgDIAEoCzIiLmNvLnRvcGwuYnJhbWJsLm1vZGVscy5FdmVudC5FcG9jaEgAUgVlcG9jaBI9CgZoZWFkZXIYBCABKAsyIy5jby50b3BsLmJyYW1ibC5tb2RlbHMuRXZlbnQuSGVhZGVySABSBmhlYWRlchJSCg1pb1RyYW5zYWN0aW9uGAUgASgLMiouY28udG9wbC5icmFtYmwubW9kZWxzLkV2ZW50LklvVHJhbnNhY3Rpb25IAFINaW9UcmFuc2FjdGlvbho7CgNFb24SHAoJYmVnaW5TbG90GAEgASgEUgliZWdpblNsb3QSFgoGaGVpZ2h0GAIgASgEUgZoZWlnaHQaOwoDRXJhEhwKCWJlZ2luU2xvdBgBIAEoBFIJYmVnaW5TbG90EhYKBmhlaWdodBgCIAEoBFIGaGVpZ2h0Gj0KBUVwb2NoEhwKCWJlZ2luU2xvdBgBIAEoBFIJYmVnaW5TbG90EhYKBmhlaWdodBgCIAEoBFIGaGVpZ2h0GiAKBkhlYWRlchIWCgZoZWlnaHQYASABKARSBmhlaWdodBqhAQoNSW9UcmFuc2FjdGlvbhJRCghzY2hlZHVsZRgBIAEoCzIrLmNvLnRvcGwuYnJhbWJsLm1vZGVscy50cmFuc2FjdGlvbi5TY2hlZHVsZUII+kIFigECEAFSCHNjaGVkdWxlEj0KCG1ldGFkYXRhGAQgASgLMhcucXVpdnIubW9kZWxzLlNtYWxsRGF0YUII+kIFigECEAFSCG1ldGFkYXRhQgcKBXZhbHVl');
