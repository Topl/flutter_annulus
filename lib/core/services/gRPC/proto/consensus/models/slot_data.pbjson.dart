///
//  Generated code. Do not modify.
//  source: consensus/models/slot_data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use slotDataDescriptor instead')
const SlotData$json = const {
  '1': 'SlotData',
  '2': const [
    const {'1': 'slotId', '3': 1, '4': 1, '5': 11, '6': '.co.topl.consensus.models.SlotId', '8': const {}, '10': 'slotId'},
    const {'1': 'parentSlotId', '3': 2, '4': 1, '5': 11, '6': '.co.topl.consensus.models.SlotId', '8': const {}, '10': 'parentSlotId'},
    const {'1': 'rho', '3': 3, '4': 1, '5': 12, '8': const {}, '10': 'rho'},
    const {'1': 'eta', '3': 4, '4': 1, '5': 12, '8': const {}, '10': 'eta'},
    const {'1': 'height', '3': 5, '4': 1, '5': 4, '10': 'height'},
  ],
};

/// Descriptor for `SlotData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List slotDataDescriptor = $convert.base64Decode('CghTbG90RGF0YRJCCgZzbG90SWQYASABKAsyIC5jby50b3BsLmNvbnNlbnN1cy5tb2RlbHMuU2xvdElkQgj6QgWKAQIQAVIGc2xvdElkEk4KDHBhcmVudFNsb3RJZBgCIAEoCzIgLmNvLnRvcGwuY29uc2Vuc3VzLm1vZGVscy5TbG90SWRCCPpCBYoBAhABUgxwYXJlbnRTbG90SWQSGQoDcmhvGAMgASgMQgf6QgR6AmhAUgNyaG8SGQoDZXRhGAQgASgMQgf6QgR6AmggUgNldGESFgoGaGVpZ2h0GAUgASgEUgZoZWlnaHQ=');
@$core.Deprecated('Use slotIdDescriptor instead')
const SlotId$json = const {
  '1': 'SlotId',
  '2': const [
    const {'1': 'slot', '3': 1, '4': 1, '5': 4, '10': 'slot'},
    const {'1': 'blockId', '3': 2, '4': 1, '5': 11, '6': '.co.topl.consensus.models.BlockId', '8': const {}, '10': 'blockId'},
  ],
};

/// Descriptor for `SlotId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List slotIdDescriptor = $convert.base64Decode('CgZTbG90SWQSEgoEc2xvdBgBIAEoBFIEc2xvdBJFCgdibG9ja0lkGAIgASgLMiEuY28udG9wbC5jb25zZW5zdXMubW9kZWxzLkJsb2NrSWRCCPpCBYoBAhABUgdibG9ja0lk');
