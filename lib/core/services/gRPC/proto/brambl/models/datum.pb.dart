///
//  Generated code. Do not modify.
//  source: brambl/models/datum.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'event.pb.dart' as $18;

class Datum_Eon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Datum.Eon', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$18.Event_Eon>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: $18.Event_Eon.create)
    ..hasRequiredFields = false
  ;

  Datum_Eon._() : super();
  factory Datum_Eon({
    $18.Event_Eon? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory Datum_Eon.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Datum_Eon.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Datum_Eon clone() => Datum_Eon()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Datum_Eon copyWith(void Function(Datum_Eon) updates) => super.copyWith((message) => updates(message as Datum_Eon)) as Datum_Eon; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Datum_Eon create() => Datum_Eon._();
  Datum_Eon createEmptyInstance() => create();
  static $pb.PbList<Datum_Eon> createRepeated() => $pb.PbList<Datum_Eon>();
  @$core.pragma('dart2js:noInline')
  static Datum_Eon getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Datum_Eon>(create);
  static Datum_Eon? _defaultInstance;

  @$pb.TagNumber(1)
  $18.Event_Eon get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($18.Event_Eon v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $18.Event_Eon ensureEvent() => $_ensure(0);
}

class Datum_Era extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Datum.Era', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$18.Event_Era>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: $18.Event_Era.create)
    ..hasRequiredFields = false
  ;

  Datum_Era._() : super();
  factory Datum_Era({
    $18.Event_Era? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory Datum_Era.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Datum_Era.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Datum_Era clone() => Datum_Era()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Datum_Era copyWith(void Function(Datum_Era) updates) => super.copyWith((message) => updates(message as Datum_Era)) as Datum_Era; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Datum_Era create() => Datum_Era._();
  Datum_Era createEmptyInstance() => create();
  static $pb.PbList<Datum_Era> createRepeated() => $pb.PbList<Datum_Era>();
  @$core.pragma('dart2js:noInline')
  static Datum_Era getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Datum_Era>(create);
  static Datum_Era? _defaultInstance;

  @$pb.TagNumber(1)
  $18.Event_Era get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($18.Event_Era v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $18.Event_Era ensureEvent() => $_ensure(0);
}

class Datum_Epoch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Datum.Epoch', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$18.Event_Epoch>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: $18.Event_Epoch.create)
    ..hasRequiredFields = false
  ;

  Datum_Epoch._() : super();
  factory Datum_Epoch({
    $18.Event_Epoch? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory Datum_Epoch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Datum_Epoch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Datum_Epoch clone() => Datum_Epoch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Datum_Epoch copyWith(void Function(Datum_Epoch) updates) => super.copyWith((message) => updates(message as Datum_Epoch)) as Datum_Epoch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Datum_Epoch create() => Datum_Epoch._();
  Datum_Epoch createEmptyInstance() => create();
  static $pb.PbList<Datum_Epoch> createRepeated() => $pb.PbList<Datum_Epoch>();
  @$core.pragma('dart2js:noInline')
  static Datum_Epoch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Datum_Epoch>(create);
  static Datum_Epoch? _defaultInstance;

  @$pb.TagNumber(1)
  $18.Event_Epoch get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($18.Event_Epoch v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $18.Event_Epoch ensureEvent() => $_ensure(0);
}

class Datum_Header extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Datum.Header', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$18.Event_Header>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: $18.Event_Header.create)
    ..hasRequiredFields = false
  ;

  Datum_Header._() : super();
  factory Datum_Header({
    $18.Event_Header? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory Datum_Header.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Datum_Header.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Datum_Header clone() => Datum_Header()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Datum_Header copyWith(void Function(Datum_Header) updates) => super.copyWith((message) => updates(message as Datum_Header)) as Datum_Header; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Datum_Header create() => Datum_Header._();
  Datum_Header createEmptyInstance() => create();
  static $pb.PbList<Datum_Header> createRepeated() => $pb.PbList<Datum_Header>();
  @$core.pragma('dart2js:noInline')
  static Datum_Header getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Datum_Header>(create);
  static Datum_Header? _defaultInstance;

  @$pb.TagNumber(1)
  $18.Event_Header get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($18.Event_Header v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $18.Event_Header ensureEvent() => $_ensure(0);
}

class Datum_IoTransaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Datum.IoTransaction', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$18.Event_IoTransaction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: $18.Event_IoTransaction.create)
    ..hasRequiredFields = false
  ;

  Datum_IoTransaction._() : super();
  factory Datum_IoTransaction({
    $18.Event_IoTransaction? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory Datum_IoTransaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Datum_IoTransaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Datum_IoTransaction clone() => Datum_IoTransaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Datum_IoTransaction copyWith(void Function(Datum_IoTransaction) updates) => super.copyWith((message) => updates(message as Datum_IoTransaction)) as Datum_IoTransaction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Datum_IoTransaction create() => Datum_IoTransaction._();
  Datum_IoTransaction createEmptyInstance() => create();
  static $pb.PbList<Datum_IoTransaction> createRepeated() => $pb.PbList<Datum_IoTransaction>();
  @$core.pragma('dart2js:noInline')
  static Datum_IoTransaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Datum_IoTransaction>(create);
  static Datum_IoTransaction? _defaultInstance;

  @$pb.TagNumber(1)
  $18.Event_IoTransaction get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($18.Event_IoTransaction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $18.Event_IoTransaction ensureEvent() => $_ensure(0);
}

enum Datum_Value {
  eon, 
  era, 
  epoch, 
  header, 
  ioTransaction, 
  notSet
}

class Datum extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Datum_Value> _Datum_ValueByTag = {
    1 : Datum_Value.eon,
    2 : Datum_Value.era,
    3 : Datum_Value.epoch,
    4 : Datum_Value.header,
    5 : Datum_Value.ioTransaction,
    0 : Datum_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Datum', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<Datum_Eon>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eon', subBuilder: Datum_Eon.create)
    ..aOM<Datum_Era>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'era', subBuilder: Datum_Era.create)
    ..aOM<Datum_Epoch>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'epoch', subBuilder: Datum_Epoch.create)
    ..aOM<Datum_Header>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: Datum_Header.create)
    ..aOM<Datum_IoTransaction>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ioTransaction', protoName: 'ioTransaction', subBuilder: Datum_IoTransaction.create)
    ..hasRequiredFields = false
  ;

  Datum._() : super();
  factory Datum({
    Datum_Eon? eon,
    Datum_Era? era,
    Datum_Epoch? epoch,
    Datum_Header? header,
    Datum_IoTransaction? ioTransaction,
  }) {
    final _result = create();
    if (eon != null) {
      _result.eon = eon;
    }
    if (era != null) {
      _result.era = era;
    }
    if (epoch != null) {
      _result.epoch = epoch;
    }
    if (header != null) {
      _result.header = header;
    }
    if (ioTransaction != null) {
      _result.ioTransaction = ioTransaction;
    }
    return _result;
  }
  factory Datum.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Datum.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Datum clone() => Datum()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Datum copyWith(void Function(Datum) updates) => super.copyWith((message) => updates(message as Datum)) as Datum; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Datum create() => Datum._();
  Datum createEmptyInstance() => create();
  static $pb.PbList<Datum> createRepeated() => $pb.PbList<Datum>();
  @$core.pragma('dart2js:noInline')
  static Datum getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Datum>(create);
  static Datum? _defaultInstance;

  Datum_Value whichValue() => _Datum_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Datum_Eon get eon => $_getN(0);
  @$pb.TagNumber(1)
  set eon(Datum_Eon v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEon() => $_has(0);
  @$pb.TagNumber(1)
  void clearEon() => clearField(1);
  @$pb.TagNumber(1)
  Datum_Eon ensureEon() => $_ensure(0);

  @$pb.TagNumber(2)
  Datum_Era get era => $_getN(1);
  @$pb.TagNumber(2)
  set era(Datum_Era v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEra() => $_has(1);
  @$pb.TagNumber(2)
  void clearEra() => clearField(2);
  @$pb.TagNumber(2)
  Datum_Era ensureEra() => $_ensure(1);

  @$pb.TagNumber(3)
  Datum_Epoch get epoch => $_getN(2);
  @$pb.TagNumber(3)
  set epoch(Datum_Epoch v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEpoch() => $_has(2);
  @$pb.TagNumber(3)
  void clearEpoch() => clearField(3);
  @$pb.TagNumber(3)
  Datum_Epoch ensureEpoch() => $_ensure(2);

  @$pb.TagNumber(4)
  Datum_Header get header => $_getN(3);
  @$pb.TagNumber(4)
  set header(Datum_Header v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeader() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeader() => clearField(4);
  @$pb.TagNumber(4)
  Datum_Header ensureHeader() => $_ensure(3);

  @$pb.TagNumber(5)
  Datum_IoTransaction get ioTransaction => $_getN(4);
  @$pb.TagNumber(5)
  set ioTransaction(Datum_IoTransaction v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasIoTransaction() => $_has(4);
  @$pb.TagNumber(5)
  void clearIoTransaction() => clearField(5);
  @$pb.TagNumber(5)
  Datum_IoTransaction ensureIoTransaction() => $_ensure(4);
}

