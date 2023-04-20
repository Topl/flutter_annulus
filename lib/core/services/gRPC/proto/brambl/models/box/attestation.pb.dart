///
//  Generated code. Do not modify.
//  source: brambl/models/box/attestation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'lock.pb.dart' as $13;
import '../../../quivr/models/proof.pb.dart' as $14;
import 'challenge.pb.dart' as $12;
import '../../../quivr/models/shared.pb.dart' as $6;

class Attestation_Predicate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Attestation.Predicate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..aOM<$13.Lock_Predicate>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lock', subBuilder: $13.Lock_Predicate.create)
    ..pc<$14.Proof>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responses', $pb.PbFieldType.PM, subBuilder: $14.Proof.create)
    ..hasRequiredFields = false
  ;

  Attestation_Predicate._() : super();
  factory Attestation_Predicate({
    $13.Lock_Predicate? lock,
    $core.Iterable<$14.Proof>? responses,
  }) {
    final _result = create();
    if (lock != null) {
      _result.lock = lock;
    }
    if (responses != null) {
      _result.responses.addAll(responses);
    }
    return _result;
  }
  factory Attestation_Predicate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Attestation_Predicate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Attestation_Predicate clone() => Attestation_Predicate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Attestation_Predicate copyWith(void Function(Attestation_Predicate) updates) => super.copyWith((message) => updates(message as Attestation_Predicate)) as Attestation_Predicate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Attestation_Predicate create() => Attestation_Predicate._();
  Attestation_Predicate createEmptyInstance() => create();
  static $pb.PbList<Attestation_Predicate> createRepeated() => $pb.PbList<Attestation_Predicate>();
  @$core.pragma('dart2js:noInline')
  static Attestation_Predicate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Attestation_Predicate>(create);
  static Attestation_Predicate? _defaultInstance;

  @$pb.TagNumber(1)
  $13.Lock_Predicate get lock => $_getN(0);
  @$pb.TagNumber(1)
  set lock($13.Lock_Predicate v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLock() => $_has(0);
  @$pb.TagNumber(1)
  void clearLock() => clearField(1);
  @$pb.TagNumber(1)
  $13.Lock_Predicate ensureLock() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$14.Proof> get responses => $_getList(1);
}

class Attestation_Image32 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Attestation.Image32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..aOM<$13.Lock_Image32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lock', subBuilder: $13.Lock_Image32.create)
    ..pc<$12.Challenge>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'known', $pb.PbFieldType.PM, subBuilder: $12.Challenge.create)
    ..pc<$14.Proof>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responses', $pb.PbFieldType.PM, subBuilder: $14.Proof.create)
    ..hasRequiredFields = false
  ;

  Attestation_Image32._() : super();
  factory Attestation_Image32({
    $13.Lock_Image32? lock,
    $core.Iterable<$12.Challenge>? known,
    $core.Iterable<$14.Proof>? responses,
  }) {
    final _result = create();
    if (lock != null) {
      _result.lock = lock;
    }
    if (known != null) {
      _result.known.addAll(known);
    }
    if (responses != null) {
      _result.responses.addAll(responses);
    }
    return _result;
  }
  factory Attestation_Image32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Attestation_Image32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Attestation_Image32 clone() => Attestation_Image32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Attestation_Image32 copyWith(void Function(Attestation_Image32) updates) => super.copyWith((message) => updates(message as Attestation_Image32)) as Attestation_Image32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Attestation_Image32 create() => Attestation_Image32._();
  Attestation_Image32 createEmptyInstance() => create();
  static $pb.PbList<Attestation_Image32> createRepeated() => $pb.PbList<Attestation_Image32>();
  @$core.pragma('dart2js:noInline')
  static Attestation_Image32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Attestation_Image32>(create);
  static Attestation_Image32? _defaultInstance;

  @$pb.TagNumber(1)
  $13.Lock_Image32 get lock => $_getN(0);
  @$pb.TagNumber(1)
  set lock($13.Lock_Image32 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLock() => $_has(0);
  @$pb.TagNumber(1)
  void clearLock() => clearField(1);
  @$pb.TagNumber(1)
  $13.Lock_Image32 ensureLock() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$12.Challenge> get known => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$14.Proof> get responses => $_getList(2);
}

class Attestation_Image64 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Attestation.Image64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..aOM<$13.Lock_Image64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lock', subBuilder: $13.Lock_Image64.create)
    ..pc<$12.Challenge>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'known', $pb.PbFieldType.PM, subBuilder: $12.Challenge.create)
    ..pc<$14.Proof>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responses', $pb.PbFieldType.PM, subBuilder: $14.Proof.create)
    ..hasRequiredFields = false
  ;

  Attestation_Image64._() : super();
  factory Attestation_Image64({
    $13.Lock_Image64? lock,
    $core.Iterable<$12.Challenge>? known,
    $core.Iterable<$14.Proof>? responses,
  }) {
    final _result = create();
    if (lock != null) {
      _result.lock = lock;
    }
    if (known != null) {
      _result.known.addAll(known);
    }
    if (responses != null) {
      _result.responses.addAll(responses);
    }
    return _result;
  }
  factory Attestation_Image64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Attestation_Image64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Attestation_Image64 clone() => Attestation_Image64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Attestation_Image64 copyWith(void Function(Attestation_Image64) updates) => super.copyWith((message) => updates(message as Attestation_Image64)) as Attestation_Image64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Attestation_Image64 create() => Attestation_Image64._();
  Attestation_Image64 createEmptyInstance() => create();
  static $pb.PbList<Attestation_Image64> createRepeated() => $pb.PbList<Attestation_Image64>();
  @$core.pragma('dart2js:noInline')
  static Attestation_Image64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Attestation_Image64>(create);
  static Attestation_Image64? _defaultInstance;

  @$pb.TagNumber(1)
  $13.Lock_Image64 get lock => $_getN(0);
  @$pb.TagNumber(1)
  set lock($13.Lock_Image64 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLock() => $_has(0);
  @$pb.TagNumber(1)
  void clearLock() => clearField(1);
  @$pb.TagNumber(1)
  $13.Lock_Image64 ensureLock() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$12.Challenge> get known => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$14.Proof> get responses => $_getList(2);
}

class Attestation_Commitment32 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Attestation.Commitment32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..aOM<$13.Lock_Commitment32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lock', subBuilder: $13.Lock_Commitment32.create)
    ..pc<$12.Challenge>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'known', $pb.PbFieldType.PM, subBuilder: $12.Challenge.create)
    ..pc<$6.Witness>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'witness', $pb.PbFieldType.PM, subBuilder: $6.Witness.create)
    ..pc<$14.Proof>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responses', $pb.PbFieldType.PM, subBuilder: $14.Proof.create)
    ..hasRequiredFields = false
  ;

  Attestation_Commitment32._() : super();
  factory Attestation_Commitment32({
    $13.Lock_Commitment32? lock,
    $core.Iterable<$12.Challenge>? known,
    $core.Iterable<$6.Witness>? witness,
    $core.Iterable<$14.Proof>? responses,
  }) {
    final _result = create();
    if (lock != null) {
      _result.lock = lock;
    }
    if (known != null) {
      _result.known.addAll(known);
    }
    if (witness != null) {
      _result.witness.addAll(witness);
    }
    if (responses != null) {
      _result.responses.addAll(responses);
    }
    return _result;
  }
  factory Attestation_Commitment32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Attestation_Commitment32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Attestation_Commitment32 clone() => Attestation_Commitment32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Attestation_Commitment32 copyWith(void Function(Attestation_Commitment32) updates) => super.copyWith((message) => updates(message as Attestation_Commitment32)) as Attestation_Commitment32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Attestation_Commitment32 create() => Attestation_Commitment32._();
  Attestation_Commitment32 createEmptyInstance() => create();
  static $pb.PbList<Attestation_Commitment32> createRepeated() => $pb.PbList<Attestation_Commitment32>();
  @$core.pragma('dart2js:noInline')
  static Attestation_Commitment32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Attestation_Commitment32>(create);
  static Attestation_Commitment32? _defaultInstance;

  @$pb.TagNumber(1)
  $13.Lock_Commitment32 get lock => $_getN(0);
  @$pb.TagNumber(1)
  set lock($13.Lock_Commitment32 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLock() => $_has(0);
  @$pb.TagNumber(1)
  void clearLock() => clearField(1);
  @$pb.TagNumber(1)
  $13.Lock_Commitment32 ensureLock() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$12.Challenge> get known => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$6.Witness> get witness => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$14.Proof> get responses => $_getList(3);
}

class Attestation_Commitment64 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Attestation.Commitment64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..aOM<$13.Lock_Commitment64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lock', subBuilder: $13.Lock_Commitment64.create)
    ..pc<$12.Challenge>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'known', $pb.PbFieldType.PM, subBuilder: $12.Challenge.create)
    ..pc<$6.Witness>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'witness', $pb.PbFieldType.PM, subBuilder: $6.Witness.create)
    ..pc<$14.Proof>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responses', $pb.PbFieldType.PM, subBuilder: $14.Proof.create)
    ..hasRequiredFields = false
  ;

  Attestation_Commitment64._() : super();
  factory Attestation_Commitment64({
    $13.Lock_Commitment64? lock,
    $core.Iterable<$12.Challenge>? known,
    $core.Iterable<$6.Witness>? witness,
    $core.Iterable<$14.Proof>? responses,
  }) {
    final _result = create();
    if (lock != null) {
      _result.lock = lock;
    }
    if (known != null) {
      _result.known.addAll(known);
    }
    if (witness != null) {
      _result.witness.addAll(witness);
    }
    if (responses != null) {
      _result.responses.addAll(responses);
    }
    return _result;
  }
  factory Attestation_Commitment64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Attestation_Commitment64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Attestation_Commitment64 clone() => Attestation_Commitment64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Attestation_Commitment64 copyWith(void Function(Attestation_Commitment64) updates) => super.copyWith((message) => updates(message as Attestation_Commitment64)) as Attestation_Commitment64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Attestation_Commitment64 create() => Attestation_Commitment64._();
  Attestation_Commitment64 createEmptyInstance() => create();
  static $pb.PbList<Attestation_Commitment64> createRepeated() => $pb.PbList<Attestation_Commitment64>();
  @$core.pragma('dart2js:noInline')
  static Attestation_Commitment64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Attestation_Commitment64>(create);
  static Attestation_Commitment64? _defaultInstance;

  @$pb.TagNumber(1)
  $13.Lock_Commitment64 get lock => $_getN(0);
  @$pb.TagNumber(1)
  set lock($13.Lock_Commitment64 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLock() => $_has(0);
  @$pb.TagNumber(1)
  void clearLock() => clearField(1);
  @$pb.TagNumber(1)
  $13.Lock_Commitment64 ensureLock() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$12.Challenge> get known => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$6.Witness> get witness => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$14.Proof> get responses => $_getList(3);
}

enum Attestation_Value {
  predicate, 
  image32, 
  image64, 
  commitment32, 
  commitment64, 
  notSet
}

class Attestation extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Attestation_Value> _Attestation_ValueByTag = {
    1 : Attestation_Value.predicate,
    2 : Attestation_Value.image32,
    3 : Attestation_Value.image64,
    4 : Attestation_Value.commitment32,
    5 : Attestation_Value.commitment64,
    0 : Attestation_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Attestation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<Attestation_Predicate>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'predicate', subBuilder: Attestation_Predicate.create)
    ..aOM<Attestation_Image32>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image32', subBuilder: Attestation_Image32.create)
    ..aOM<Attestation_Image64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image64', subBuilder: Attestation_Image64.create)
    ..aOM<Attestation_Commitment32>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commitment32', subBuilder: Attestation_Commitment32.create)
    ..aOM<Attestation_Commitment64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commitment64', subBuilder: Attestation_Commitment64.create)
    ..hasRequiredFields = false
  ;

  Attestation._() : super();
  factory Attestation({
    Attestation_Predicate? predicate,
    Attestation_Image32? image32,
    Attestation_Image64? image64,
    Attestation_Commitment32? commitment32,
    Attestation_Commitment64? commitment64,
  }) {
    final _result = create();
    if (predicate != null) {
      _result.predicate = predicate;
    }
    if (image32 != null) {
      _result.image32 = image32;
    }
    if (image64 != null) {
      _result.image64 = image64;
    }
    if (commitment32 != null) {
      _result.commitment32 = commitment32;
    }
    if (commitment64 != null) {
      _result.commitment64 = commitment64;
    }
    return _result;
  }
  factory Attestation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Attestation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Attestation clone() => Attestation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Attestation copyWith(void Function(Attestation) updates) => super.copyWith((message) => updates(message as Attestation)) as Attestation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Attestation create() => Attestation._();
  Attestation createEmptyInstance() => create();
  static $pb.PbList<Attestation> createRepeated() => $pb.PbList<Attestation>();
  @$core.pragma('dart2js:noInline')
  static Attestation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Attestation>(create);
  static Attestation? _defaultInstance;

  Attestation_Value whichValue() => _Attestation_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Attestation_Predicate get predicate => $_getN(0);
  @$pb.TagNumber(1)
  set predicate(Attestation_Predicate v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPredicate() => $_has(0);
  @$pb.TagNumber(1)
  void clearPredicate() => clearField(1);
  @$pb.TagNumber(1)
  Attestation_Predicate ensurePredicate() => $_ensure(0);

  @$pb.TagNumber(2)
  Attestation_Image32 get image32 => $_getN(1);
  @$pb.TagNumber(2)
  set image32(Attestation_Image32 v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage32() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage32() => clearField(2);
  @$pb.TagNumber(2)
  Attestation_Image32 ensureImage32() => $_ensure(1);

  @$pb.TagNumber(3)
  Attestation_Image64 get image64 => $_getN(2);
  @$pb.TagNumber(3)
  set image64(Attestation_Image64 v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage64() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage64() => clearField(3);
  @$pb.TagNumber(3)
  Attestation_Image64 ensureImage64() => $_ensure(2);

  @$pb.TagNumber(4)
  Attestation_Commitment32 get commitment32 => $_getN(3);
  @$pb.TagNumber(4)
  set commitment32(Attestation_Commitment32 v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCommitment32() => $_has(3);
  @$pb.TagNumber(4)
  void clearCommitment32() => clearField(4);
  @$pb.TagNumber(4)
  Attestation_Commitment32 ensureCommitment32() => $_ensure(3);

  @$pb.TagNumber(5)
  Attestation_Commitment64 get commitment64 => $_getN(4);
  @$pb.TagNumber(5)
  set commitment64(Attestation_Commitment64 v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCommitment64() => $_has(4);
  @$pb.TagNumber(5)
  void clearCommitment64() => clearField(5);
  @$pb.TagNumber(5)
  Attestation_Commitment64 ensureCommitment64() => $_ensure(4);
}

