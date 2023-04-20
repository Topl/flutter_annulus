///
//  Generated code. Do not modify.
//  source: genus/genus_models.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../brambl/models/box/box.pb.dart' as $24;
import '../brambl/models/address.pb.dart' as $11;
import '../google/protobuf/wrappers.pb.dart' as $8;
import '../brambl/models/transaction/io_transaction.pb.dart' as $22;
import '../consensus/models/block_id.pb.dart' as $2;
import '../consensus/models/block_header.pb.dart' as $23;
import '../node/models/block.pb.dart' as $25;

import 'genus_models.pbenum.dart';

export 'genus_models.pbenum.dart';

class Txo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Txo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..aOM<$24.Box>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'box', subBuilder: $24.Box.create)
    ..e<TxoState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: TxoState.SPENT, valueOf: TxoState.valueOf, enumValues: TxoState.values)
    ..aOM<$11.TransactionOutputAddress>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'outputAddress', protoName: 'outputAddress', subBuilder: $11.TransactionOutputAddress.create)
    ..aOM<$11.LockAddress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lockAddress', protoName: 'lockAddress', subBuilder: $11.LockAddress.create)
    ..hasRequiredFields = false
  ;

  Txo._() : super();
  factory Txo({
    $24.Box? box,
    TxoState? state,
    $11.TransactionOutputAddress? outputAddress,
    $11.LockAddress? lockAddress,
  }) {
    final _result = create();
    if (box != null) {
      _result.box = box;
    }
    if (state != null) {
      _result.state = state;
    }
    if (outputAddress != null) {
      _result.outputAddress = outputAddress;
    }
    if (lockAddress != null) {
      _result.lockAddress = lockAddress;
    }
    return _result;
  }
  factory Txo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Txo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Txo clone() => Txo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Txo copyWith(void Function(Txo) updates) => super.copyWith((message) => updates(message as Txo)) as Txo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Txo create() => Txo._();
  Txo createEmptyInstance() => create();
  static $pb.PbList<Txo> createRepeated() => $pb.PbList<Txo>();
  @$core.pragma('dart2js:noInline')
  static Txo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Txo>(create);
  static Txo? _defaultInstance;

  @$pb.TagNumber(1)
  $24.Box get box => $_getN(0);
  @$pb.TagNumber(1)
  set box($24.Box v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBox() => $_has(0);
  @$pb.TagNumber(1)
  void clearBox() => clearField(1);
  @$pb.TagNumber(1)
  $24.Box ensureBox() => $_ensure(0);

  @$pb.TagNumber(2)
  TxoState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(TxoState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  $11.TransactionOutputAddress get outputAddress => $_getN(2);
  @$pb.TagNumber(3)
  set outputAddress($11.TransactionOutputAddress v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOutputAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutputAddress() => clearField(3);
  @$pb.TagNumber(3)
  $11.TransactionOutputAddress ensureOutputAddress() => $_ensure(2);

  @$pb.TagNumber(4)
  $11.LockAddress get lockAddress => $_getN(3);
  @$pb.TagNumber(4)
  set lockAddress($11.LockAddress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLockAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearLockAddress() => clearField(4);
  @$pb.TagNumber(4)
  $11.LockAddress ensureLockAddress() => $_ensure(3);
}

class ConfidenceFactor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfidenceFactor', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  ConfidenceFactor._() : super();
  factory ConfidenceFactor({
    $core.double? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ConfidenceFactor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfidenceFactor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfidenceFactor clone() => ConfidenceFactor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfidenceFactor copyWith(void Function(ConfidenceFactor) updates) => super.copyWith((message) => updates(message as ConfidenceFactor)) as ConfidenceFactor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfidenceFactor create() => ConfidenceFactor._();
  ConfidenceFactor createEmptyInstance() => create();
  static $pb.PbList<ConfidenceFactor> createRepeated() => $pb.PbList<ConfidenceFactor>();
  @$core.pragma('dart2js:noInline')
  static ConfidenceFactor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfidenceFactor>(create);
  static ConfidenceFactor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class ChainDistance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChainDistance', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..hasRequiredFields = false
  ;

  ChainDistance._() : super();
  factory ChainDistance({
    $fixnum.Int64? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ChainDistance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainDistance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChainDistance clone() => ChainDistance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChainDistance copyWith(void Function(ChainDistance) updates) => super.copyWith((message) => updates(message as ChainDistance)) as ChainDistance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChainDistance create() => ChainDistance._();
  ChainDistance createEmptyInstance() => create();
  static $pb.PbList<ChainDistance> createRepeated() => $pb.PbList<ChainDistance>();
  @$core.pragma('dart2js:noInline')
  static ChainDistance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainDistance>(create);
  static ChainDistance? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class AssetLabel_Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AssetLabel.Empty', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  AssetLabel_Empty._() : super();
  factory AssetLabel_Empty() => create();
  factory AssetLabel_Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetLabel_Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetLabel_Empty clone() => AssetLabel_Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetLabel_Empty copyWith(void Function(AssetLabel_Empty) updates) => super.copyWith((message) => updates(message as AssetLabel_Empty)) as AssetLabel_Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AssetLabel_Empty create() => AssetLabel_Empty._();
  AssetLabel_Empty createEmptyInstance() => create();
  static $pb.PbList<AssetLabel_Empty> createRepeated() => $pb.PbList<AssetLabel_Empty>();
  @$core.pragma('dart2js:noInline')
  static AssetLabel_Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetLabel_Empty>(create);
  static AssetLabel_Empty? _defaultInstance;
}

class AssetLabel_V1Label extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AssetLabel.V1Label', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version', $pb.PbFieldType.OU3)
    ..aOM<$11.Address>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mintingAddress', protoName: 'mintingAddress', subBuilder: $11.Address.create)
    ..hasRequiredFields = false
  ;

  AssetLabel_V1Label._() : super();
  factory AssetLabel_V1Label({
    $core.int? version,
    $11.Address? mintingAddress,
  }) {
    final _result = create();
    if (version != null) {
      _result.version = version;
    }
    if (mintingAddress != null) {
      _result.mintingAddress = mintingAddress;
    }
    return _result;
  }
  factory AssetLabel_V1Label.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetLabel_V1Label.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetLabel_V1Label clone() => AssetLabel_V1Label()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetLabel_V1Label copyWith(void Function(AssetLabel_V1Label) updates) => super.copyWith((message) => updates(message as AssetLabel_V1Label)) as AssetLabel_V1Label; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AssetLabel_V1Label create() => AssetLabel_V1Label._();
  AssetLabel_V1Label createEmptyInstance() => create();
  static $pb.PbList<AssetLabel_V1Label> createRepeated() => $pb.PbList<AssetLabel_V1Label>();
  @$core.pragma('dart2js:noInline')
  static AssetLabel_V1Label getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetLabel_V1Label>(create);
  static AssetLabel_V1Label? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $11.Address get mintingAddress => $_getN(1);
  @$pb.TagNumber(2)
  set mintingAddress($11.Address v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMintingAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearMintingAddress() => clearField(2);
  @$pb.TagNumber(2)
  $11.Address ensureMintingAddress() => $_ensure(1);
}

class AssetLabel_Tam2Label extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AssetLabel.Tam2Label', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupHashMostSignificant', $pb.PbFieldType.OF6, protoName: 'groupHashMostSignificant', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupHashMoreSignificant', $pb.PbFieldType.OF6, protoName: 'groupHashMoreSignificant', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupHashLessSignificant', $pb.PbFieldType.OF6, protoName: 'groupHashLessSignificant', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupHashLeastSignificant', $pb.PbFieldType.OF6, protoName: 'groupHashLeastSignificant', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seriesHashMostSignificant', $pb.PbFieldType.OF6, protoName: 'seriesHashMostSignificant', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seriesHashMoreSignificant', $pb.PbFieldType.OF6, protoName: 'seriesHashMoreSignificant', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seriesHashLessSignificant', $pb.PbFieldType.OF6, protoName: 'seriesHashLessSignificant', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seriesHashLeastSignificant', $pb.PbFieldType.OF6, protoName: 'seriesHashLeastSignificant', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  AssetLabel_Tam2Label._() : super();
  factory AssetLabel_Tam2Label({
    $fixnum.Int64? groupHashMostSignificant,
    $fixnum.Int64? groupHashMoreSignificant,
    $fixnum.Int64? groupHashLessSignificant,
    $fixnum.Int64? groupHashLeastSignificant,
    $fixnum.Int64? seriesHashMostSignificant,
    $fixnum.Int64? seriesHashMoreSignificant,
    $fixnum.Int64? seriesHashLessSignificant,
    $fixnum.Int64? seriesHashLeastSignificant,
  }) {
    final _result = create();
    if (groupHashMostSignificant != null) {
      _result.groupHashMostSignificant = groupHashMostSignificant;
    }
    if (groupHashMoreSignificant != null) {
      _result.groupHashMoreSignificant = groupHashMoreSignificant;
    }
    if (groupHashLessSignificant != null) {
      _result.groupHashLessSignificant = groupHashLessSignificant;
    }
    if (groupHashLeastSignificant != null) {
      _result.groupHashLeastSignificant = groupHashLeastSignificant;
    }
    if (seriesHashMostSignificant != null) {
      _result.seriesHashMostSignificant = seriesHashMostSignificant;
    }
    if (seriesHashMoreSignificant != null) {
      _result.seriesHashMoreSignificant = seriesHashMoreSignificant;
    }
    if (seriesHashLessSignificant != null) {
      _result.seriesHashLessSignificant = seriesHashLessSignificant;
    }
    if (seriesHashLeastSignificant != null) {
      _result.seriesHashLeastSignificant = seriesHashLeastSignificant;
    }
    return _result;
  }
  factory AssetLabel_Tam2Label.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetLabel_Tam2Label.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetLabel_Tam2Label clone() => AssetLabel_Tam2Label()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetLabel_Tam2Label copyWith(void Function(AssetLabel_Tam2Label) updates) => super.copyWith((message) => updates(message as AssetLabel_Tam2Label)) as AssetLabel_Tam2Label; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AssetLabel_Tam2Label create() => AssetLabel_Tam2Label._();
  AssetLabel_Tam2Label createEmptyInstance() => create();
  static $pb.PbList<AssetLabel_Tam2Label> createRepeated() => $pb.PbList<AssetLabel_Tam2Label>();
  @$core.pragma('dart2js:noInline')
  static AssetLabel_Tam2Label getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetLabel_Tam2Label>(create);
  static AssetLabel_Tam2Label? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupHashMostSignificant => $_getI64(0);
  @$pb.TagNumber(1)
  set groupHashMostSignificant($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupHashMostSignificant() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupHashMostSignificant() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get groupHashMoreSignificant => $_getI64(1);
  @$pb.TagNumber(2)
  set groupHashMoreSignificant($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupHashMoreSignificant() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupHashMoreSignificant() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get groupHashLessSignificant => $_getI64(2);
  @$pb.TagNumber(3)
  set groupHashLessSignificant($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroupHashLessSignificant() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupHashLessSignificant() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get groupHashLeastSignificant => $_getI64(3);
  @$pb.TagNumber(4)
  set groupHashLeastSignificant($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGroupHashLeastSignificant() => $_has(3);
  @$pb.TagNumber(4)
  void clearGroupHashLeastSignificant() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get seriesHashMostSignificant => $_getI64(4);
  @$pb.TagNumber(5)
  set seriesHashMostSignificant($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSeriesHashMostSignificant() => $_has(4);
  @$pb.TagNumber(5)
  void clearSeriesHashMostSignificant() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get seriesHashMoreSignificant => $_getI64(5);
  @$pb.TagNumber(6)
  set seriesHashMoreSignificant($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSeriesHashMoreSignificant() => $_has(5);
  @$pb.TagNumber(6)
  void clearSeriesHashMoreSignificant() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get seriesHashLessSignificant => $_getI64(6);
  @$pb.TagNumber(7)
  set seriesHashLessSignificant($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSeriesHashLessSignificant() => $_has(6);
  @$pb.TagNumber(7)
  void clearSeriesHashLessSignificant() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get seriesHashLeastSignificant => $_getI64(7);
  @$pb.TagNumber(8)
  set seriesHashLeastSignificant($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSeriesHashLeastSignificant() => $_has(7);
  @$pb.TagNumber(8)
  void clearSeriesHashLeastSignificant() => clearField(8);
}

enum AssetLabel_Label {
  empty, 
  v1Label, 
  tam2Label, 
  notSet
}

class AssetLabel extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, AssetLabel_Label> _AssetLabel_LabelByTag = {
    2 : AssetLabel_Label.empty,
    3 : AssetLabel_Label.v1Label,
    4 : AssetLabel_Label.tam2Label,
    0 : AssetLabel_Label.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AssetLabel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..e<LabelType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'labelType', $pb.PbFieldType.OE, protoName: 'labelType', defaultOrMaker: LabelType.EMPTY, valueOf: LabelType.valueOf, enumValues: LabelType.values)
    ..aOM<AssetLabel_Empty>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'empty', subBuilder: AssetLabel_Empty.create)
    ..aOM<AssetLabel_V1Label>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'v1Label', protoName: 'v1Label', subBuilder: AssetLabel_V1Label.create)
    ..aOM<AssetLabel_Tam2Label>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tam2Label', protoName: 'tam2Label', subBuilder: AssetLabel_Tam2Label.create)
    ..hasRequiredFields = false
  ;

  AssetLabel._() : super();
  factory AssetLabel({
    LabelType? labelType,
    AssetLabel_Empty? empty,
    AssetLabel_V1Label? v1Label,
    AssetLabel_Tam2Label? tam2Label,
  }) {
    final _result = create();
    if (labelType != null) {
      _result.labelType = labelType;
    }
    if (empty != null) {
      _result.empty = empty;
    }
    if (v1Label != null) {
      _result.v1Label = v1Label;
    }
    if (tam2Label != null) {
      _result.tam2Label = tam2Label;
    }
    return _result;
  }
  factory AssetLabel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetLabel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetLabel clone() => AssetLabel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetLabel copyWith(void Function(AssetLabel) updates) => super.copyWith((message) => updates(message as AssetLabel)) as AssetLabel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AssetLabel create() => AssetLabel._();
  AssetLabel createEmptyInstance() => create();
  static $pb.PbList<AssetLabel> createRepeated() => $pb.PbList<AssetLabel>();
  @$core.pragma('dart2js:noInline')
  static AssetLabel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetLabel>(create);
  static AssetLabel? _defaultInstance;

  AssetLabel_Label whichLabel() => _AssetLabel_LabelByTag[$_whichOneof(0)]!;
  void clearLabel() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  LabelType get labelType => $_getN(0);
  @$pb.TagNumber(1)
  set labelType(LabelType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLabelType() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabelType() => clearField(1);

  @$pb.TagNumber(2)
  AssetLabel_Empty get empty => $_getN(1);
  @$pb.TagNumber(2)
  set empty(AssetLabel_Empty v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmpty() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmpty() => clearField(2);
  @$pb.TagNumber(2)
  AssetLabel_Empty ensureEmpty() => $_ensure(1);

  @$pb.TagNumber(3)
  AssetLabel_V1Label get v1Label => $_getN(2);
  @$pb.TagNumber(3)
  set v1Label(AssetLabel_V1Label v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasV1Label() => $_has(2);
  @$pb.TagNumber(3)
  void clearV1Label() => clearField(3);
  @$pb.TagNumber(3)
  AssetLabel_V1Label ensureV1Label() => $_ensure(2);

  @$pb.TagNumber(4)
  AssetLabel_Tam2Label get tam2Label => $_getN(3);
  @$pb.TagNumber(4)
  set tam2Label(AssetLabel_Tam2Label v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTam2Label() => $_has(3);
  @$pb.TagNumber(4)
  void clearTam2Label() => clearField(4);
  @$pb.TagNumber(4)
  AssetLabel_Tam2Label ensureTam2Label() => $_ensure(3);
}

class IndexSpec extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IndexSpec', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexName', protoName: 'indexName')
    ..aOM<IndexFieldSpec>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexFieldSpec', protoName: 'indexFieldSpec', subBuilder: IndexFieldSpec.create)
    ..aOM<IndexFilter>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexFilter', protoName: 'indexFilter', subBuilder: IndexFilter.create)
    ..hasRequiredFields = false
  ;

  IndexSpec._() : super();
  factory IndexSpec({
    $core.String? indexName,
    IndexFieldSpec? indexFieldSpec,
    IndexFilter? indexFilter,
  }) {
    final _result = create();
    if (indexName != null) {
      _result.indexName = indexName;
    }
    if (indexFieldSpec != null) {
      _result.indexFieldSpec = indexFieldSpec;
    }
    if (indexFilter != null) {
      _result.indexFilter = indexFilter;
    }
    return _result;
  }
  factory IndexSpec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IndexSpec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IndexSpec clone() => IndexSpec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IndexSpec copyWith(void Function(IndexSpec) updates) => super.copyWith((message) => updates(message as IndexSpec)) as IndexSpec; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IndexSpec create() => IndexSpec._();
  IndexSpec createEmptyInstance() => create();
  static $pb.PbList<IndexSpec> createRepeated() => $pb.PbList<IndexSpec>();
  @$core.pragma('dart2js:noInline')
  static IndexSpec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IndexSpec>(create);
  static IndexSpec? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get indexName => $_getSZ(0);
  @$pb.TagNumber(1)
  set indexName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexName() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexName() => clearField(1);

  @$pb.TagNumber(2)
  IndexFieldSpec get indexFieldSpec => $_getN(1);
  @$pb.TagNumber(2)
  set indexFieldSpec(IndexFieldSpec v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndexFieldSpec() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndexFieldSpec() => clearField(2);
  @$pb.TagNumber(2)
  IndexFieldSpec ensureIndexFieldSpec() => $_ensure(1);

  @$pb.TagNumber(3)
  IndexFilter get indexFilter => $_getN(2);
  @$pb.TagNumber(3)
  set indexFilter(IndexFilter v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndexFilter() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndexFilter() => clearField(3);
  @$pb.TagNumber(3)
  IndexFilter ensureIndexFilter() => $_ensure(2);
}

enum IndexFieldSpec_Spec {
  jsonSpecs, 
  csvSpecs, 
  notSet
}

class IndexFieldSpec extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, IndexFieldSpec_Spec> _IndexFieldSpec_SpecByTag = {
    1 : IndexFieldSpec_Spec.jsonSpecs,
    2 : IndexFieldSpec_Spec.csvSpecs,
    0 : IndexFieldSpec_Spec.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IndexFieldSpec', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<JsonIndexSpecs>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jsonSpecs', protoName: 'jsonSpecs', subBuilder: JsonIndexSpecs.create)
    ..aOM<CsvIndexSpecs>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'csvSpecs', protoName: 'csvSpecs', subBuilder: CsvIndexSpecs.create)
    ..hasRequiredFields = false
  ;

  IndexFieldSpec._() : super();
  factory IndexFieldSpec({
    JsonIndexSpecs? jsonSpecs,
    CsvIndexSpecs? csvSpecs,
  }) {
    final _result = create();
    if (jsonSpecs != null) {
      _result.jsonSpecs = jsonSpecs;
    }
    if (csvSpecs != null) {
      _result.csvSpecs = csvSpecs;
    }
    return _result;
  }
  factory IndexFieldSpec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IndexFieldSpec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IndexFieldSpec clone() => IndexFieldSpec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IndexFieldSpec copyWith(void Function(IndexFieldSpec) updates) => super.copyWith((message) => updates(message as IndexFieldSpec)) as IndexFieldSpec; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IndexFieldSpec create() => IndexFieldSpec._();
  IndexFieldSpec createEmptyInstance() => create();
  static $pb.PbList<IndexFieldSpec> createRepeated() => $pb.PbList<IndexFieldSpec>();
  @$core.pragma('dart2js:noInline')
  static IndexFieldSpec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IndexFieldSpec>(create);
  static IndexFieldSpec? _defaultInstance;

  IndexFieldSpec_Spec whichSpec() => _IndexFieldSpec_SpecByTag[$_whichOneof(0)]!;
  void clearSpec() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  JsonIndexSpecs get jsonSpecs => $_getN(0);
  @$pb.TagNumber(1)
  set jsonSpecs(JsonIndexSpecs v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasJsonSpecs() => $_has(0);
  @$pb.TagNumber(1)
  void clearJsonSpecs() => clearField(1);
  @$pb.TagNumber(1)
  JsonIndexSpecs ensureJsonSpecs() => $_ensure(0);

  @$pb.TagNumber(2)
  CsvIndexSpecs get csvSpecs => $_getN(1);
  @$pb.TagNumber(2)
  set csvSpecs(CsvIndexSpecs v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCsvSpecs() => $_has(1);
  @$pb.TagNumber(2)
  void clearCsvSpecs() => clearField(2);
  @$pb.TagNumber(2)
  CsvIndexSpecs ensureCsvSpecs() => $_ensure(1);
}

class CsvIndexSpecs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CsvIndexSpecs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..pc<CsvIndexSpec>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'specs', $pb.PbFieldType.PM, subBuilder: CsvIndexSpec.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'separatorChar', $pb.PbFieldType.OU3, protoName: 'separatorChar')
    ..aOM<$8.UInt32Value>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'quoteChar', protoName: 'quoteChar', subBuilder: $8.UInt32Value.create)
    ..hasRequiredFields = false
  ;

  CsvIndexSpecs._() : super();
  factory CsvIndexSpecs({
    $core.Iterable<CsvIndexSpec>? specs,
    $core.int? separatorChar,
    $8.UInt32Value? quoteChar,
  }) {
    final _result = create();
    if (specs != null) {
      _result.specs.addAll(specs);
    }
    if (separatorChar != null) {
      _result.separatorChar = separatorChar;
    }
    if (quoteChar != null) {
      _result.quoteChar = quoteChar;
    }
    return _result;
  }
  factory CsvIndexSpecs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CsvIndexSpecs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CsvIndexSpecs clone() => CsvIndexSpecs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CsvIndexSpecs copyWith(void Function(CsvIndexSpecs) updates) => super.copyWith((message) => updates(message as CsvIndexSpecs)) as CsvIndexSpecs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CsvIndexSpecs create() => CsvIndexSpecs._();
  CsvIndexSpecs createEmptyInstance() => create();
  static $pb.PbList<CsvIndexSpecs> createRepeated() => $pb.PbList<CsvIndexSpecs>();
  @$core.pragma('dart2js:noInline')
  static CsvIndexSpecs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CsvIndexSpecs>(create);
  static CsvIndexSpecs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<CsvIndexSpec> get specs => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get separatorChar => $_getIZ(1);
  @$pb.TagNumber(2)
  set separatorChar($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSeparatorChar() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeparatorChar() => clearField(2);

  @$pb.TagNumber(3)
  $8.UInt32Value get quoteChar => $_getN(2);
  @$pb.TagNumber(3)
  set quoteChar($8.UInt32Value v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuoteChar() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuoteChar() => clearField(3);
  @$pb.TagNumber(3)
  $8.UInt32Value ensureQuoteChar() => $_ensure(2);
}

class CsvIndexSpec extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CsvIndexSpec', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldIndex', $pb.PbFieldType.OU3, protoName: 'fieldIndex')
    ..e<SortOrder>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sortOrder', $pb.PbFieldType.OE, protoName: 'sortOrder', defaultOrMaker: SortOrder.ASCENDING, valueOf: SortOrder.valueOf, enumValues: SortOrder.values)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isNumeric', protoName: 'isNumeric')
    ..hasRequiredFields = false
  ;

  CsvIndexSpec._() : super();
  factory CsvIndexSpec({
    $core.int? fieldIndex,
    SortOrder? sortOrder,
    $core.bool? isNumeric,
  }) {
    final _result = create();
    if (fieldIndex != null) {
      _result.fieldIndex = fieldIndex;
    }
    if (sortOrder != null) {
      _result.sortOrder = sortOrder;
    }
    if (isNumeric != null) {
      _result.isNumeric = isNumeric;
    }
    return _result;
  }
  factory CsvIndexSpec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CsvIndexSpec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CsvIndexSpec clone() => CsvIndexSpec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CsvIndexSpec copyWith(void Function(CsvIndexSpec) updates) => super.copyWith((message) => updates(message as CsvIndexSpec)) as CsvIndexSpec; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CsvIndexSpec create() => CsvIndexSpec._();
  CsvIndexSpec createEmptyInstance() => create();
  static $pb.PbList<CsvIndexSpec> createRepeated() => $pb.PbList<CsvIndexSpec>();
  @$core.pragma('dart2js:noInline')
  static CsvIndexSpec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CsvIndexSpec>(create);
  static CsvIndexSpec? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fieldIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set fieldIndex($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFieldIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldIndex() => clearField(1);

  @$pb.TagNumber(2)
  SortOrder get sortOrder => $_getN(1);
  @$pb.TagNumber(2)
  set sortOrder(SortOrder v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSortOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearSortOrder() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isNumeric => $_getBF(2);
  @$pb.TagNumber(3)
  set isNumeric($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsNumeric() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsNumeric() => clearField(3);
}

class JsonIndexSpecs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'JsonIndexSpecs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..pc<JsonIndexSpec>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'specs', $pb.PbFieldType.PM, subBuilder: JsonIndexSpec.create)
    ..hasRequiredFields = false
  ;

  JsonIndexSpecs._() : super();
  factory JsonIndexSpecs({
    $core.Iterable<JsonIndexSpec>? specs,
  }) {
    final _result = create();
    if (specs != null) {
      _result.specs.addAll(specs);
    }
    return _result;
  }
  factory JsonIndexSpecs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JsonIndexSpecs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JsonIndexSpecs clone() => JsonIndexSpecs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JsonIndexSpecs copyWith(void Function(JsonIndexSpecs) updates) => super.copyWith((message) => updates(message as JsonIndexSpecs)) as JsonIndexSpecs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JsonIndexSpecs create() => JsonIndexSpecs._();
  JsonIndexSpecs createEmptyInstance() => create();
  static $pb.PbList<JsonIndexSpecs> createRepeated() => $pb.PbList<JsonIndexSpecs>();
  @$core.pragma('dart2js:noInline')
  static JsonIndexSpecs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JsonIndexSpecs>(create);
  static JsonIndexSpecs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<JsonIndexSpec> get specs => $_getList(0);
}

class JsonIndexSpec extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'JsonIndexSpec', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jsonPath', protoName: 'jsonPath')
    ..e<SortOrder>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sortOrder', $pb.PbFieldType.OE, protoName: 'sortOrder', defaultOrMaker: SortOrder.ASCENDING, valueOf: SortOrder.valueOf, enumValues: SortOrder.values)
    ..hasRequiredFields = false
  ;

  JsonIndexSpec._() : super();
  factory JsonIndexSpec({
    $core.String? jsonPath,
    SortOrder? sortOrder,
  }) {
    final _result = create();
    if (jsonPath != null) {
      _result.jsonPath = jsonPath;
    }
    if (sortOrder != null) {
      _result.sortOrder = sortOrder;
    }
    return _result;
  }
  factory JsonIndexSpec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JsonIndexSpec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JsonIndexSpec clone() => JsonIndexSpec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JsonIndexSpec copyWith(void Function(JsonIndexSpec) updates) => super.copyWith((message) => updates(message as JsonIndexSpec)) as JsonIndexSpec; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JsonIndexSpec create() => JsonIndexSpec._();
  JsonIndexSpec createEmptyInstance() => create();
  static $pb.PbList<JsonIndexSpec> createRepeated() => $pb.PbList<JsonIndexSpec>();
  @$core.pragma('dart2js:noInline')
  static JsonIndexSpec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JsonIndexSpec>(create);
  static JsonIndexSpec? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jsonPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set jsonPath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJsonPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearJsonPath() => clearField(1);

  @$pb.TagNumber(2)
  SortOrder get sortOrder => $_getN(1);
  @$pb.TagNumber(2)
  set sortOrder(SortOrder v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSortOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearSortOrder() => clearField(2);
}

enum IndexFilter_Filter {
  regexIndexFilter, 
  notSet
}

class IndexFilter extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, IndexFilter_Filter> _IndexFilter_FilterByTag = {
    1 : IndexFilter_Filter.regexIndexFilter,
    0 : IndexFilter_Filter.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IndexFilter', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'regexIndexFilter', protoName: 'regexIndexFilter')
    ..hasRequiredFields = false
  ;

  IndexFilter._() : super();
  factory IndexFilter({
    $core.String? regexIndexFilter,
  }) {
    final _result = create();
    if (regexIndexFilter != null) {
      _result.regexIndexFilter = regexIndexFilter;
    }
    return _result;
  }
  factory IndexFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IndexFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IndexFilter clone() => IndexFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IndexFilter copyWith(void Function(IndexFilter) updates) => super.copyWith((message) => updates(message as IndexFilter)) as IndexFilter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IndexFilter create() => IndexFilter._();
  IndexFilter createEmptyInstance() => create();
  static $pb.PbList<IndexFilter> createRepeated() => $pb.PbList<IndexFilter>();
  @$core.pragma('dart2js:noInline')
  static IndexFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IndexFilter>(create);
  static IndexFilter? _defaultInstance;

  IndexFilter_Filter whichFilter() => _IndexFilter_FilterByTag[$_whichOneof(0)]!;
  void clearFilter() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get regexIndexFilter => $_getSZ(0);
  @$pb.TagNumber(1)
  set regexIndexFilter($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegexIndexFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegexIndexFilter() => clearField(1);
}

class TransactionReceipt extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransactionReceipt', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..aOM<$22.IoTransaction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transaction', subBuilder: $22.IoTransaction.create)
    ..aOM<ConfidenceFactor>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confidenceFactor', protoName: 'confidenceFactor', subBuilder: ConfidenceFactor.create)
    ..aOM<$2.BlockId>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blockId', protoName: 'blockId', subBuilder: $2.BlockId.create)
    ..aOM<ChainDistance>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'depth', subBuilder: ChainDistance.create)
    ..hasRequiredFields = false
  ;

  TransactionReceipt._() : super();
  factory TransactionReceipt({
    $22.IoTransaction? transaction,
    ConfidenceFactor? confidenceFactor,
    $2.BlockId? blockId,
    ChainDistance? depth,
  }) {
    final _result = create();
    if (transaction != null) {
      _result.transaction = transaction;
    }
    if (confidenceFactor != null) {
      _result.confidenceFactor = confidenceFactor;
    }
    if (blockId != null) {
      _result.blockId = blockId;
    }
    if (depth != null) {
      _result.depth = depth;
    }
    return _result;
  }
  factory TransactionReceipt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionReceipt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionReceipt clone() => TransactionReceipt()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionReceipt copyWith(void Function(TransactionReceipt) updates) => super.copyWith((message) => updates(message as TransactionReceipt)) as TransactionReceipt; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionReceipt create() => TransactionReceipt._();
  TransactionReceipt createEmptyInstance() => create();
  static $pb.PbList<TransactionReceipt> createRepeated() => $pb.PbList<TransactionReceipt>();
  @$core.pragma('dart2js:noInline')
  static TransactionReceipt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionReceipt>(create);
  static TransactionReceipt? _defaultInstance;

  @$pb.TagNumber(1)
  $22.IoTransaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction($22.IoTransaction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => clearField(1);
  @$pb.TagNumber(1)
  $22.IoTransaction ensureTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  ConfidenceFactor get confidenceFactor => $_getN(1);
  @$pb.TagNumber(2)
  set confidenceFactor(ConfidenceFactor v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasConfidenceFactor() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfidenceFactor() => clearField(2);
  @$pb.TagNumber(2)
  ConfidenceFactor ensureConfidenceFactor() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.BlockId get blockId => $_getN(2);
  @$pb.TagNumber(3)
  set blockId($2.BlockId v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlockId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockId() => clearField(3);
  @$pb.TagNumber(3)
  $2.BlockId ensureBlockId() => $_ensure(2);

  @$pb.TagNumber(4)
  ChainDistance get depth => $_getN(3);
  @$pb.TagNumber(4)
  set depth(ChainDistance v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDepth() => $_has(3);
  @$pb.TagNumber(4)
  void clearDepth() => clearField(4);
  @$pb.TagNumber(4)
  ChainDistance ensureDepth() => $_ensure(3);
}

class HeightData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HeightData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height')
    ..aOM<BlockData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blockData', protoName: 'blockData', subBuilder: BlockData.create)
    ..hasRequiredFields = false
  ;

  HeightData._() : super();
  factory HeightData({
    $fixnum.Int64? height,
    BlockData? blockData,
  }) {
    final _result = create();
    if (height != null) {
      _result.height = height;
    }
    if (blockData != null) {
      _result.blockData = blockData;
    }
    return _result;
  }
  factory HeightData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeightData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HeightData clone() => HeightData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HeightData copyWith(void Function(HeightData) updates) => super.copyWith((message) => updates(message as HeightData)) as HeightData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeightData create() => HeightData._();
  HeightData createEmptyInstance() => create();
  static $pb.PbList<HeightData> createRepeated() => $pb.PbList<HeightData>();
  @$core.pragma('dart2js:noInline')
  static HeightData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HeightData>(create);
  static HeightData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get height => $_getI64(0);
  @$pb.TagNumber(1)
  set height($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeight() => clearField(1);

  @$pb.TagNumber(2)
  BlockData get blockData => $_getN(1);
  @$pb.TagNumber(2)
  set blockData(BlockData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockData() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockData() => clearField(2);
  @$pb.TagNumber(2)
  BlockData ensureBlockData() => $_ensure(1);
}

class BlockData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BlockData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.genus.services'), createEmptyInstance: create)
    ..aOM<$23.BlockHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: $23.BlockHeader.create)
    ..aOM<$25.BlockBody>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body', subBuilder: $25.BlockBody.create)
    ..pc<$22.IoTransaction>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactions', $pb.PbFieldType.PM, subBuilder: $22.IoTransaction.create)
    ..hasRequiredFields = false
  ;

  BlockData._() : super();
  factory BlockData({
    $23.BlockHeader? header,
    $25.BlockBody? body,
    $core.Iterable<$22.IoTransaction>? transactions,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (body != null) {
      _result.body = body;
    }
    if (transactions != null) {
      _result.transactions.addAll(transactions);
    }
    return _result;
  }
  factory BlockData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockData clone() => BlockData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockData copyWith(void Function(BlockData) updates) => super.copyWith((message) => updates(message as BlockData)) as BlockData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockData create() => BlockData._();
  BlockData createEmptyInstance() => create();
  static $pb.PbList<BlockData> createRepeated() => $pb.PbList<BlockData>();
  @$core.pragma('dart2js:noInline')
  static BlockData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockData>(create);
  static BlockData? _defaultInstance;

  @$pb.TagNumber(1)
  $23.BlockHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header($23.BlockHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  $23.BlockHeader ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  $25.BlockBody get body => $_getN(1);
  @$pb.TagNumber(2)
  set body($25.BlockBody v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => clearField(2);
  @$pb.TagNumber(2)
  $25.BlockBody ensureBody() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$22.IoTransaction> get transactions => $_getList(2);
}

