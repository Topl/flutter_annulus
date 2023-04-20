///
//  Generated code. Do not modify.
//  source: node/models/node_config.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use nodeConfigMapDescriptor instead')
const NodeConfigMap$json = const {
  '1': 'NodeConfigMap',
  '2': const [
    const {'1': 'slotConfigMap', '3': 1, '4': 3, '5': 11, '6': '.co.topl.proto.node.NodeConfigMap.SlotConfigMapEntry', '10': 'slotConfigMap'},
  ],
  '3': const [NodeConfigMap_SlotConfigMapEntry$json],
};

@$core.Deprecated('Use nodeConfigMapDescriptor instead')
const NodeConfigMap_SlotConfigMapEntry$json = const {
  '1': 'SlotConfigMapEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 4, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.co.topl.proto.node.NodeConfig', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `NodeConfigMap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeConfigMapDescriptor = $convert.base64Decode('Cg1Ob2RlQ29uZmlnTWFwEloKDXNsb3RDb25maWdNYXAYASADKAsyNC5jby50b3BsLnByb3RvLm5vZGUuTm9kZUNvbmZpZ01hcC5TbG90Q29uZmlnTWFwRW50cnlSDXNsb3RDb25maWdNYXAaYAoSU2xvdENvbmZpZ01hcEVudHJ5EhAKA2tleRgBIAEoBFIDa2V5EjQKBXZhbHVlGAIgASgLMh4uY28udG9wbC5wcm90by5ub2RlLk5vZGVDb25maWdSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use nodeConfigDescriptor instead')
const NodeConfig$json = const {
  '1': 'NodeConfig',
  '2': const [
    const {'1': 'slotDurationMillis', '3': 1, '4': 1, '5': 13, '10': 'slotDurationMillis'},
  ],
};

/// Descriptor for `NodeConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeConfigDescriptor = $convert.base64Decode('CgpOb2RlQ29uZmlnEi4KEnNsb3REdXJhdGlvbk1pbGxpcxgBIAEoDVISc2xvdER1cmF0aW9uTWlsbGlz');
