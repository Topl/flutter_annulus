///
//  Generated code. Do not modify.
//  source: consensus/models/operational_certificate.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class OperationalCertificate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OperationalCertificate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.consensus.models'), createEmptyInstance: create)
    ..aOM<VerificationKeyKesProduct>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentVK', protoName: 'parentVK', subBuilder: VerificationKeyKesProduct.create)
    ..aOM<SignatureKesProduct>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentSignature', protoName: 'parentSignature', subBuilder: SignatureKesProduct.create)
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'childVK', $pb.PbFieldType.OY, protoName: 'childVK')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'childSignature', $pb.PbFieldType.OY, protoName: 'childSignature')
    ..hasRequiredFields = false
  ;

  OperationalCertificate._() : super();
  factory OperationalCertificate({
    VerificationKeyKesProduct? parentVK,
    SignatureKesProduct? parentSignature,
    $core.List<$core.int>? childVK,
    $core.List<$core.int>? childSignature,
  }) {
    final _result = create();
    if (parentVK != null) {
      _result.parentVK = parentVK;
    }
    if (parentSignature != null) {
      _result.parentSignature = parentSignature;
    }
    if (childVK != null) {
      _result.childVK = childVK;
    }
    if (childSignature != null) {
      _result.childSignature = childSignature;
    }
    return _result;
  }
  factory OperationalCertificate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OperationalCertificate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OperationalCertificate clone() => OperationalCertificate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OperationalCertificate copyWith(void Function(OperationalCertificate) updates) => super.copyWith((message) => updates(message as OperationalCertificate)) as OperationalCertificate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OperationalCertificate create() => OperationalCertificate._();
  OperationalCertificate createEmptyInstance() => create();
  static $pb.PbList<OperationalCertificate> createRepeated() => $pb.PbList<OperationalCertificate>();
  @$core.pragma('dart2js:noInline')
  static OperationalCertificate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OperationalCertificate>(create);
  static OperationalCertificate? _defaultInstance;

  @$pb.TagNumber(1)
  VerificationKeyKesProduct get parentVK => $_getN(0);
  @$pb.TagNumber(1)
  set parentVK(VerificationKeyKesProduct v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParentVK() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentVK() => clearField(1);
  @$pb.TagNumber(1)
  VerificationKeyKesProduct ensureParentVK() => $_ensure(0);

  @$pb.TagNumber(2)
  SignatureKesProduct get parentSignature => $_getN(1);
  @$pb.TagNumber(2)
  set parentSignature(SignatureKesProduct v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentSignature() => clearField(2);
  @$pb.TagNumber(2)
  SignatureKesProduct ensureParentSignature() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get childVK => $_getN(2);
  @$pb.TagNumber(3)
  set childVK($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChildVK() => $_has(2);
  @$pb.TagNumber(3)
  void clearChildVK() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get childSignature => $_getN(3);
  @$pb.TagNumber(4)
  set childSignature($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChildSignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearChildSignature() => clearField(4);
}

class VerificationKeyKesProduct extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerificationKeyKesProduct', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.consensus.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'step', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  VerificationKeyKesProduct._() : super();
  factory VerificationKeyKesProduct({
    $core.List<$core.int>? value,
    $core.int? step,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    if (step != null) {
      _result.step = step;
    }
    return _result;
  }
  factory VerificationKeyKesProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerificationKeyKesProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerificationKeyKesProduct clone() => VerificationKeyKesProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerificationKeyKesProduct copyWith(void Function(VerificationKeyKesProduct) updates) => super.copyWith((message) => updates(message as VerificationKeyKesProduct)) as VerificationKeyKesProduct; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerificationKeyKesProduct create() => VerificationKeyKesProduct._();
  VerificationKeyKesProduct createEmptyInstance() => create();
  static $pb.PbList<VerificationKeyKesProduct> createRepeated() => $pb.PbList<VerificationKeyKesProduct>();
  @$core.pragma('dart2js:noInline')
  static VerificationKeyKesProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerificationKeyKesProduct>(create);
  static VerificationKeyKesProduct? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get step => $_getIZ(1);
  @$pb.TagNumber(2)
  set step($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStep() => $_has(1);
  @$pb.TagNumber(2)
  void clearStep() => clearField(2);
}

class SignatureKesSum extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignatureKesSum', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.consensus.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verificationKey', $pb.PbFieldType.OY, protoName: 'verificationKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'witness', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  SignatureKesSum._() : super();
  factory SignatureKesSum({
    $core.List<$core.int>? verificationKey,
    $core.List<$core.int>? signature,
    $core.Iterable<$core.List<$core.int>>? witness,
  }) {
    final _result = create();
    if (verificationKey != null) {
      _result.verificationKey = verificationKey;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    if (witness != null) {
      _result.witness.addAll(witness);
    }
    return _result;
  }
  factory SignatureKesSum.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignatureKesSum.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignatureKesSum clone() => SignatureKesSum()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignatureKesSum copyWith(void Function(SignatureKesSum) updates) => super.copyWith((message) => updates(message as SignatureKesSum)) as SignatureKesSum; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignatureKesSum create() => SignatureKesSum._();
  SignatureKesSum createEmptyInstance() => create();
  static $pb.PbList<SignatureKesSum> createRepeated() => $pb.PbList<SignatureKesSum>();
  @$core.pragma('dart2js:noInline')
  static SignatureKesSum getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignatureKesSum>(create);
  static SignatureKesSum? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get verificationKey => $_getN(0);
  @$pb.TagNumber(1)
  set verificationKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerificationKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerificationKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get witness => $_getList(2);
}

class SignatureKesProduct extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignatureKesProduct', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.consensus.models'), createEmptyInstance: create)
    ..aOM<SignatureKesSum>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'superSignature', protoName: 'superSignature', subBuilder: SignatureKesSum.create)
    ..aOM<SignatureKesSum>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subSignature', protoName: 'subSignature', subBuilder: SignatureKesSum.create)
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subRoot', $pb.PbFieldType.OY, protoName: 'subRoot')
    ..hasRequiredFields = false
  ;

  SignatureKesProduct._() : super();
  factory SignatureKesProduct({
    SignatureKesSum? superSignature,
    SignatureKesSum? subSignature,
    $core.List<$core.int>? subRoot,
  }) {
    final _result = create();
    if (superSignature != null) {
      _result.superSignature = superSignature;
    }
    if (subSignature != null) {
      _result.subSignature = subSignature;
    }
    if (subRoot != null) {
      _result.subRoot = subRoot;
    }
    return _result;
  }
  factory SignatureKesProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignatureKesProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignatureKesProduct clone() => SignatureKesProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignatureKesProduct copyWith(void Function(SignatureKesProduct) updates) => super.copyWith((message) => updates(message as SignatureKesProduct)) as SignatureKesProduct; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignatureKesProduct create() => SignatureKesProduct._();
  SignatureKesProduct createEmptyInstance() => create();
  static $pb.PbList<SignatureKesProduct> createRepeated() => $pb.PbList<SignatureKesProduct>();
  @$core.pragma('dart2js:noInline')
  static SignatureKesProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignatureKesProduct>(create);
  static SignatureKesProduct? _defaultInstance;

  @$pb.TagNumber(1)
  SignatureKesSum get superSignature => $_getN(0);
  @$pb.TagNumber(1)
  set superSignature(SignatureKesSum v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuperSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuperSignature() => clearField(1);
  @$pb.TagNumber(1)
  SignatureKesSum ensureSuperSignature() => $_ensure(0);

  @$pb.TagNumber(2)
  SignatureKesSum get subSignature => $_getN(1);
  @$pb.TagNumber(2)
  set subSignature(SignatureKesSum v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubSignature() => clearField(2);
  @$pb.TagNumber(2)
  SignatureKesSum ensureSubSignature() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get subRoot => $_getN(2);
  @$pb.TagNumber(3)
  set subRoot($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubRoot() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubRoot() => clearField(3);
}

