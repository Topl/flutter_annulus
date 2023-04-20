///
//  Generated code. Do not modify.
//  source: quivr/models/shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Data', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Data._() : super();
  factory Data({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory Data.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Data.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Data clone() => Data()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Data copyWith(void Function(Data) updates) => super.copyWith((message) => updates(message as Data)) as Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Data create() => Data._();
  Data createEmptyInstance() => create();
  static $pb.PbList<Data> createRepeated() => $pb.PbList<Data>();
  @$core.pragma('dart2js:noInline')
  static Data getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Data>(create);
  static Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class SmallData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SmallData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SmallData._() : super();
  factory SmallData({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory SmallData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmallData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmallData clone() => SmallData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmallData copyWith(void Function(SmallData) updates) => super.copyWith((message) => updates(message as SmallData)) as SmallData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmallData create() => SmallData._();
  SmallData createEmptyInstance() => create();
  static $pb.PbList<SmallData> createRepeated() => $pb.PbList<SmallData>();
  @$core.pragma('dart2js:noInline')
  static SmallData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmallData>(create);
  static SmallData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

enum Root_Value {
  root32, 
  root64, 
  notSet
}

class Root extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Root_Value> _Root_ValueByTag = {
    1 : Root_Value.root32,
    2 : Root_Value.root64,
    0 : Root_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Root', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'root32', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'root64', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Root._() : super();
  factory Root({
    $core.List<$core.int>? root32,
    $core.List<$core.int>? root64,
  }) {
    final _result = create();
    if (root32 != null) {
      _result.root32 = root32;
    }
    if (root64 != null) {
      _result.root64 = root64;
    }
    return _result;
  }
  factory Root.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Root.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Root clone() => Root()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Root copyWith(void Function(Root) updates) => super.copyWith((message) => updates(message as Root)) as Root; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Root create() => Root._();
  Root createEmptyInstance() => create();
  static $pb.PbList<Root> createRepeated() => $pb.PbList<Root>();
  @$core.pragma('dart2js:noInline')
  static Root getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Root>(create);
  static Root? _defaultInstance;

  Root_Value whichValue() => _Root_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get root32 => $_getN(0);
  @$pb.TagNumber(1)
  set root32($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoot32() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoot32() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get root64 => $_getN(1);
  @$pb.TagNumber(2)
  set root64($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoot64() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoot64() => clearField(2);
}

class Preimage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Preimage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'input', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'salt', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Preimage._() : super();
  factory Preimage({
    $core.List<$core.int>? input,
    $core.List<$core.int>? salt,
  }) {
    final _result = create();
    if (input != null) {
      _result.input = input;
    }
    if (salt != null) {
      _result.salt = salt;
    }
    return _result;
  }
  factory Preimage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Preimage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Preimage clone() => Preimage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Preimage copyWith(void Function(Preimage) updates) => super.copyWith((message) => updates(message as Preimage)) as Preimage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Preimage create() => Preimage._();
  Preimage createEmptyInstance() => create();
  static $pb.PbList<Preimage> createRepeated() => $pb.PbList<Preimage>();
  @$core.pragma('dart2js:noInline')
  static Preimage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Preimage>(create);
  static Preimage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get input => $_getN(0);
  @$pb.TagNumber(1)
  set input($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInput() => $_has(0);
  @$pb.TagNumber(1)
  void clearInput() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get salt => $_getN(1);
  @$pb.TagNumber(2)
  set salt($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSalt() => $_has(1);
  @$pb.TagNumber(2)
  void clearSalt() => clearField(2);
}

class Digest_Digest32 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Digest.Digest32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Digest_Digest32._() : super();
  factory Digest_Digest32({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory Digest_Digest32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Digest_Digest32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Digest_Digest32 clone() => Digest_Digest32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Digest_Digest32 copyWith(void Function(Digest_Digest32) updates) => super.copyWith((message) => updates(message as Digest_Digest32)) as Digest_Digest32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Digest_Digest32 create() => Digest_Digest32._();
  Digest_Digest32 createEmptyInstance() => create();
  static $pb.PbList<Digest_Digest32> createRepeated() => $pb.PbList<Digest_Digest32>();
  @$core.pragma('dart2js:noInline')
  static Digest_Digest32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Digest_Digest32>(create);
  static Digest_Digest32? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class Digest_Digest64 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Digest.Digest64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Digest_Digest64._() : super();
  factory Digest_Digest64({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory Digest_Digest64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Digest_Digest64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Digest_Digest64 clone() => Digest_Digest64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Digest_Digest64 copyWith(void Function(Digest_Digest64) updates) => super.copyWith((message) => updates(message as Digest_Digest64)) as Digest_Digest64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Digest_Digest64 create() => Digest_Digest64._();
  Digest_Digest64 createEmptyInstance() => create();
  static $pb.PbList<Digest_Digest64> createRepeated() => $pb.PbList<Digest_Digest64>();
  @$core.pragma('dart2js:noInline')
  static Digest_Digest64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Digest_Digest64>(create);
  static Digest_Digest64? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

enum Digest_Value {
  digest32, 
  digest64, 
  notSet
}

class Digest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Digest_Value> _Digest_ValueByTag = {
    1 : Digest_Value.digest32,
    2 : Digest_Value.digest64,
    0 : Digest_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Digest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Digest_Digest32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'digest32', subBuilder: Digest_Digest32.create)
    ..aOM<Digest_Digest64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'digest64', subBuilder: Digest_Digest64.create)
    ..hasRequiredFields = false
  ;

  Digest._() : super();
  factory Digest({
    Digest_Digest32? digest32,
    Digest_Digest64? digest64,
  }) {
    final _result = create();
    if (digest32 != null) {
      _result.digest32 = digest32;
    }
    if (digest64 != null) {
      _result.digest64 = digest64;
    }
    return _result;
  }
  factory Digest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Digest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Digest clone() => Digest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Digest copyWith(void Function(Digest) updates) => super.copyWith((message) => updates(message as Digest)) as Digest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Digest create() => Digest._();
  Digest createEmptyInstance() => create();
  static $pb.PbList<Digest> createRepeated() => $pb.PbList<Digest>();
  @$core.pragma('dart2js:noInline')
  static Digest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Digest>(create);
  static Digest? _defaultInstance;

  Digest_Value whichValue() => _Digest_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Digest_Digest32 get digest32 => $_getN(0);
  @$pb.TagNumber(1)
  set digest32(Digest_Digest32 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDigest32() => $_has(0);
  @$pb.TagNumber(1)
  void clearDigest32() => clearField(1);
  @$pb.TagNumber(1)
  Digest_Digest32 ensureDigest32() => $_ensure(0);

  @$pb.TagNumber(2)
  Digest_Digest64 get digest64 => $_getN(1);
  @$pb.TagNumber(2)
  set digest64(Digest_Digest64 v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDigest64() => $_has(1);
  @$pb.TagNumber(2)
  void clearDigest64() => clearField(2);
  @$pb.TagNumber(2)
  Digest_Digest64 ensureDigest64() => $_ensure(1);
}

class DigestVerification extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DigestVerification', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<Digest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'digest', subBuilder: Digest.create)
    ..aOM<Preimage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preimage', subBuilder: Preimage.create)
    ..hasRequiredFields = false
  ;

  DigestVerification._() : super();
  factory DigestVerification({
    Digest? digest,
    Preimage? preimage,
  }) {
    final _result = create();
    if (digest != null) {
      _result.digest = digest;
    }
    if (preimage != null) {
      _result.preimage = preimage;
    }
    return _result;
  }
  factory DigestVerification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DigestVerification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DigestVerification clone() => DigestVerification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DigestVerification copyWith(void Function(DigestVerification) updates) => super.copyWith((message) => updates(message as DigestVerification)) as DigestVerification; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DigestVerification create() => DigestVerification._();
  DigestVerification createEmptyInstance() => create();
  static $pb.PbList<DigestVerification> createRepeated() => $pb.PbList<DigestVerification>();
  @$core.pragma('dart2js:noInline')
  static DigestVerification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DigestVerification>(create);
  static DigestVerification? _defaultInstance;

  @$pb.TagNumber(1)
  Digest get digest => $_getN(0);
  @$pb.TagNumber(1)
  set digest(Digest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDigest() => $_has(0);
  @$pb.TagNumber(1)
  void clearDigest() => clearField(1);
  @$pb.TagNumber(1)
  Digest ensureDigest() => $_ensure(0);

  @$pb.TagNumber(2)
  Preimage get preimage => $_getN(1);
  @$pb.TagNumber(2)
  set preimage(Preimage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPreimage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreimage() => clearField(2);
  @$pb.TagNumber(2)
  Preimage ensurePreimage() => $_ensure(1);
}

class VerificationKey_Ed25519Vk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerificationKey.Ed25519Vk', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  VerificationKey_Ed25519Vk._() : super();
  factory VerificationKey_Ed25519Vk({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory VerificationKey_Ed25519Vk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerificationKey_Ed25519Vk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerificationKey_Ed25519Vk clone() => VerificationKey_Ed25519Vk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerificationKey_Ed25519Vk copyWith(void Function(VerificationKey_Ed25519Vk) updates) => super.copyWith((message) => updates(message as VerificationKey_Ed25519Vk)) as VerificationKey_Ed25519Vk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerificationKey_Ed25519Vk create() => VerificationKey_Ed25519Vk._();
  VerificationKey_Ed25519Vk createEmptyInstance() => create();
  static $pb.PbList<VerificationKey_Ed25519Vk> createRepeated() => $pb.PbList<VerificationKey_Ed25519Vk>();
  @$core.pragma('dart2js:noInline')
  static VerificationKey_Ed25519Vk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerificationKey_Ed25519Vk>(create);
  static VerificationKey_Ed25519Vk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class VerificationKey_ExtendedEd25519Vk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerificationKey.ExtendedEd25519Vk', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<VerificationKey_Ed25519Vk>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vk', subBuilder: VerificationKey_Ed25519Vk.create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chainCode', $pb.PbFieldType.OY, protoName: 'chainCode')
    ..hasRequiredFields = false
  ;

  VerificationKey_ExtendedEd25519Vk._() : super();
  factory VerificationKey_ExtendedEd25519Vk({
    VerificationKey_Ed25519Vk? vk,
    $core.List<$core.int>? chainCode,
  }) {
    final _result = create();
    if (vk != null) {
      _result.vk = vk;
    }
    if (chainCode != null) {
      _result.chainCode = chainCode;
    }
    return _result;
  }
  factory VerificationKey_ExtendedEd25519Vk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerificationKey_ExtendedEd25519Vk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerificationKey_ExtendedEd25519Vk clone() => VerificationKey_ExtendedEd25519Vk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerificationKey_ExtendedEd25519Vk copyWith(void Function(VerificationKey_ExtendedEd25519Vk) updates) => super.copyWith((message) => updates(message as VerificationKey_ExtendedEd25519Vk)) as VerificationKey_ExtendedEd25519Vk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerificationKey_ExtendedEd25519Vk create() => VerificationKey_ExtendedEd25519Vk._();
  VerificationKey_ExtendedEd25519Vk createEmptyInstance() => create();
  static $pb.PbList<VerificationKey_ExtendedEd25519Vk> createRepeated() => $pb.PbList<VerificationKey_ExtendedEd25519Vk>();
  @$core.pragma('dart2js:noInline')
  static VerificationKey_ExtendedEd25519Vk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerificationKey_ExtendedEd25519Vk>(create);
  static VerificationKey_ExtendedEd25519Vk? _defaultInstance;

  @$pb.TagNumber(1)
  VerificationKey_Ed25519Vk get vk => $_getN(0);
  @$pb.TagNumber(1)
  set vk(VerificationKey_Ed25519Vk v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVk() => $_has(0);
  @$pb.TagNumber(1)
  void clearVk() => clearField(1);
  @$pb.TagNumber(1)
  VerificationKey_Ed25519Vk ensureVk() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get chainCode => $_getN(1);
  @$pb.TagNumber(2)
  set chainCode($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainCode() => clearField(2);
}

enum VerificationKey_Vk {
  ed25519, 
  extendedEd25519, 
  notSet
}

class VerificationKey extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, VerificationKey_Vk> _VerificationKey_VkByTag = {
    1 : VerificationKey_Vk.ed25519,
    2 : VerificationKey_Vk.extendedEd25519,
    0 : VerificationKey_Vk.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerificationKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<VerificationKey_Ed25519Vk>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ed25519', subBuilder: VerificationKey_Ed25519Vk.create)
    ..aOM<VerificationKey_ExtendedEd25519Vk>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extendedEd25519', protoName: 'extendedEd25519', subBuilder: VerificationKey_ExtendedEd25519Vk.create)
    ..hasRequiredFields = false
  ;

  VerificationKey._() : super();
  factory VerificationKey({
    VerificationKey_Ed25519Vk? ed25519,
    VerificationKey_ExtendedEd25519Vk? extendedEd25519,
  }) {
    final _result = create();
    if (ed25519 != null) {
      _result.ed25519 = ed25519;
    }
    if (extendedEd25519 != null) {
      _result.extendedEd25519 = extendedEd25519;
    }
    return _result;
  }
  factory VerificationKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerificationKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerificationKey clone() => VerificationKey()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerificationKey copyWith(void Function(VerificationKey) updates) => super.copyWith((message) => updates(message as VerificationKey)) as VerificationKey; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerificationKey create() => VerificationKey._();
  VerificationKey createEmptyInstance() => create();
  static $pb.PbList<VerificationKey> createRepeated() => $pb.PbList<VerificationKey>();
  @$core.pragma('dart2js:noInline')
  static VerificationKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerificationKey>(create);
  static VerificationKey? _defaultInstance;

  VerificationKey_Vk whichVk() => _VerificationKey_VkByTag[$_whichOneof(0)]!;
  void clearVk() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  VerificationKey_Ed25519Vk get ed25519 => $_getN(0);
  @$pb.TagNumber(1)
  set ed25519(VerificationKey_Ed25519Vk v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEd25519() => $_has(0);
  @$pb.TagNumber(1)
  void clearEd25519() => clearField(1);
  @$pb.TagNumber(1)
  VerificationKey_Ed25519Vk ensureEd25519() => $_ensure(0);

  @$pb.TagNumber(2)
  VerificationKey_ExtendedEd25519Vk get extendedEd25519 => $_getN(1);
  @$pb.TagNumber(2)
  set extendedEd25519(VerificationKey_ExtendedEd25519Vk v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExtendedEd25519() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtendedEd25519() => clearField(2);
  @$pb.TagNumber(2)
  VerificationKey_ExtendedEd25519Vk ensureExtendedEd25519() => $_ensure(1);
}

class SigningKey_Ed25519Sk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SigningKey.Ed25519Sk', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SigningKey_Ed25519Sk._() : super();
  factory SigningKey_Ed25519Sk({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory SigningKey_Ed25519Sk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SigningKey_Ed25519Sk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SigningKey_Ed25519Sk clone() => SigningKey_Ed25519Sk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SigningKey_Ed25519Sk copyWith(void Function(SigningKey_Ed25519Sk) updates) => super.copyWith((message) => updates(message as SigningKey_Ed25519Sk)) as SigningKey_Ed25519Sk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SigningKey_Ed25519Sk create() => SigningKey_Ed25519Sk._();
  SigningKey_Ed25519Sk createEmptyInstance() => create();
  static $pb.PbList<SigningKey_Ed25519Sk> createRepeated() => $pb.PbList<SigningKey_Ed25519Sk>();
  @$core.pragma('dart2js:noInline')
  static SigningKey_Ed25519Sk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SigningKey_Ed25519Sk>(create);
  static SigningKey_Ed25519Sk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class SigningKey_ExtendedEd25519Sk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SigningKey.ExtendedEd25519Sk', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leftKey', $pb.PbFieldType.OY, protoName: 'leftKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rightKey', $pb.PbFieldType.OY, protoName: 'rightKey')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chainCode', $pb.PbFieldType.OY, protoName: 'chainCode')
    ..hasRequiredFields = false
  ;

  SigningKey_ExtendedEd25519Sk._() : super();
  factory SigningKey_ExtendedEd25519Sk({
    $core.List<$core.int>? leftKey,
    $core.List<$core.int>? rightKey,
    $core.List<$core.int>? chainCode,
  }) {
    final _result = create();
    if (leftKey != null) {
      _result.leftKey = leftKey;
    }
    if (rightKey != null) {
      _result.rightKey = rightKey;
    }
    if (chainCode != null) {
      _result.chainCode = chainCode;
    }
    return _result;
  }
  factory SigningKey_ExtendedEd25519Sk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SigningKey_ExtendedEd25519Sk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SigningKey_ExtendedEd25519Sk clone() => SigningKey_ExtendedEd25519Sk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SigningKey_ExtendedEd25519Sk copyWith(void Function(SigningKey_ExtendedEd25519Sk) updates) => super.copyWith((message) => updates(message as SigningKey_ExtendedEd25519Sk)) as SigningKey_ExtendedEd25519Sk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SigningKey_ExtendedEd25519Sk create() => SigningKey_ExtendedEd25519Sk._();
  SigningKey_ExtendedEd25519Sk createEmptyInstance() => create();
  static $pb.PbList<SigningKey_ExtendedEd25519Sk> createRepeated() => $pb.PbList<SigningKey_ExtendedEd25519Sk>();
  @$core.pragma('dart2js:noInline')
  static SigningKey_ExtendedEd25519Sk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SigningKey_ExtendedEd25519Sk>(create);
  static SigningKey_ExtendedEd25519Sk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get leftKey => $_getN(0);
  @$pb.TagNumber(1)
  set leftKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLeftKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get rightKey => $_getN(1);
  @$pb.TagNumber(2)
  set rightKey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRightKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get chainCode => $_getN(2);
  @$pb.TagNumber(3)
  set chainCode($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChainCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainCode() => clearField(3);
}

enum SigningKey_Sk {
  ed25519, 
  extendedEd25519, 
  notSet
}

class SigningKey extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, SigningKey_Sk> _SigningKey_SkByTag = {
    1 : SigningKey_Sk.ed25519,
    2 : SigningKey_Sk.extendedEd25519,
    0 : SigningKey_Sk.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SigningKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<SigningKey_Ed25519Sk>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ed25519', subBuilder: SigningKey_Ed25519Sk.create)
    ..aOM<SigningKey_ExtendedEd25519Sk>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extendedEd25519', protoName: 'extendedEd25519', subBuilder: SigningKey_ExtendedEd25519Sk.create)
    ..hasRequiredFields = false
  ;

  SigningKey._() : super();
  factory SigningKey({
    SigningKey_Ed25519Sk? ed25519,
    SigningKey_ExtendedEd25519Sk? extendedEd25519,
  }) {
    final _result = create();
    if (ed25519 != null) {
      _result.ed25519 = ed25519;
    }
    if (extendedEd25519 != null) {
      _result.extendedEd25519 = extendedEd25519;
    }
    return _result;
  }
  factory SigningKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SigningKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SigningKey clone() => SigningKey()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SigningKey copyWith(void Function(SigningKey) updates) => super.copyWith((message) => updates(message as SigningKey)) as SigningKey; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SigningKey create() => SigningKey._();
  SigningKey createEmptyInstance() => create();
  static $pb.PbList<SigningKey> createRepeated() => $pb.PbList<SigningKey>();
  @$core.pragma('dart2js:noInline')
  static SigningKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SigningKey>(create);
  static SigningKey? _defaultInstance;

  SigningKey_Sk whichSk() => _SigningKey_SkByTag[$_whichOneof(0)]!;
  void clearSk() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  SigningKey_Ed25519Sk get ed25519 => $_getN(0);
  @$pb.TagNumber(1)
  set ed25519(SigningKey_Ed25519Sk v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEd25519() => $_has(0);
  @$pb.TagNumber(1)
  void clearEd25519() => clearField(1);
  @$pb.TagNumber(1)
  SigningKey_Ed25519Sk ensureEd25519() => $_ensure(0);

  @$pb.TagNumber(2)
  SigningKey_ExtendedEd25519Sk get extendedEd25519 => $_getN(1);
  @$pb.TagNumber(2)
  set extendedEd25519(SigningKey_ExtendedEd25519Sk v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExtendedEd25519() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtendedEd25519() => clearField(2);
  @$pb.TagNumber(2)
  SigningKey_ExtendedEd25519Sk ensureExtendedEd25519() => $_ensure(1);
}

class KeyPair extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KeyPair', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<VerificationKey>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vk', subBuilder: VerificationKey.create)
    ..aOM<SigningKey>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sk', subBuilder: SigningKey.create)
    ..hasRequiredFields = false
  ;

  KeyPair._() : super();
  factory KeyPair({
    VerificationKey? vk,
    SigningKey? sk,
  }) {
    final _result = create();
    if (vk != null) {
      _result.vk = vk;
    }
    if (sk != null) {
      _result.sk = sk;
    }
    return _result;
  }
  factory KeyPair.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeyPair.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeyPair clone() => KeyPair()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeyPair copyWith(void Function(KeyPair) updates) => super.copyWith((message) => updates(message as KeyPair)) as KeyPair; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KeyPair create() => KeyPair._();
  KeyPair createEmptyInstance() => create();
  static $pb.PbList<KeyPair> createRepeated() => $pb.PbList<KeyPair>();
  @$core.pragma('dart2js:noInline')
  static KeyPair getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeyPair>(create);
  static KeyPair? _defaultInstance;

  @$pb.TagNumber(1)
  VerificationKey get vk => $_getN(0);
  @$pb.TagNumber(1)
  set vk(VerificationKey v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVk() => $_has(0);
  @$pb.TagNumber(1)
  void clearVk() => clearField(1);
  @$pb.TagNumber(1)
  VerificationKey ensureVk() => $_ensure(0);

  @$pb.TagNumber(2)
  SigningKey get sk => $_getN(1);
  @$pb.TagNumber(2)
  set sk(SigningKey v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSk() => $_has(1);
  @$pb.TagNumber(2)
  void clearSk() => clearField(2);
  @$pb.TagNumber(2)
  SigningKey ensureSk() => $_ensure(1);
}

class Message extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Message', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Message._() : super();
  factory Message({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class Witness extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Witness', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Witness._() : super();
  factory Witness({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory Witness.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Witness.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Witness clone() => Witness()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Witness copyWith(void Function(Witness) updates) => super.copyWith((message) => updates(message as Witness)) as Witness; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Witness create() => Witness._();
  Witness createEmptyInstance() => create();
  static $pb.PbList<Witness> createRepeated() => $pb.PbList<Witness>();
  @$core.pragma('dart2js:noInline')
  static Witness getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Witness>(create);
  static Witness? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class SignatureVerification extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignatureVerification', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..aOM<VerificationKey>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verificationKey', protoName: 'verificationKey', subBuilder: VerificationKey.create)
    ..aOM<Witness>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature', subBuilder: Witness.create)
    ..aOM<Message>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: Message.create)
    ..hasRequiredFields = false
  ;

  SignatureVerification._() : super();
  factory SignatureVerification({
    VerificationKey? verificationKey,
    Witness? signature,
    Message? message,
  }) {
    final _result = create();
    if (verificationKey != null) {
      _result.verificationKey = verificationKey;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory SignatureVerification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignatureVerification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignatureVerification clone() => SignatureVerification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignatureVerification copyWith(void Function(SignatureVerification) updates) => super.copyWith((message) => updates(message as SignatureVerification)) as SignatureVerification; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignatureVerification create() => SignatureVerification._();
  SignatureVerification createEmptyInstance() => create();
  static $pb.PbList<SignatureVerification> createRepeated() => $pb.PbList<SignatureVerification>();
  @$core.pragma('dart2js:noInline')
  static SignatureVerification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignatureVerification>(create);
  static SignatureVerification? _defaultInstance;

  @$pb.TagNumber(1)
  VerificationKey get verificationKey => $_getN(0);
  @$pb.TagNumber(1)
  set verificationKey(VerificationKey v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerificationKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerificationKey() => clearField(1);
  @$pb.TagNumber(1)
  VerificationKey ensureVerificationKey() => $_ensure(0);

  @$pb.TagNumber(2)
  Witness get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature(Witness v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);
  @$pb.TagNumber(2)
  Witness ensureSignature() => $_ensure(1);

  @$pb.TagNumber(3)
  Message get message => $_getN(2);
  @$pb.TagNumber(3)
  set message(Message v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
  @$pb.TagNumber(3)
  Message ensureMessage() => $_ensure(2);
}

class SignableBytes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignableBytes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SignableBytes._() : super();
  factory SignableBytes({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory SignableBytes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignableBytes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignableBytes clone() => SignableBytes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignableBytes copyWith(void Function(SignableBytes) updates) => super.copyWith((message) => updates(message as SignableBytes)) as SignableBytes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignableBytes create() => SignableBytes._();
  SignableBytes createEmptyInstance() => create();
  static $pb.PbList<SignableBytes> createRepeated() => $pb.PbList<SignableBytes>();
  @$core.pragma('dart2js:noInline')
  static SignableBytes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignableBytes>(create);
  static SignableBytes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class TxBind extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TxBind', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  TxBind._() : super();
  factory TxBind({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory TxBind.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TxBind.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TxBind clone() => TxBind()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TxBind copyWith(void Function(TxBind) updates) => super.copyWith((message) => updates(message as TxBind)) as TxBind; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TxBind create() => TxBind._();
  TxBind createEmptyInstance() => create();
  static $pb.PbList<TxBind> createRepeated() => $pb.PbList<TxBind>();
  @$core.pragma('dart2js:noInline')
  static TxBind getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxBind>(create);
  static TxBind? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class Int128 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Int128', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quivr.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Int128._() : super();
  factory Int128({
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory Int128.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Int128.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Int128 clone() => Int128()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Int128 copyWith(void Function(Int128) updates) => super.copyWith((message) => updates(message as Int128)) as Int128; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Int128 create() => Int128._();
  Int128 createEmptyInstance() => create();
  static $pb.PbList<Int128> createRepeated() => $pb.PbList<Int128>();
  @$core.pragma('dart2js:noInline')
  static Int128 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Int128>(create);
  static Int128? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

