///
//  Generated code. Do not modify.
//  source: brambl/models/address.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/wrappers.pb.dart' as $8;
import 'identifier.pb.dart' as $9;

class Address extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Address', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'network', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledger', $pb.PbFieldType.OU3)
    ..aOM<$8.UInt32Value>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', subBuilder: $8.UInt32Value.create)
    ..aOM<$9.Identifier>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', subBuilder: $9.Identifier.create)
    ..hasRequiredFields = false
  ;

  Address._() : super();
  factory Address({
    $core.int? network,
    $core.int? ledger,
    $8.UInt32Value? index,
    $9.Identifier? id,
  }) {
    final _result = create();
    if (network != null) {
      _result.network = network;
    }
    if (ledger != null) {
      _result.ledger = ledger;
    }
    if (index != null) {
      _result.index = index;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory Address.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Address.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Address clone() => Address()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Address copyWith(void Function(Address) updates) => super.copyWith((message) => updates(message as Address)) as Address; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Address create() => Address._();
  Address createEmptyInstance() => create();
  static $pb.PbList<Address> createRepeated() => $pb.PbList<Address>();
  @$core.pragma('dart2js:noInline')
  static Address getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Address>(create);
  static Address? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get network => $_getIZ(0);
  @$pb.TagNumber(1)
  set network($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNetwork() => $_has(0);
  @$pb.TagNumber(1)
  void clearNetwork() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get ledger => $_getIZ(1);
  @$pb.TagNumber(2)
  set ledger($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedger() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedger() => clearField(2);

  @$pb.TagNumber(3)
  $8.UInt32Value get index => $_getN(2);
  @$pb.TagNumber(3)
  set index($8.UInt32Value v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);
  @$pb.TagNumber(3)
  $8.UInt32Value ensureIndex() => $_ensure(2);

  @$pb.TagNumber(4)
  $9.Identifier get id => $_getN(3);
  @$pb.TagNumber(4)
  set id($9.Identifier v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);
  @$pb.TagNumber(4)
  $9.Identifier ensureId() => $_ensure(3);
}

enum LockAddress_Id {
  lock32, 
  lock64, 
  notSet
}

class LockAddress extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, LockAddress_Id> _LockAddress_IdByTag = {
    3 : LockAddress_Id.lock32,
    4 : LockAddress_Id.lock64,
    0 : LockAddress_Id.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LockAddress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'network', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledger', $pb.PbFieldType.OU3)
    ..aOM<$9.Identifier_Lock32>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lock32', subBuilder: $9.Identifier_Lock32.create)
    ..aOM<$9.Identifier_Lock64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lock64', subBuilder: $9.Identifier_Lock64.create)
    ..hasRequiredFields = false
  ;

  LockAddress._() : super();
  factory LockAddress({
    $core.int? network,
    $core.int? ledger,
    $9.Identifier_Lock32? lock32,
    $9.Identifier_Lock64? lock64,
  }) {
    final _result = create();
    if (network != null) {
      _result.network = network;
    }
    if (ledger != null) {
      _result.ledger = ledger;
    }
    if (lock32 != null) {
      _result.lock32 = lock32;
    }
    if (lock64 != null) {
      _result.lock64 = lock64;
    }
    return _result;
  }
  factory LockAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LockAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LockAddress clone() => LockAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LockAddress copyWith(void Function(LockAddress) updates) => super.copyWith((message) => updates(message as LockAddress)) as LockAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LockAddress create() => LockAddress._();
  LockAddress createEmptyInstance() => create();
  static $pb.PbList<LockAddress> createRepeated() => $pb.PbList<LockAddress>();
  @$core.pragma('dart2js:noInline')
  static LockAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LockAddress>(create);
  static LockAddress? _defaultInstance;

  LockAddress_Id whichId() => _LockAddress_IdByTag[$_whichOneof(0)]!;
  void clearId() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get network => $_getIZ(0);
  @$pb.TagNumber(1)
  set network($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNetwork() => $_has(0);
  @$pb.TagNumber(1)
  void clearNetwork() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get ledger => $_getIZ(1);
  @$pb.TagNumber(2)
  set ledger($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedger() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedger() => clearField(2);

  @$pb.TagNumber(3)
  $9.Identifier_Lock32 get lock32 => $_getN(2);
  @$pb.TagNumber(3)
  set lock32($9.Identifier_Lock32 v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLock32() => $_has(2);
  @$pb.TagNumber(3)
  void clearLock32() => clearField(3);
  @$pb.TagNumber(3)
  $9.Identifier_Lock32 ensureLock32() => $_ensure(2);

  @$pb.TagNumber(4)
  $9.Identifier_Lock64 get lock64 => $_getN(3);
  @$pb.TagNumber(4)
  set lock64($9.Identifier_Lock64 v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLock64() => $_has(3);
  @$pb.TagNumber(4)
  void clearLock64() => clearField(4);
  @$pb.TagNumber(4)
  $9.Identifier_Lock64 ensureLock64() => $_ensure(3);
}

enum TransactionOutputAddress_Id {
  ioTransaction32, 
  ioTransaction64, 
  notSet
}

class TransactionOutputAddress extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TransactionOutputAddress_Id> _TransactionOutputAddress_IdByTag = {
    4 : TransactionOutputAddress_Id.ioTransaction32,
    5 : TransactionOutputAddress_Id.ioTransaction64,
    0 : TransactionOutputAddress_Id.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransactionOutputAddress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..oo(0, [4, 5])
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'network', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledger', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..aOM<$9.Identifier_IoTransaction32>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ioTransaction32', protoName: 'ioTransaction32', subBuilder: $9.Identifier_IoTransaction32.create)
    ..aOM<$9.Identifier_IoTransaction64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ioTransaction64', protoName: 'ioTransaction64', subBuilder: $9.Identifier_IoTransaction64.create)
    ..hasRequiredFields = false
  ;

  TransactionOutputAddress._() : super();
  factory TransactionOutputAddress({
    $core.int? network,
    $core.int? ledger,
    $core.int? index,
    $9.Identifier_IoTransaction32? ioTransaction32,
    $9.Identifier_IoTransaction64? ioTransaction64,
  }) {
    final _result = create();
    if (network != null) {
      _result.network = network;
    }
    if (ledger != null) {
      _result.ledger = ledger;
    }
    if (index != null) {
      _result.index = index;
    }
    if (ioTransaction32 != null) {
      _result.ioTransaction32 = ioTransaction32;
    }
    if (ioTransaction64 != null) {
      _result.ioTransaction64 = ioTransaction64;
    }
    return _result;
  }
  factory TransactionOutputAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionOutputAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionOutputAddress clone() => TransactionOutputAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionOutputAddress copyWith(void Function(TransactionOutputAddress) updates) => super.copyWith((message) => updates(message as TransactionOutputAddress)) as TransactionOutputAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionOutputAddress create() => TransactionOutputAddress._();
  TransactionOutputAddress createEmptyInstance() => create();
  static $pb.PbList<TransactionOutputAddress> createRepeated() => $pb.PbList<TransactionOutputAddress>();
  @$core.pragma('dart2js:noInline')
  static TransactionOutputAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionOutputAddress>(create);
  static TransactionOutputAddress? _defaultInstance;

  TransactionOutputAddress_Id whichId() => _TransactionOutputAddress_IdByTag[$_whichOneof(0)]!;
  void clearId() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get network => $_getIZ(0);
  @$pb.TagNumber(1)
  set network($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNetwork() => $_has(0);
  @$pb.TagNumber(1)
  void clearNetwork() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get ledger => $_getIZ(1);
  @$pb.TagNumber(2)
  set ledger($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedger() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedger() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(2);
  @$pb.TagNumber(3)
  set index($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);

  @$pb.TagNumber(4)
  $9.Identifier_IoTransaction32 get ioTransaction32 => $_getN(3);
  @$pb.TagNumber(4)
  set ioTransaction32($9.Identifier_IoTransaction32 v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasIoTransaction32() => $_has(3);
  @$pb.TagNumber(4)
  void clearIoTransaction32() => clearField(4);
  @$pb.TagNumber(4)
  $9.Identifier_IoTransaction32 ensureIoTransaction32() => $_ensure(3);

  @$pb.TagNumber(5)
  $9.Identifier_IoTransaction64 get ioTransaction64 => $_getN(4);
  @$pb.TagNumber(5)
  set ioTransaction64($9.Identifier_IoTransaction64 v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasIoTransaction64() => $_has(4);
  @$pb.TagNumber(5)
  void clearIoTransaction64() => clearField(5);
  @$pb.TagNumber(5)
  $9.Identifier_IoTransaction64 ensureIoTransaction64() => $_ensure(4);
}

enum TransactionInputAddress_Id {
  ioTransaction32, 
  ioTransaction64, 
  notSet
}

class TransactionInputAddress extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TransactionInputAddress_Id> _TransactionInputAddress_IdByTag = {
    4 : TransactionInputAddress_Id.ioTransaction32,
    5 : TransactionInputAddress_Id.ioTransaction64,
    0 : TransactionInputAddress_Id.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransactionInputAddress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..oo(0, [4, 5])
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'network', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledger', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..aOM<$9.Identifier_IoTransaction32>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ioTransaction32', protoName: 'ioTransaction32', subBuilder: $9.Identifier_IoTransaction32.create)
    ..aOM<$9.Identifier_IoTransaction64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ioTransaction64', protoName: 'ioTransaction64', subBuilder: $9.Identifier_IoTransaction64.create)
    ..hasRequiredFields = false
  ;

  TransactionInputAddress._() : super();
  factory TransactionInputAddress({
    $core.int? network,
    $core.int? ledger,
    $core.int? index,
    $9.Identifier_IoTransaction32? ioTransaction32,
    $9.Identifier_IoTransaction64? ioTransaction64,
  }) {
    final _result = create();
    if (network != null) {
      _result.network = network;
    }
    if (ledger != null) {
      _result.ledger = ledger;
    }
    if (index != null) {
      _result.index = index;
    }
    if (ioTransaction32 != null) {
      _result.ioTransaction32 = ioTransaction32;
    }
    if (ioTransaction64 != null) {
      _result.ioTransaction64 = ioTransaction64;
    }
    return _result;
  }
  factory TransactionInputAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionInputAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionInputAddress clone() => TransactionInputAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionInputAddress copyWith(void Function(TransactionInputAddress) updates) => super.copyWith((message) => updates(message as TransactionInputAddress)) as TransactionInputAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionInputAddress create() => TransactionInputAddress._();
  TransactionInputAddress createEmptyInstance() => create();
  static $pb.PbList<TransactionInputAddress> createRepeated() => $pb.PbList<TransactionInputAddress>();
  @$core.pragma('dart2js:noInline')
  static TransactionInputAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionInputAddress>(create);
  static TransactionInputAddress? _defaultInstance;

  TransactionInputAddress_Id whichId() => _TransactionInputAddress_IdByTag[$_whichOneof(0)]!;
  void clearId() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get network => $_getIZ(0);
  @$pb.TagNumber(1)
  set network($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNetwork() => $_has(0);
  @$pb.TagNumber(1)
  void clearNetwork() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get ledger => $_getIZ(1);
  @$pb.TagNumber(2)
  set ledger($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedger() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedger() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(2);
  @$pb.TagNumber(3)
  set index($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);

  @$pb.TagNumber(4)
  $9.Identifier_IoTransaction32 get ioTransaction32 => $_getN(3);
  @$pb.TagNumber(4)
  set ioTransaction32($9.Identifier_IoTransaction32 v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasIoTransaction32() => $_has(3);
  @$pb.TagNumber(4)
  void clearIoTransaction32() => clearField(4);
  @$pb.TagNumber(4)
  $9.Identifier_IoTransaction32 ensureIoTransaction32() => $_ensure(3);

  @$pb.TagNumber(5)
  $9.Identifier_IoTransaction64 get ioTransaction64 => $_getN(4);
  @$pb.TagNumber(5)
  set ioTransaction64($9.Identifier_IoTransaction64 v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasIoTransaction64() => $_has(4);
  @$pb.TagNumber(5)
  void clearIoTransaction64() => clearField(5);
  @$pb.TagNumber(5)
  $9.Identifier_IoTransaction64 ensureIoTransaction64() => $_ensure(4);
}

