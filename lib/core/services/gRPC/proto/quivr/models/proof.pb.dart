///
//  Generated code. Do not modify.
//  source: quivr/models/proof.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'shared.pb.dart' as $6;

class Proof_Locked extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.Locked', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Proof_Locked._() : super();
  factory Proof_Locked() => create();
  factory Proof_Locked.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_Locked.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_Locked clone() => Proof_Locked()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_Locked copyWith(void Function(Proof_Locked) updates) => super.copyWith((message) => updates(message as Proof_Locked)) as Proof_Locked; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_Locked create() => Proof_Locked._();
  Proof_Locked createEmptyInstance() => create();
  static $pb.PbList<Proof_Locked> createRepeated() => $pb.PbList<Proof_Locked>();
  @$core.pragma('dart2js:noInline')
  static Proof_Locked getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_Locked>(create);
  static Proof_Locked? _defaultInstance;
}

class Proof_Digest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.Digest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..aOM<$6.Preimage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preimage', subBuilder: $6.Preimage.create)
    ..hasRequiredFields = false
  ;

  Proof_Digest._() : super();
  factory Proof_Digest({
    $6.TxBind? transactionBind,
    $6.Preimage? preimage,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    if (preimage != null) {
      _result.preimage = preimage;
    }
    return _result;
  }
  factory Proof_Digest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_Digest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_Digest clone() => Proof_Digest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_Digest copyWith(void Function(Proof_Digest) updates) => super.copyWith((message) => updates(message as Proof_Digest)) as Proof_Digest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_Digest create() => Proof_Digest._();
  Proof_Digest createEmptyInstance() => create();
  static $pb.PbList<Proof_Digest> createRepeated() => $pb.PbList<Proof_Digest>();
  @$core.pragma('dart2js:noInline')
  static Proof_Digest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_Digest>(create);
  static Proof_Digest? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);

  @$pb.TagNumber(2)
  $6.Preimage get preimage => $_getN(1);
  @$pb.TagNumber(2)
  set preimage($6.Preimage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPreimage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreimage() => clearField(2);
  @$pb.TagNumber(2)
  $6.Preimage ensurePreimage() => $_ensure(1);
}

class Proof_DigitalSignature extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.DigitalSignature', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..aOM<$6.Witness>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'witness', subBuilder: $6.Witness.create)
    ..hasRequiredFields = false
  ;

  Proof_DigitalSignature._() : super();
  factory Proof_DigitalSignature({
    $6.TxBind? transactionBind,
    $6.Witness? witness,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    if (witness != null) {
      _result.witness = witness;
    }
    return _result;
  }
  factory Proof_DigitalSignature.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_DigitalSignature.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_DigitalSignature clone() => Proof_DigitalSignature()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_DigitalSignature copyWith(void Function(Proof_DigitalSignature) updates) => super.copyWith((message) => updates(message as Proof_DigitalSignature)) as Proof_DigitalSignature; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_DigitalSignature create() => Proof_DigitalSignature._();
  Proof_DigitalSignature createEmptyInstance() => create();
  static $pb.PbList<Proof_DigitalSignature> createRepeated() => $pb.PbList<Proof_DigitalSignature>();
  @$core.pragma('dart2js:noInline')
  static Proof_DigitalSignature getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_DigitalSignature>(create);
  static Proof_DigitalSignature? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);

  @$pb.TagNumber(2)
  $6.Witness get witness => $_getN(1);
  @$pb.TagNumber(2)
  set witness($6.Witness v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasWitness() => $_has(1);
  @$pb.TagNumber(2)
  void clearWitness() => clearField(2);
  @$pb.TagNumber(2)
  $6.Witness ensureWitness() => $_ensure(1);
}

class Proof_HeightRange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.HeightRange', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..hasRequiredFields = false
  ;

  Proof_HeightRange._() : super();
  factory Proof_HeightRange({
    $6.TxBind? transactionBind,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    return _result;
  }
  factory Proof_HeightRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_HeightRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_HeightRange clone() => Proof_HeightRange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_HeightRange copyWith(void Function(Proof_HeightRange) updates) => super.copyWith((message) => updates(message as Proof_HeightRange)) as Proof_HeightRange; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_HeightRange create() => Proof_HeightRange._();
  Proof_HeightRange createEmptyInstance() => create();
  static $pb.PbList<Proof_HeightRange> createRepeated() => $pb.PbList<Proof_HeightRange>();
  @$core.pragma('dart2js:noInline')
  static Proof_HeightRange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_HeightRange>(create);
  static Proof_HeightRange? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);
}

class Proof_TickRange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.TickRange', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..hasRequiredFields = false
  ;

  Proof_TickRange._() : super();
  factory Proof_TickRange({
    $6.TxBind? transactionBind,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    return _result;
  }
  factory Proof_TickRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_TickRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_TickRange clone() => Proof_TickRange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_TickRange copyWith(void Function(Proof_TickRange) updates) => super.copyWith((message) => updates(message as Proof_TickRange)) as Proof_TickRange; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_TickRange create() => Proof_TickRange._();
  Proof_TickRange createEmptyInstance() => create();
  static $pb.PbList<Proof_TickRange> createRepeated() => $pb.PbList<Proof_TickRange>();
  @$core.pragma('dart2js:noInline')
  static Proof_TickRange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_TickRange>(create);
  static Proof_TickRange? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);
}

class Proof_ExactMatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.ExactMatch', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..hasRequiredFields = false
  ;

  Proof_ExactMatch._() : super();
  factory Proof_ExactMatch({
    $6.TxBind? transactionBind,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    return _result;
  }
  factory Proof_ExactMatch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_ExactMatch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_ExactMatch clone() => Proof_ExactMatch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_ExactMatch copyWith(void Function(Proof_ExactMatch) updates) => super.copyWith((message) => updates(message as Proof_ExactMatch)) as Proof_ExactMatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_ExactMatch create() => Proof_ExactMatch._();
  Proof_ExactMatch createEmptyInstance() => create();
  static $pb.PbList<Proof_ExactMatch> createRepeated() => $pb.PbList<Proof_ExactMatch>();
  @$core.pragma('dart2js:noInline')
  static Proof_ExactMatch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_ExactMatch>(create);
  static Proof_ExactMatch? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);
}

class Proof_LessThan extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.LessThan', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..hasRequiredFields = false
  ;

  Proof_LessThan._() : super();
  factory Proof_LessThan({
    $6.TxBind? transactionBind,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    return _result;
  }
  factory Proof_LessThan.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_LessThan.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_LessThan clone() => Proof_LessThan()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_LessThan copyWith(void Function(Proof_LessThan) updates) => super.copyWith((message) => updates(message as Proof_LessThan)) as Proof_LessThan; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_LessThan create() => Proof_LessThan._();
  Proof_LessThan createEmptyInstance() => create();
  static $pb.PbList<Proof_LessThan> createRepeated() => $pb.PbList<Proof_LessThan>();
  @$core.pragma('dart2js:noInline')
  static Proof_LessThan getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_LessThan>(create);
  static Proof_LessThan? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);
}

class Proof_GreaterThan extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.GreaterThan', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..hasRequiredFields = false
  ;

  Proof_GreaterThan._() : super();
  factory Proof_GreaterThan({
    $6.TxBind? transactionBind,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    return _result;
  }
  factory Proof_GreaterThan.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_GreaterThan.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_GreaterThan clone() => Proof_GreaterThan()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_GreaterThan copyWith(void Function(Proof_GreaterThan) updates) => super.copyWith((message) => updates(message as Proof_GreaterThan)) as Proof_GreaterThan; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_GreaterThan create() => Proof_GreaterThan._();
  Proof_GreaterThan createEmptyInstance() => create();
  static $pb.PbList<Proof_GreaterThan> createRepeated() => $pb.PbList<Proof_GreaterThan>();
  @$core.pragma('dart2js:noInline')
  static Proof_GreaterThan getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_GreaterThan>(create);
  static Proof_GreaterThan? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);
}

class Proof_EqualTo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.EqualTo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..hasRequiredFields = false
  ;

  Proof_EqualTo._() : super();
  factory Proof_EqualTo({
    $6.TxBind? transactionBind,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    return _result;
  }
  factory Proof_EqualTo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_EqualTo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_EqualTo clone() => Proof_EqualTo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_EqualTo copyWith(void Function(Proof_EqualTo) updates) => super.copyWith((message) => updates(message as Proof_EqualTo)) as Proof_EqualTo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_EqualTo create() => Proof_EqualTo._();
  Proof_EqualTo createEmptyInstance() => create();
  static $pb.PbList<Proof_EqualTo> createRepeated() => $pb.PbList<Proof_EqualTo>();
  @$core.pragma('dart2js:noInline')
  static Proof_EqualTo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_EqualTo>(create);
  static Proof_EqualTo? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);
}

class Proof_Threshold extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.Threshold', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..pc<Proof>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responses', $pb.PbFieldType.PM, subBuilder: Proof.create)
    ..hasRequiredFields = false
  ;

  Proof_Threshold._() : super();
  factory Proof_Threshold({
    $6.TxBind? transactionBind,
    $core.Iterable<Proof>? responses,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    if (responses != null) {
      _result.responses.addAll(responses);
    }
    return _result;
  }
  factory Proof_Threshold.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_Threshold.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_Threshold clone() => Proof_Threshold()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_Threshold copyWith(void Function(Proof_Threshold) updates) => super.copyWith((message) => updates(message as Proof_Threshold)) as Proof_Threshold; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_Threshold create() => Proof_Threshold._();
  Proof_Threshold createEmptyInstance() => create();
  static $pb.PbList<Proof_Threshold> createRepeated() => $pb.PbList<Proof_Threshold>();
  @$core.pragma('dart2js:noInline')
  static Proof_Threshold getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_Threshold>(create);
  static Proof_Threshold? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Proof> get responses => $_getList(1);
}

class Proof_Not extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.Not', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..aOM<Proof>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proof', subBuilder: Proof.create)
    ..hasRequiredFields = false
  ;

  Proof_Not._() : super();
  factory Proof_Not({
    $6.TxBind? transactionBind,
    Proof? proof,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    if (proof != null) {
      _result.proof = proof;
    }
    return _result;
  }
  factory Proof_Not.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_Not.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_Not clone() => Proof_Not()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_Not copyWith(void Function(Proof_Not) updates) => super.copyWith((message) => updates(message as Proof_Not)) as Proof_Not; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_Not create() => Proof_Not._();
  Proof_Not createEmptyInstance() => create();
  static $pb.PbList<Proof_Not> createRepeated() => $pb.PbList<Proof_Not>();
  @$core.pragma('dart2js:noInline')
  static Proof_Not getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_Not>(create);
  static Proof_Not? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);

  @$pb.TagNumber(2)
  Proof get proof => $_getN(1);
  @$pb.TagNumber(2)
  set proof(Proof v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProof() => $_has(1);
  @$pb.TagNumber(2)
  void clearProof() => clearField(2);
  @$pb.TagNumber(2)
  Proof ensureProof() => $_ensure(1);
}

class Proof_And extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.And', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..aOM<Proof>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'left', subBuilder: Proof.create)
    ..aOM<Proof>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right', subBuilder: Proof.create)
    ..hasRequiredFields = false
  ;

  Proof_And._() : super();
  factory Proof_And({
    $6.TxBind? transactionBind,
    Proof? left,
    Proof? right,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    if (left != null) {
      _result.left = left;
    }
    if (right != null) {
      _result.right = right;
    }
    return _result;
  }
  factory Proof_And.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_And.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_And clone() => Proof_And()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_And copyWith(void Function(Proof_And) updates) => super.copyWith((message) => updates(message as Proof_And)) as Proof_And; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_And create() => Proof_And._();
  Proof_And createEmptyInstance() => create();
  static $pb.PbList<Proof_And> createRepeated() => $pb.PbList<Proof_And>();
  @$core.pragma('dart2js:noInline')
  static Proof_And getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_And>(create);
  static Proof_And? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);

  @$pb.TagNumber(2)
  Proof get left => $_getN(1);
  @$pb.TagNumber(2)
  set left(Proof v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLeft() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeft() => clearField(2);
  @$pb.TagNumber(2)
  Proof ensureLeft() => $_ensure(1);

  @$pb.TagNumber(3)
  Proof get right => $_getN(2);
  @$pb.TagNumber(3)
  set right(Proof v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRight() => $_has(2);
  @$pb.TagNumber(3)
  void clearRight() => clearField(3);
  @$pb.TagNumber(3)
  Proof ensureRight() => $_ensure(2);
}

class Proof_Or extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof.Or', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<$6.TxBind>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionBind', protoName: 'transactionBind', subBuilder: $6.TxBind.create)
    ..aOM<Proof>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'left', subBuilder: Proof.create)
    ..aOM<Proof>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right', subBuilder: Proof.create)
    ..hasRequiredFields = false
  ;

  Proof_Or._() : super();
  factory Proof_Or({
    $6.TxBind? transactionBind,
    Proof? left,
    Proof? right,
  }) {
    final _result = create();
    if (transactionBind != null) {
      _result.transactionBind = transactionBind;
    }
    if (left != null) {
      _result.left = left;
    }
    if (right != null) {
      _result.right = right;
    }
    return _result;
  }
  factory Proof_Or.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof_Or.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof_Or clone() => Proof_Or()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof_Or copyWith(void Function(Proof_Or) updates) => super.copyWith((message) => updates(message as Proof_Or)) as Proof_Or; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof_Or create() => Proof_Or._();
  Proof_Or createEmptyInstance() => create();
  static $pb.PbList<Proof_Or> createRepeated() => $pb.PbList<Proof_Or>();
  @$core.pragma('dart2js:noInline')
  static Proof_Or getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof_Or>(create);
  static Proof_Or? _defaultInstance;

  @$pb.TagNumber(1)
  $6.TxBind get transactionBind => $_getN(0);
  @$pb.TagNumber(1)
  set transactionBind($6.TxBind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionBind() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionBind() => clearField(1);
  @$pb.TagNumber(1)
  $6.TxBind ensureTransactionBind() => $_ensure(0);

  @$pb.TagNumber(2)
  Proof get left => $_getN(1);
  @$pb.TagNumber(2)
  set left(Proof v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLeft() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeft() => clearField(2);
  @$pb.TagNumber(2)
  Proof ensureLeft() => $_ensure(1);

  @$pb.TagNumber(3)
  Proof get right => $_getN(2);
  @$pb.TagNumber(3)
  set right(Proof v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRight() => $_has(2);
  @$pb.TagNumber(3)
  void clearRight() => clearField(3);
  @$pb.TagNumber(3)
  Proof ensureRight() => $_ensure(2);
}

enum Proof_Value {
  locked, 
  digest, 
  digitalSignature, 
  heightRange, 
  tickRange, 
  exactMatch, 
  lessThan, 
  greaterThan, 
  equalTo, 
  threshold, 
  not, 
  and, 
  or, 
  notSet
}

class Proof extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Proof_Value> _Proof_ValueByTag = {
    1 : Proof_Value.locked,
    2 : Proof_Value.digest,
    3 : Proof_Value.digitalSignature,
    4 : Proof_Value.heightRange,
    5 : Proof_Value.tickRange,
    6 : Proof_Value.exactMatch,
    7 : Proof_Value.lessThan,
    8 : Proof_Value.greaterThan,
    9 : Proof_Value.equalTo,
    10 : Proof_Value.threshold,
    11 : Proof_Value.not,
    12 : Proof_Value.and,
    13 : Proof_Value.or,
    0 : Proof_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Proof', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13])
    ..aOM<Proof_Locked>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'locked', subBuilder: Proof_Locked.create)
    ..aOM<Proof_Digest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'digest', subBuilder: Proof_Digest.create)
    ..aOM<Proof_DigitalSignature>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'digitalSignature', protoName: 'digitalSignature', subBuilder: Proof_DigitalSignature.create)
    ..aOM<Proof_HeightRange>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'heightRange', protoName: 'heightRange', subBuilder: Proof_HeightRange.create)
    ..aOM<Proof_TickRange>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tickRange', protoName: 'tickRange', subBuilder: Proof_TickRange.create)
    ..aOM<Proof_ExactMatch>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exactMatch', protoName: 'exactMatch', subBuilder: Proof_ExactMatch.create)
    ..aOM<Proof_LessThan>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lessThan', protoName: 'lessThan', subBuilder: Proof_LessThan.create)
    ..aOM<Proof_GreaterThan>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'greaterThan', protoName: 'greaterThan', subBuilder: Proof_GreaterThan.create)
    ..aOM<Proof_EqualTo>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'equalTo', protoName: 'equalTo', subBuilder: Proof_EqualTo.create)
    ..aOM<Proof_Threshold>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threshold', subBuilder: Proof_Threshold.create)
    ..aOM<Proof_Not>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'not', subBuilder: Proof_Not.create)
    ..aOM<Proof_And>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'and', subBuilder: Proof_And.create)
    ..aOM<Proof_Or>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'or', subBuilder: Proof_Or.create)
    ..hasRequiredFields = false
  ;

  Proof._() : super();
  factory Proof({
    Proof_Locked? locked,
    Proof_Digest? digest,
    Proof_DigitalSignature? digitalSignature,
    Proof_HeightRange? heightRange,
    Proof_TickRange? tickRange,
    Proof_ExactMatch? exactMatch,
    Proof_LessThan? lessThan,
    Proof_GreaterThan? greaterThan,
    Proof_EqualTo? equalTo,
    Proof_Threshold? threshold,
    Proof_Not? not,
    Proof_And? and,
    Proof_Or? or,
  }) {
    final _result = create();
    if (locked != null) {
      _result.locked = locked;
    }
    if (digest != null) {
      _result.digest = digest;
    }
    if (digitalSignature != null) {
      _result.digitalSignature = digitalSignature;
    }
    if (heightRange != null) {
      _result.heightRange = heightRange;
    }
    if (tickRange != null) {
      _result.tickRange = tickRange;
    }
    if (exactMatch != null) {
      _result.exactMatch = exactMatch;
    }
    if (lessThan != null) {
      _result.lessThan = lessThan;
    }
    if (greaterThan != null) {
      _result.greaterThan = greaterThan;
    }
    if (equalTo != null) {
      _result.equalTo = equalTo;
    }
    if (threshold != null) {
      _result.threshold = threshold;
    }
    if (not != null) {
      _result.not = not;
    }
    if (and != null) {
      _result.and = and;
    }
    if (or != null) {
      _result.or = or;
    }
    return _result;
  }
  factory Proof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proof clone() => Proof()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proof copyWith(void Function(Proof) updates) => super.copyWith((message) => updates(message as Proof)) as Proof; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proof create() => Proof._();
  Proof createEmptyInstance() => create();
  static $pb.PbList<Proof> createRepeated() => $pb.PbList<Proof>();
  @$core.pragma('dart2js:noInline')
  static Proof getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proof>(create);
  static Proof? _defaultInstance;

  Proof_Value whichValue() => _Proof_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Proof_Locked get locked => $_getN(0);
  @$pb.TagNumber(1)
  set locked(Proof_Locked v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocked() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocked() => clearField(1);
  @$pb.TagNumber(1)
  Proof_Locked ensureLocked() => $_ensure(0);

  @$pb.TagNumber(2)
  Proof_Digest get digest => $_getN(1);
  @$pb.TagNumber(2)
  set digest(Proof_Digest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDigest() => $_has(1);
  @$pb.TagNumber(2)
  void clearDigest() => clearField(2);
  @$pb.TagNumber(2)
  Proof_Digest ensureDigest() => $_ensure(1);

  @$pb.TagNumber(3)
  Proof_DigitalSignature get digitalSignature => $_getN(2);
  @$pb.TagNumber(3)
  set digitalSignature(Proof_DigitalSignature v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDigitalSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearDigitalSignature() => clearField(3);
  @$pb.TagNumber(3)
  Proof_DigitalSignature ensureDigitalSignature() => $_ensure(2);

  @$pb.TagNumber(4)
  Proof_HeightRange get heightRange => $_getN(3);
  @$pb.TagNumber(4)
  set heightRange(Proof_HeightRange v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeightRange() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeightRange() => clearField(4);
  @$pb.TagNumber(4)
  Proof_HeightRange ensureHeightRange() => $_ensure(3);

  @$pb.TagNumber(5)
  Proof_TickRange get tickRange => $_getN(4);
  @$pb.TagNumber(5)
  set tickRange(Proof_TickRange v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTickRange() => $_has(4);
  @$pb.TagNumber(5)
  void clearTickRange() => clearField(5);
  @$pb.TagNumber(5)
  Proof_TickRange ensureTickRange() => $_ensure(4);

  @$pb.TagNumber(6)
  Proof_ExactMatch get exactMatch => $_getN(5);
  @$pb.TagNumber(6)
  set exactMatch(Proof_ExactMatch v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasExactMatch() => $_has(5);
  @$pb.TagNumber(6)
  void clearExactMatch() => clearField(6);
  @$pb.TagNumber(6)
  Proof_ExactMatch ensureExactMatch() => $_ensure(5);

  @$pb.TagNumber(7)
  Proof_LessThan get lessThan => $_getN(6);
  @$pb.TagNumber(7)
  set lessThan(Proof_LessThan v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasLessThan() => $_has(6);
  @$pb.TagNumber(7)
  void clearLessThan() => clearField(7);
  @$pb.TagNumber(7)
  Proof_LessThan ensureLessThan() => $_ensure(6);

  @$pb.TagNumber(8)
  Proof_GreaterThan get greaterThan => $_getN(7);
  @$pb.TagNumber(8)
  set greaterThan(Proof_GreaterThan v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasGreaterThan() => $_has(7);
  @$pb.TagNumber(8)
  void clearGreaterThan() => clearField(8);
  @$pb.TagNumber(8)
  Proof_GreaterThan ensureGreaterThan() => $_ensure(7);

  @$pb.TagNumber(9)
  Proof_EqualTo get equalTo => $_getN(8);
  @$pb.TagNumber(9)
  set equalTo(Proof_EqualTo v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasEqualTo() => $_has(8);
  @$pb.TagNumber(9)
  void clearEqualTo() => clearField(9);
  @$pb.TagNumber(9)
  Proof_EqualTo ensureEqualTo() => $_ensure(8);

  @$pb.TagNumber(10)
  Proof_Threshold get threshold => $_getN(9);
  @$pb.TagNumber(10)
  set threshold(Proof_Threshold v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasThreshold() => $_has(9);
  @$pb.TagNumber(10)
  void clearThreshold() => clearField(10);
  @$pb.TagNumber(10)
  Proof_Threshold ensureThreshold() => $_ensure(9);

  @$pb.TagNumber(11)
  Proof_Not get not => $_getN(10);
  @$pb.TagNumber(11)
  set not(Proof_Not v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasNot() => $_has(10);
  @$pb.TagNumber(11)
  void clearNot() => clearField(11);
  @$pb.TagNumber(11)
  Proof_Not ensureNot() => $_ensure(10);

  @$pb.TagNumber(12)
  Proof_And get and => $_getN(11);
  @$pb.TagNumber(12)
  set and(Proof_And v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasAnd() => $_has(11);
  @$pb.TagNumber(12)
  void clearAnd() => clearField(12);
  @$pb.TagNumber(12)
  Proof_And ensureAnd() => $_ensure(11);

  @$pb.TagNumber(13)
  Proof_Or get or => $_getN(12);
  @$pb.TagNumber(13)
  set or(Proof_Or v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasOr() => $_has(12);
  @$pb.TagNumber(13)
  void clearOr() => clearField(13);
  @$pb.TagNumber(13)
  Proof_Or ensureOr() => $_ensure(12);
}

