///
//  Generated code. Do not modify.
//  source: brambl/models/identifier.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'evidence.pb.dart' as $7;

class Identifier_Lock32 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Identifier.Lock32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$7.Evidence_Sized32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'evidence', subBuilder: $7.Evidence_Sized32.create)
    ..hasRequiredFields = false
  ;

  Identifier_Lock32._() : super();
  factory Identifier_Lock32({
    $7.Evidence_Sized32? evidence,
  }) {
    final _result = create();
    if (evidence != null) {
      _result.evidence = evidence;
    }
    return _result;
  }
  factory Identifier_Lock32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Identifier_Lock32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Identifier_Lock32 clone() => Identifier_Lock32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Identifier_Lock32 copyWith(void Function(Identifier_Lock32) updates) => super.copyWith((message) => updates(message as Identifier_Lock32)) as Identifier_Lock32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Identifier_Lock32 create() => Identifier_Lock32._();
  Identifier_Lock32 createEmptyInstance() => create();
  static $pb.PbList<Identifier_Lock32> createRepeated() => $pb.PbList<Identifier_Lock32>();
  @$core.pragma('dart2js:noInline')
  static Identifier_Lock32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Identifier_Lock32>(create);
  static Identifier_Lock32? _defaultInstance;

  @$pb.TagNumber(1)
  $7.Evidence_Sized32 get evidence => $_getN(0);
  @$pb.TagNumber(1)
  set evidence($7.Evidence_Sized32 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvidence() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvidence() => clearField(1);
  @$pb.TagNumber(1)
  $7.Evidence_Sized32 ensureEvidence() => $_ensure(0);
}

class Identifier_Lock64 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Identifier.Lock64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$7.Evidence_Sized64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'evidence', subBuilder: $7.Evidence_Sized64.create)
    ..hasRequiredFields = false
  ;

  Identifier_Lock64._() : super();
  factory Identifier_Lock64({
    $7.Evidence_Sized64? evidence,
  }) {
    final _result = create();
    if (evidence != null) {
      _result.evidence = evidence;
    }
    return _result;
  }
  factory Identifier_Lock64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Identifier_Lock64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Identifier_Lock64 clone() => Identifier_Lock64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Identifier_Lock64 copyWith(void Function(Identifier_Lock64) updates) => super.copyWith((message) => updates(message as Identifier_Lock64)) as Identifier_Lock64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Identifier_Lock64 create() => Identifier_Lock64._();
  Identifier_Lock64 createEmptyInstance() => create();
  static $pb.PbList<Identifier_Lock64> createRepeated() => $pb.PbList<Identifier_Lock64>();
  @$core.pragma('dart2js:noInline')
  static Identifier_Lock64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Identifier_Lock64>(create);
  static Identifier_Lock64? _defaultInstance;

  @$pb.TagNumber(1)
  $7.Evidence_Sized64 get evidence => $_getN(0);
  @$pb.TagNumber(1)
  set evidence($7.Evidence_Sized64 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvidence() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvidence() => clearField(1);
  @$pb.TagNumber(1)
  $7.Evidence_Sized64 ensureEvidence() => $_ensure(0);
}

class Identifier_IoTransaction32 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Identifier.IoTransaction32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$7.Evidence_Sized32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'evidence', subBuilder: $7.Evidence_Sized32.create)
    ..hasRequiredFields = false
  ;

  Identifier_IoTransaction32._() : super();
  factory Identifier_IoTransaction32({
    $7.Evidence_Sized32? evidence,
  }) {
    final _result = create();
    if (evidence != null) {
      _result.evidence = evidence;
    }
    return _result;
  }
  factory Identifier_IoTransaction32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Identifier_IoTransaction32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Identifier_IoTransaction32 clone() => Identifier_IoTransaction32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Identifier_IoTransaction32 copyWith(void Function(Identifier_IoTransaction32) updates) => super.copyWith((message) => updates(message as Identifier_IoTransaction32)) as Identifier_IoTransaction32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Identifier_IoTransaction32 create() => Identifier_IoTransaction32._();
  Identifier_IoTransaction32 createEmptyInstance() => create();
  static $pb.PbList<Identifier_IoTransaction32> createRepeated() => $pb.PbList<Identifier_IoTransaction32>();
  @$core.pragma('dart2js:noInline')
  static Identifier_IoTransaction32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Identifier_IoTransaction32>(create);
  static Identifier_IoTransaction32? _defaultInstance;

  @$pb.TagNumber(1)
  $7.Evidence_Sized32 get evidence => $_getN(0);
  @$pb.TagNumber(1)
  set evidence($7.Evidence_Sized32 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvidence() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvidence() => clearField(1);
  @$pb.TagNumber(1)
  $7.Evidence_Sized32 ensureEvidence() => $_ensure(0);
}

class Identifier_IoTransaction64 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Identifier.IoTransaction64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$7.Evidence_Sized64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'evidence', subBuilder: $7.Evidence_Sized64.create)
    ..hasRequiredFields = false
  ;

  Identifier_IoTransaction64._() : super();
  factory Identifier_IoTransaction64({
    $7.Evidence_Sized64? evidence,
  }) {
    final _result = create();
    if (evidence != null) {
      _result.evidence = evidence;
    }
    return _result;
  }
  factory Identifier_IoTransaction64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Identifier_IoTransaction64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Identifier_IoTransaction64 clone() => Identifier_IoTransaction64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Identifier_IoTransaction64 copyWith(void Function(Identifier_IoTransaction64) updates) => super.copyWith((message) => updates(message as Identifier_IoTransaction64)) as Identifier_IoTransaction64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Identifier_IoTransaction64 create() => Identifier_IoTransaction64._();
  Identifier_IoTransaction64 createEmptyInstance() => create();
  static $pb.PbList<Identifier_IoTransaction64> createRepeated() => $pb.PbList<Identifier_IoTransaction64>();
  @$core.pragma('dart2js:noInline')
  static Identifier_IoTransaction64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Identifier_IoTransaction64>(create);
  static Identifier_IoTransaction64? _defaultInstance;

  @$pb.TagNumber(1)
  $7.Evidence_Sized64 get evidence => $_getN(0);
  @$pb.TagNumber(1)
  set evidence($7.Evidence_Sized64 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvidence() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvidence() => clearField(1);
  @$pb.TagNumber(1)
  $7.Evidence_Sized64 ensureEvidence() => $_ensure(0);
}

class Identifier_AccumulatorRoot32 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Identifier.AccumulatorRoot32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$7.Evidence_Sized32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'evidence', subBuilder: $7.Evidence_Sized32.create)
    ..hasRequiredFields = false
  ;

  Identifier_AccumulatorRoot32._() : super();
  factory Identifier_AccumulatorRoot32({
    $7.Evidence_Sized32? evidence,
  }) {
    final _result = create();
    if (evidence != null) {
      _result.evidence = evidence;
    }
    return _result;
  }
  factory Identifier_AccumulatorRoot32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Identifier_AccumulatorRoot32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Identifier_AccumulatorRoot32 clone() => Identifier_AccumulatorRoot32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Identifier_AccumulatorRoot32 copyWith(void Function(Identifier_AccumulatorRoot32) updates) => super.copyWith((message) => updates(message as Identifier_AccumulatorRoot32)) as Identifier_AccumulatorRoot32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Identifier_AccumulatorRoot32 create() => Identifier_AccumulatorRoot32._();
  Identifier_AccumulatorRoot32 createEmptyInstance() => create();
  static $pb.PbList<Identifier_AccumulatorRoot32> createRepeated() => $pb.PbList<Identifier_AccumulatorRoot32>();
  @$core.pragma('dart2js:noInline')
  static Identifier_AccumulatorRoot32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Identifier_AccumulatorRoot32>(create);
  static Identifier_AccumulatorRoot32? _defaultInstance;

  @$pb.TagNumber(1)
  $7.Evidence_Sized32 get evidence => $_getN(0);
  @$pb.TagNumber(1)
  set evidence($7.Evidence_Sized32 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvidence() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvidence() => clearField(1);
  @$pb.TagNumber(1)
  $7.Evidence_Sized32 ensureEvidence() => $_ensure(0);
}

class Identifier_AccumulatorRoot64 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Identifier.AccumulatorRoot64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$7.Evidence_Sized64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'evidence', subBuilder: $7.Evidence_Sized64.create)
    ..hasRequiredFields = false
  ;

  Identifier_AccumulatorRoot64._() : super();
  factory Identifier_AccumulatorRoot64({
    $7.Evidence_Sized64? evidence,
  }) {
    final _result = create();
    if (evidence != null) {
      _result.evidence = evidence;
    }
    return _result;
  }
  factory Identifier_AccumulatorRoot64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Identifier_AccumulatorRoot64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Identifier_AccumulatorRoot64 clone() => Identifier_AccumulatorRoot64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Identifier_AccumulatorRoot64 copyWith(void Function(Identifier_AccumulatorRoot64) updates) => super.copyWith((message) => updates(message as Identifier_AccumulatorRoot64)) as Identifier_AccumulatorRoot64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Identifier_AccumulatorRoot64 create() => Identifier_AccumulatorRoot64._();
  Identifier_AccumulatorRoot64 createEmptyInstance() => create();
  static $pb.PbList<Identifier_AccumulatorRoot64> createRepeated() => $pb.PbList<Identifier_AccumulatorRoot64>();
  @$core.pragma('dart2js:noInline')
  static Identifier_AccumulatorRoot64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Identifier_AccumulatorRoot64>(create);
  static Identifier_AccumulatorRoot64? _defaultInstance;

  @$pb.TagNumber(1)
  $7.Evidence_Sized64 get evidence => $_getN(0);
  @$pb.TagNumber(1)
  set evidence($7.Evidence_Sized64 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvidence() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvidence() => clearField(1);
  @$pb.TagNumber(1)
  $7.Evidence_Sized64 ensureEvidence() => $_ensure(0);
}

enum Identifier_Value {
  lock32, 
  lock64, 
  ioTransaction32, 
  ioTransaction64, 
  accumulatorRoot32, 
  accumulatorRoot64, 
  notSet
}

class Identifier extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Identifier_Value> _Identifier_ValueByTag = {
    1 : Identifier_Value.lock32,
    2 : Identifier_Value.lock64,
    3 : Identifier_Value.ioTransaction32,
    4 : Identifier_Value.ioTransaction64,
    5 : Identifier_Value.accumulatorRoot32,
    6 : Identifier_Value.accumulatorRoot64,
    0 : Identifier_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Identifier', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
    ..aOM<Identifier_Lock32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lock32', subBuilder: Identifier_Lock32.create)
    ..aOM<Identifier_Lock64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lock64', subBuilder: Identifier_Lock64.create)
    ..aOM<Identifier_IoTransaction32>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ioTransaction32', protoName: 'ioTransaction32', subBuilder: Identifier_IoTransaction32.create)
    ..aOM<Identifier_IoTransaction64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ioTransaction64', protoName: 'ioTransaction64', subBuilder: Identifier_IoTransaction64.create)
    ..aOM<Identifier_AccumulatorRoot32>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accumulatorRoot32', protoName: 'accumulatorRoot32', subBuilder: Identifier_AccumulatorRoot32.create)
    ..aOM<Identifier_AccumulatorRoot64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accumulatorRoot64', protoName: 'accumulatorRoot64', subBuilder: Identifier_AccumulatorRoot64.create)
    ..hasRequiredFields = false
  ;

  Identifier._() : super();
  factory Identifier({
    Identifier_Lock32? lock32,
    Identifier_Lock64? lock64,
    Identifier_IoTransaction32? ioTransaction32,
    Identifier_IoTransaction64? ioTransaction64,
    Identifier_AccumulatorRoot32? accumulatorRoot32,
    Identifier_AccumulatorRoot64? accumulatorRoot64,
  }) {
    final _result = create();
    if (lock32 != null) {
      _result.lock32 = lock32;
    }
    if (lock64 != null) {
      _result.lock64 = lock64;
    }
    if (ioTransaction32 != null) {
      _result.ioTransaction32 = ioTransaction32;
    }
    if (ioTransaction64 != null) {
      _result.ioTransaction64 = ioTransaction64;
    }
    if (accumulatorRoot32 != null) {
      _result.accumulatorRoot32 = accumulatorRoot32;
    }
    if (accumulatorRoot64 != null) {
      _result.accumulatorRoot64 = accumulatorRoot64;
    }
    return _result;
  }
  factory Identifier.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Identifier.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Identifier clone() => Identifier()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Identifier copyWith(void Function(Identifier) updates) => super.copyWith((message) => updates(message as Identifier)) as Identifier; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Identifier create() => Identifier._();
  Identifier createEmptyInstance() => create();
  static $pb.PbList<Identifier> createRepeated() => $pb.PbList<Identifier>();
  @$core.pragma('dart2js:noInline')
  static Identifier getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Identifier>(create);
  static Identifier? _defaultInstance;

  Identifier_Value whichValue() => _Identifier_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Identifier_Lock32 get lock32 => $_getN(0);
  @$pb.TagNumber(1)
  set lock32(Identifier_Lock32 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLock32() => $_has(0);
  @$pb.TagNumber(1)
  void clearLock32() => clearField(1);
  @$pb.TagNumber(1)
  Identifier_Lock32 ensureLock32() => $_ensure(0);

  @$pb.TagNumber(2)
  Identifier_Lock64 get lock64 => $_getN(1);
  @$pb.TagNumber(2)
  set lock64(Identifier_Lock64 v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLock64() => $_has(1);
  @$pb.TagNumber(2)
  void clearLock64() => clearField(2);
  @$pb.TagNumber(2)
  Identifier_Lock64 ensureLock64() => $_ensure(1);

  @$pb.TagNumber(3)
  Identifier_IoTransaction32 get ioTransaction32 => $_getN(2);
  @$pb.TagNumber(3)
  set ioTransaction32(Identifier_IoTransaction32 v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasIoTransaction32() => $_has(2);
  @$pb.TagNumber(3)
  void clearIoTransaction32() => clearField(3);
  @$pb.TagNumber(3)
  Identifier_IoTransaction32 ensureIoTransaction32() => $_ensure(2);

  @$pb.TagNumber(4)
  Identifier_IoTransaction64 get ioTransaction64 => $_getN(3);
  @$pb.TagNumber(4)
  set ioTransaction64(Identifier_IoTransaction64 v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasIoTransaction64() => $_has(3);
  @$pb.TagNumber(4)
  void clearIoTransaction64() => clearField(4);
  @$pb.TagNumber(4)
  Identifier_IoTransaction64 ensureIoTransaction64() => $_ensure(3);

  @$pb.TagNumber(5)
  Identifier_AccumulatorRoot32 get accumulatorRoot32 => $_getN(4);
  @$pb.TagNumber(5)
  set accumulatorRoot32(Identifier_AccumulatorRoot32 v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAccumulatorRoot32() => $_has(4);
  @$pb.TagNumber(5)
  void clearAccumulatorRoot32() => clearField(5);
  @$pb.TagNumber(5)
  Identifier_AccumulatorRoot32 ensureAccumulatorRoot32() => $_ensure(4);

  @$pb.TagNumber(6)
  Identifier_AccumulatorRoot64 get accumulatorRoot64 => $_getN(5);
  @$pb.TagNumber(6)
  set accumulatorRoot64(Identifier_AccumulatorRoot64 v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAccumulatorRoot64() => $_has(5);
  @$pb.TagNumber(6)
  void clearAccumulatorRoot64() => clearField(6);
  @$pb.TagNumber(6)
  Identifier_AccumulatorRoot64 ensureAccumulatorRoot64() => $_ensure(5);
}

