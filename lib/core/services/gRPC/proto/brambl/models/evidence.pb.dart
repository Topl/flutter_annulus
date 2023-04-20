///
//  Generated code. Do not modify.
//  source: brambl/models/evidence.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../quivr/models/shared.pb.dart' as $6;

class Evidence_Sized32 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Evidence.Sized32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$6.Digest_Digest32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'digest', subBuilder: $6.Digest_Digest32.create)
    ..hasRequiredFields = false
  ;

  Evidence_Sized32._() : super();
  factory Evidence_Sized32({
    $6.Digest_Digest32? digest,
  }) {
    final _result = create();
    if (digest != null) {
      _result.digest = digest;
    }
    return _result;
  }
  factory Evidence_Sized32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Evidence_Sized32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Evidence_Sized32 clone() => Evidence_Sized32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Evidence_Sized32 copyWith(void Function(Evidence_Sized32) updates) => super.copyWith((message) => updates(message as Evidence_Sized32)) as Evidence_Sized32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Evidence_Sized32 create() => Evidence_Sized32._();
  Evidence_Sized32 createEmptyInstance() => create();
  static $pb.PbList<Evidence_Sized32> createRepeated() => $pb.PbList<Evidence_Sized32>();
  @$core.pragma('dart2js:noInline')
  static Evidence_Sized32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Evidence_Sized32>(create);
  static Evidence_Sized32? _defaultInstance;

  @$pb.TagNumber(1)
  $6.Digest_Digest32 get digest => $_getN(0);
  @$pb.TagNumber(1)
  set digest($6.Digest_Digest32 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDigest() => $_has(0);
  @$pb.TagNumber(1)
  void clearDigest() => clearField(1);
  @$pb.TagNumber(1)
  $6.Digest_Digest32 ensureDigest() => $_ensure(0);
}

class Evidence_Sized64 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Evidence.Sized64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$6.Digest_Digest64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'digest', subBuilder: $6.Digest_Digest64.create)
    ..hasRequiredFields = false
  ;

  Evidence_Sized64._() : super();
  factory Evidence_Sized64({
    $6.Digest_Digest64? digest,
  }) {
    final _result = create();
    if (digest != null) {
      _result.digest = digest;
    }
    return _result;
  }
  factory Evidence_Sized64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Evidence_Sized64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Evidence_Sized64 clone() => Evidence_Sized64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Evidence_Sized64 copyWith(void Function(Evidence_Sized64) updates) => super.copyWith((message) => updates(message as Evidence_Sized64)) as Evidence_Sized64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Evidence_Sized64 create() => Evidence_Sized64._();
  Evidence_Sized64 createEmptyInstance() => create();
  static $pb.PbList<Evidence_Sized64> createRepeated() => $pb.PbList<Evidence_Sized64>();
  @$core.pragma('dart2js:noInline')
  static Evidence_Sized64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Evidence_Sized64>(create);
  static Evidence_Sized64? _defaultInstance;

  @$pb.TagNumber(1)
  $6.Digest_Digest64 get digest => $_getN(0);
  @$pb.TagNumber(1)
  set digest($6.Digest_Digest64 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDigest() => $_has(0);
  @$pb.TagNumber(1)
  void clearDigest() => clearField(1);
  @$pb.TagNumber(1)
  $6.Digest_Digest64 ensureDigest() => $_ensure(0);
}

enum Evidence_Value {
  sized32, 
  sized64, 
  notSet
}

class Evidence extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Evidence_Value> _Evidence_ValueByTag = {
    1 : Evidence_Value.sized32,
    2 : Evidence_Value.sized64,
    0 : Evidence_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Evidence', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Evidence_Sized32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sized32', subBuilder: Evidence_Sized32.create)
    ..aOM<Evidence_Sized64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sized64', subBuilder: Evidence_Sized64.create)
    ..hasRequiredFields = false
  ;

  Evidence._() : super();
  factory Evidence({
    Evidence_Sized32? sized32,
    Evidence_Sized64? sized64,
  }) {
    final _result = create();
    if (sized32 != null) {
      _result.sized32 = sized32;
    }
    if (sized64 != null) {
      _result.sized64 = sized64;
    }
    return _result;
  }
  factory Evidence.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Evidence.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Evidence clone() => Evidence()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Evidence copyWith(void Function(Evidence) updates) => super.copyWith((message) => updates(message as Evidence)) as Evidence; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Evidence create() => Evidence._();
  Evidence createEmptyInstance() => create();
  static $pb.PbList<Evidence> createRepeated() => $pb.PbList<Evidence>();
  @$core.pragma('dart2js:noInline')
  static Evidence getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Evidence>(create);
  static Evidence? _defaultInstance;

  Evidence_Value whichValue() => _Evidence_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Evidence_Sized32 get sized32 => $_getN(0);
  @$pb.TagNumber(1)
  set sized32(Evidence_Sized32 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSized32() => $_has(0);
  @$pb.TagNumber(1)
  void clearSized32() => clearField(1);
  @$pb.TagNumber(1)
  Evidence_Sized32 ensureSized32() => $_ensure(0);

  @$pb.TagNumber(2)
  Evidence_Sized64 get sized64 => $_getN(1);
  @$pb.TagNumber(2)
  set sized64(Evidence_Sized64 v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSized64() => $_has(1);
  @$pb.TagNumber(2)
  void clearSized64() => clearField(2);
  @$pb.TagNumber(2)
  Evidence_Sized64 ensureSized64() => $_ensure(1);
}

