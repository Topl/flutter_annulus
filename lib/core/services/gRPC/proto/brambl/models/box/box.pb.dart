///
//  Generated code. Do not modify.
//  source: brambl/models/box/box.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'lock.pb.dart' as $13;
import 'value.pb.dart' as $16;

class Box extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Box', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..aOM<$13.Lock>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lock', subBuilder: $13.Lock.create)
    ..aOM<$16.Value>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', subBuilder: $16.Value.create)
    ..hasRequiredFields = false
  ;

  Box._() : super();
  factory Box({
    $13.Lock? lock,
    $16.Value? value,
  }) {
    final _result = create();
    if (lock != null) {
      _result.lock = lock;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory Box.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Box.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Box clone() => Box()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Box copyWith(void Function(Box) updates) => super.copyWith((message) => updates(message as Box)) as Box; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Box create() => Box._();
  Box createEmptyInstance() => create();
  static $pb.PbList<Box> createRepeated() => $pb.PbList<Box>();
  @$core.pragma('dart2js:noInline')
  static Box getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Box>(create);
  static Box? _defaultInstance;

  @$pb.TagNumber(1)
  $13.Lock get lock => $_getN(0);
  @$pb.TagNumber(1)
  set lock($13.Lock v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLock() => $_has(0);
  @$pb.TagNumber(1)
  void clearLock() => clearField(1);
  @$pb.TagNumber(1)
  $13.Lock ensureLock() => $_ensure(0);

  @$pb.TagNumber(2)
  $16.Value get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($16.Value v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  $16.Value ensureValue() => $_ensure(1);
}

