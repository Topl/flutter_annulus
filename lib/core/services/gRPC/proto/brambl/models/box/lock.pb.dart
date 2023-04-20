///
//  Generated code. Do not modify.
//  source: brambl/models/box/lock.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'challenge.pb.dart' as $12;
import '../identifier.pb.dart' as $9;

class Lock_Predicate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Lock.Predicate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..pc<$12.Challenge>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'challenges', $pb.PbFieldType.PM, subBuilder: $12.Challenge.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threshold', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Lock_Predicate._() : super();
  factory Lock_Predicate({
    $core.Iterable<$12.Challenge>? challenges,
    $core.int? threshold,
  }) {
    final _result = create();
    if (challenges != null) {
      _result.challenges.addAll(challenges);
    }
    if (threshold != null) {
      _result.threshold = threshold;
    }
    return _result;
  }
  factory Lock_Predicate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lock_Predicate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lock_Predicate clone() => Lock_Predicate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lock_Predicate copyWith(void Function(Lock_Predicate) updates) => super.copyWith((message) => updates(message as Lock_Predicate)) as Lock_Predicate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Lock_Predicate create() => Lock_Predicate._();
  Lock_Predicate createEmptyInstance() => create();
  static $pb.PbList<Lock_Predicate> createRepeated() => $pb.PbList<Lock_Predicate>();
  @$core.pragma('dart2js:noInline')
  static Lock_Predicate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lock_Predicate>(create);
  static Lock_Predicate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$12.Challenge> get challenges => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get threshold => $_getIZ(1);
  @$pb.TagNumber(2)
  set threshold($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasThreshold() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreshold() => clearField(2);
}

class Lock_Image32 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Lock.Image32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..pc<$9.Identifier_Lock32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leaves', $pb.PbFieldType.PM, subBuilder: $9.Identifier_Lock32.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threshold', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Lock_Image32._() : super();
  factory Lock_Image32({
    $core.Iterable<$9.Identifier_Lock32>? leaves,
    $core.int? threshold,
  }) {
    final _result = create();
    if (leaves != null) {
      _result.leaves.addAll(leaves);
    }
    if (threshold != null) {
      _result.threshold = threshold;
    }
    return _result;
  }
  factory Lock_Image32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lock_Image32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lock_Image32 clone() => Lock_Image32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lock_Image32 copyWith(void Function(Lock_Image32) updates) => super.copyWith((message) => updates(message as Lock_Image32)) as Lock_Image32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Lock_Image32 create() => Lock_Image32._();
  Lock_Image32 createEmptyInstance() => create();
  static $pb.PbList<Lock_Image32> createRepeated() => $pb.PbList<Lock_Image32>();
  @$core.pragma('dart2js:noInline')
  static Lock_Image32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lock_Image32>(create);
  static Lock_Image32? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$9.Identifier_Lock32> get leaves => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get threshold => $_getIZ(1);
  @$pb.TagNumber(2)
  set threshold($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasThreshold() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreshold() => clearField(2);
}

class Lock_Image64 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Lock.Image64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..pc<$9.Identifier_Lock64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leaves', $pb.PbFieldType.PM, subBuilder: $9.Identifier_Lock64.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threshold', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Lock_Image64._() : super();
  factory Lock_Image64({
    $core.Iterable<$9.Identifier_Lock64>? leaves,
    $core.int? threshold,
  }) {
    final _result = create();
    if (leaves != null) {
      _result.leaves.addAll(leaves);
    }
    if (threshold != null) {
      _result.threshold = threshold;
    }
    return _result;
  }
  factory Lock_Image64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lock_Image64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lock_Image64 clone() => Lock_Image64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lock_Image64 copyWith(void Function(Lock_Image64) updates) => super.copyWith((message) => updates(message as Lock_Image64)) as Lock_Image64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Lock_Image64 create() => Lock_Image64._();
  Lock_Image64 createEmptyInstance() => create();
  static $pb.PbList<Lock_Image64> createRepeated() => $pb.PbList<Lock_Image64>();
  @$core.pragma('dart2js:noInline')
  static Lock_Image64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lock_Image64>(create);
  static Lock_Image64? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$9.Identifier_Lock64> get leaves => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get threshold => $_getIZ(1);
  @$pb.TagNumber(2)
  set threshold($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasThreshold() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreshold() => clearField(2);
}

class Lock_Commitment32 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Lock.Commitment32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..aOM<$9.Identifier_AccumulatorRoot32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'root', subBuilder: $9.Identifier_AccumulatorRoot32.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threshold', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Lock_Commitment32._() : super();
  factory Lock_Commitment32({
    $9.Identifier_AccumulatorRoot32? root,
    $core.int? threshold,
  }) {
    final _result = create();
    if (root != null) {
      _result.root = root;
    }
    if (threshold != null) {
      _result.threshold = threshold;
    }
    return _result;
  }
  factory Lock_Commitment32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lock_Commitment32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lock_Commitment32 clone() => Lock_Commitment32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lock_Commitment32 copyWith(void Function(Lock_Commitment32) updates) => super.copyWith((message) => updates(message as Lock_Commitment32)) as Lock_Commitment32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Lock_Commitment32 create() => Lock_Commitment32._();
  Lock_Commitment32 createEmptyInstance() => create();
  static $pb.PbList<Lock_Commitment32> createRepeated() => $pb.PbList<Lock_Commitment32>();
  @$core.pragma('dart2js:noInline')
  static Lock_Commitment32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lock_Commitment32>(create);
  static Lock_Commitment32? _defaultInstance;

  @$pb.TagNumber(1)
  $9.Identifier_AccumulatorRoot32 get root => $_getN(0);
  @$pb.TagNumber(1)
  set root($9.Identifier_AccumulatorRoot32 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoot() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoot() => clearField(1);
  @$pb.TagNumber(1)
  $9.Identifier_AccumulatorRoot32 ensureRoot() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get threshold => $_getIZ(1);
  @$pb.TagNumber(2)
  set threshold($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasThreshold() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreshold() => clearField(2);
}

class Lock_Commitment64 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Lock.Commitment64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..aOM<$9.Identifier_AccumulatorRoot64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'root', subBuilder: $9.Identifier_AccumulatorRoot64.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threshold', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Lock_Commitment64._() : super();
  factory Lock_Commitment64({
    $9.Identifier_AccumulatorRoot64? root,
    $core.int? threshold,
  }) {
    final _result = create();
    if (root != null) {
      _result.root = root;
    }
    if (threshold != null) {
      _result.threshold = threshold;
    }
    return _result;
  }
  factory Lock_Commitment64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lock_Commitment64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lock_Commitment64 clone() => Lock_Commitment64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lock_Commitment64 copyWith(void Function(Lock_Commitment64) updates) => super.copyWith((message) => updates(message as Lock_Commitment64)) as Lock_Commitment64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Lock_Commitment64 create() => Lock_Commitment64._();
  Lock_Commitment64 createEmptyInstance() => create();
  static $pb.PbList<Lock_Commitment64> createRepeated() => $pb.PbList<Lock_Commitment64>();
  @$core.pragma('dart2js:noInline')
  static Lock_Commitment64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lock_Commitment64>(create);
  static Lock_Commitment64? _defaultInstance;

  @$pb.TagNumber(1)
  $9.Identifier_AccumulatorRoot64 get root => $_getN(0);
  @$pb.TagNumber(1)
  set root($9.Identifier_AccumulatorRoot64 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoot() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoot() => clearField(1);
  @$pb.TagNumber(1)
  $9.Identifier_AccumulatorRoot64 ensureRoot() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get threshold => $_getIZ(1);
  @$pb.TagNumber(2)
  set threshold($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasThreshold() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreshold() => clearField(2);
}

enum Lock_Value {
  predicate, 
  image32, 
  image64, 
  commitment32, 
  commitment64, 
  notSet
}

class Lock extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Lock_Value> _Lock_ValueByTag = {
    1 : Lock_Value.predicate,
    2 : Lock_Value.image32,
    3 : Lock_Value.image64,
    4 : Lock_Value.commitment32,
    5 : Lock_Value.commitment64,
    0 : Lock_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Lock', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<Lock_Predicate>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'predicate', subBuilder: Lock_Predicate.create)
    ..aOM<Lock_Image32>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image32', subBuilder: Lock_Image32.create)
    ..aOM<Lock_Image64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image64', subBuilder: Lock_Image64.create)
    ..aOM<Lock_Commitment32>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commitment32', subBuilder: Lock_Commitment32.create)
    ..aOM<Lock_Commitment64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commitment64', subBuilder: Lock_Commitment64.create)
    ..hasRequiredFields = false
  ;

  Lock._() : super();
  factory Lock({
    Lock_Predicate? predicate,
    Lock_Image32? image32,
    Lock_Image64? image64,
    Lock_Commitment32? commitment32,
    Lock_Commitment64? commitment64,
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
  factory Lock.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lock.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lock clone() => Lock()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lock copyWith(void Function(Lock) updates) => super.copyWith((message) => updates(message as Lock)) as Lock; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Lock create() => Lock._();
  Lock createEmptyInstance() => create();
  static $pb.PbList<Lock> createRepeated() => $pb.PbList<Lock>();
  @$core.pragma('dart2js:noInline')
  static Lock getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lock>(create);
  static Lock? _defaultInstance;

  Lock_Value whichValue() => _Lock_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Lock_Predicate get predicate => $_getN(0);
  @$pb.TagNumber(1)
  set predicate(Lock_Predicate v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPredicate() => $_has(0);
  @$pb.TagNumber(1)
  void clearPredicate() => clearField(1);
  @$pb.TagNumber(1)
  Lock_Predicate ensurePredicate() => $_ensure(0);

  @$pb.TagNumber(2)
  Lock_Image32 get image32 => $_getN(1);
  @$pb.TagNumber(2)
  set image32(Lock_Image32 v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage32() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage32() => clearField(2);
  @$pb.TagNumber(2)
  Lock_Image32 ensureImage32() => $_ensure(1);

  @$pb.TagNumber(3)
  Lock_Image64 get image64 => $_getN(2);
  @$pb.TagNumber(3)
  set image64(Lock_Image64 v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage64() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage64() => clearField(3);
  @$pb.TagNumber(3)
  Lock_Image64 ensureImage64() => $_ensure(2);

  @$pb.TagNumber(4)
  Lock_Commitment32 get commitment32 => $_getN(3);
  @$pb.TagNumber(4)
  set commitment32(Lock_Commitment32 v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCommitment32() => $_has(3);
  @$pb.TagNumber(4)
  void clearCommitment32() => clearField(4);
  @$pb.TagNumber(4)
  Lock_Commitment32 ensureCommitment32() => $_ensure(3);

  @$pb.TagNumber(5)
  Lock_Commitment64 get commitment64 => $_getN(4);
  @$pb.TagNumber(5)
  set commitment64(Lock_Commitment64 v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCommitment64() => $_has(4);
  @$pb.TagNumber(5)
  void clearCommitment64() => clearField(5);
  @$pb.TagNumber(5)
  Lock_Commitment64 ensureCommitment64() => $_ensure(4);
}

