///
//  Generated code. Do not modify.
//  source: node/models/node_config.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class NodeConfigMap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NodeConfigMap', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.proto.node'), createEmptyInstance: create)
    ..m<$fixnum.Int64, NodeConfig>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slotConfigMap', protoName: 'slotConfigMap', entryClassName: 'NodeConfigMap.SlotConfigMapEntry', keyFieldType: $pb.PbFieldType.OU6, valueFieldType: $pb.PbFieldType.OM, valueCreator: NodeConfig.create, packageName: const $pb.PackageName('co.topl.proto.node'))
    ..hasRequiredFields = false
  ;

  NodeConfigMap._() : super();
  factory NodeConfigMap({
    $core.Map<$fixnum.Int64, NodeConfig>? slotConfigMap,
  }) {
    final _result = create();
    if (slotConfigMap != null) {
      _result.slotConfigMap.addAll(slotConfigMap);
    }
    return _result;
  }
  factory NodeConfigMap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeConfigMap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NodeConfigMap clone() => NodeConfigMap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NodeConfigMap copyWith(void Function(NodeConfigMap) updates) => super.copyWith((message) => updates(message as NodeConfigMap)) as NodeConfigMap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NodeConfigMap create() => NodeConfigMap._();
  NodeConfigMap createEmptyInstance() => create();
  static $pb.PbList<NodeConfigMap> createRepeated() => $pb.PbList<NodeConfigMap>();
  @$core.pragma('dart2js:noInline')
  static NodeConfigMap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeConfigMap>(create);
  static NodeConfigMap? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$fixnum.Int64, NodeConfig> get slotConfigMap => $_getMap(0);
}

class NodeConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NodeConfig', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.proto.node'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slotDurationMillis', $pb.PbFieldType.OU3, protoName: 'slotDurationMillis')
    ..hasRequiredFields = false
  ;

  NodeConfig._() : super();
  factory NodeConfig({
    $core.int? slotDurationMillis,
  }) {
    final _result = create();
    if (slotDurationMillis != null) {
      _result.slotDurationMillis = slotDurationMillis;
    }
    return _result;
  }
  factory NodeConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NodeConfig clone() => NodeConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NodeConfig copyWith(void Function(NodeConfig) updates) => super.copyWith((message) => updates(message as NodeConfig)) as NodeConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NodeConfig create() => NodeConfig._();
  NodeConfig createEmptyInstance() => create();
  static $pb.PbList<NodeConfig> createRepeated() => $pb.PbList<NodeConfig>();
  @$core.pragma('dart2js:noInline')
  static NodeConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeConfig>(create);
  static NodeConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get slotDurationMillis => $_getIZ(0);
  @$pb.TagNumber(1)
  set slotDurationMillis($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlotDurationMillis() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlotDurationMillis() => clearField(1);
}

