///
//  Generated code. Do not modify.
//  source: brambl/models/event.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'transaction/schedule.pb.dart' as $17;
import '../../quivr/models/shared.pb.dart' as $6;

class Event_Eon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Event.Eon', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beginSlot', $pb.PbFieldType.OU6, protoName: 'beginSlot', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Event_Eon._() : super();
  factory Event_Eon({
    $fixnum.Int64? beginSlot,
    $fixnum.Int64? height,
  }) {
    final _result = create();
    if (beginSlot != null) {
      _result.beginSlot = beginSlot;
    }
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory Event_Eon.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event_Eon.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event_Eon clone() => Event_Eon()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event_Eon copyWith(void Function(Event_Eon) updates) => super.copyWith((message) => updates(message as Event_Eon)) as Event_Eon; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event_Eon create() => Event_Eon._();
  Event_Eon createEmptyInstance() => create();
  static $pb.PbList<Event_Eon> createRepeated() => $pb.PbList<Event_Eon>();
  @$core.pragma('dart2js:noInline')
  static Event_Eon getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event_Eon>(create);
  static Event_Eon? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get beginSlot => $_getI64(0);
  @$pb.TagNumber(1)
  set beginSlot($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBeginSlot() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeginSlot() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get height => $_getI64(1);
  @$pb.TagNumber(2)
  set height($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);
}

class Event_Era extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Event.Era', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beginSlot', $pb.PbFieldType.OU6, protoName: 'beginSlot', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Event_Era._() : super();
  factory Event_Era({
    $fixnum.Int64? beginSlot,
    $fixnum.Int64? height,
  }) {
    final _result = create();
    if (beginSlot != null) {
      _result.beginSlot = beginSlot;
    }
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory Event_Era.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event_Era.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event_Era clone() => Event_Era()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event_Era copyWith(void Function(Event_Era) updates) => super.copyWith((message) => updates(message as Event_Era)) as Event_Era; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event_Era create() => Event_Era._();
  Event_Era createEmptyInstance() => create();
  static $pb.PbList<Event_Era> createRepeated() => $pb.PbList<Event_Era>();
  @$core.pragma('dart2js:noInline')
  static Event_Era getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event_Era>(create);
  static Event_Era? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get beginSlot => $_getI64(0);
  @$pb.TagNumber(1)
  set beginSlot($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBeginSlot() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeginSlot() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get height => $_getI64(1);
  @$pb.TagNumber(2)
  set height($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);
}

class Event_Epoch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Event.Epoch', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beginSlot', $pb.PbFieldType.OU6, protoName: 'beginSlot', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Event_Epoch._() : super();
  factory Event_Epoch({
    $fixnum.Int64? beginSlot,
    $fixnum.Int64? height,
  }) {
    final _result = create();
    if (beginSlot != null) {
      _result.beginSlot = beginSlot;
    }
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory Event_Epoch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event_Epoch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event_Epoch clone() => Event_Epoch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event_Epoch copyWith(void Function(Event_Epoch) updates) => super.copyWith((message) => updates(message as Event_Epoch)) as Event_Epoch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event_Epoch create() => Event_Epoch._();
  Event_Epoch createEmptyInstance() => create();
  static $pb.PbList<Event_Epoch> createRepeated() => $pb.PbList<Event_Epoch>();
  @$core.pragma('dart2js:noInline')
  static Event_Epoch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event_Epoch>(create);
  static Event_Epoch? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get beginSlot => $_getI64(0);
  @$pb.TagNumber(1)
  set beginSlot($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBeginSlot() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeginSlot() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get height => $_getI64(1);
  @$pb.TagNumber(2)
  set height($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);
}

class Event_Header extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Event.Header', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Event_Header._() : super();
  factory Event_Header({
    $fixnum.Int64? height,
  }) {
    final _result = create();
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory Event_Header.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event_Header.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event_Header clone() => Event_Header()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event_Header copyWith(void Function(Event_Header) updates) => super.copyWith((message) => updates(message as Event_Header)) as Event_Header; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event_Header create() => Event_Header._();
  Event_Header createEmptyInstance() => create();
  static $pb.PbList<Event_Header> createRepeated() => $pb.PbList<Event_Header>();
  @$core.pragma('dart2js:noInline')
  static Event_Header getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event_Header>(create);
  static Event_Header? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get height => $_getI64(0);
  @$pb.TagNumber(1)
  set height($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeight() => clearField(1);
}

class Event_IoTransaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Event.IoTransaction', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..aOM<$17.Schedule>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schedule', subBuilder: $17.Schedule.create)
    ..aOM<$6.SmallData>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: $6.SmallData.create)
    ..hasRequiredFields = false
  ;

  Event_IoTransaction._() : super();
  factory Event_IoTransaction({
    $17.Schedule? schedule,
    $6.SmallData? metadata,
  }) {
    final _result = create();
    if (schedule != null) {
      _result.schedule = schedule;
    }
    if (metadata != null) {
      _result.metadata = metadata;
    }
    return _result;
  }
  factory Event_IoTransaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event_IoTransaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event_IoTransaction clone() => Event_IoTransaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event_IoTransaction copyWith(void Function(Event_IoTransaction) updates) => super.copyWith((message) => updates(message as Event_IoTransaction)) as Event_IoTransaction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event_IoTransaction create() => Event_IoTransaction._();
  Event_IoTransaction createEmptyInstance() => create();
  static $pb.PbList<Event_IoTransaction> createRepeated() => $pb.PbList<Event_IoTransaction>();
  @$core.pragma('dart2js:noInline')
  static Event_IoTransaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event_IoTransaction>(create);
  static Event_IoTransaction? _defaultInstance;

  @$pb.TagNumber(1)
  $17.Schedule get schedule => $_getN(0);
  @$pb.TagNumber(1)
  set schedule($17.Schedule v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSchedule() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchedule() => clearField(1);
  @$pb.TagNumber(1)
  $17.Schedule ensureSchedule() => $_ensure(0);

  @$pb.TagNumber(4)
  $6.SmallData get metadata => $_getN(1);
  @$pb.TagNumber(4)
  set metadata($6.SmallData v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMetadata() => $_has(1);
  @$pb.TagNumber(4)
  void clearMetadata() => clearField(4);
  @$pb.TagNumber(4)
  $6.SmallData ensureMetadata() => $_ensure(1);
}

enum Event_Value {
  eon, 
  era, 
  epoch, 
  header, 
  ioTransaction, 
  notSet
}

class Event extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Event_Value> _Event_ValueByTag = {
    1 : Event_Value.eon,
    2 : Event_Value.era,
    3 : Event_Value.epoch,
    4 : Event_Value.header,
    5 : Event_Value.ioTransaction,
    0 : Event_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Event', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<Event_Eon>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eon', subBuilder: Event_Eon.create)
    ..aOM<Event_Era>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'era', subBuilder: Event_Era.create)
    ..aOM<Event_Epoch>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'epoch', subBuilder: Event_Epoch.create)
    ..aOM<Event_Header>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: Event_Header.create)
    ..aOM<Event_IoTransaction>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ioTransaction', protoName: 'ioTransaction', subBuilder: Event_IoTransaction.create)
    ..hasRequiredFields = false
  ;

  Event._() : super();
  factory Event({
    Event_Eon? eon,
    Event_Era? era,
    Event_Epoch? epoch,
    Event_Header? header,
    Event_IoTransaction? ioTransaction,
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
  factory Event.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event clone() => Event()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event copyWith(void Function(Event) updates) => super.copyWith((message) => updates(message as Event)) as Event; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();
  Event createEmptyInstance() => create();
  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();
  @$core.pragma('dart2js:noInline')
  static Event getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event? _defaultInstance;

  Event_Value whichValue() => _Event_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Event_Eon get eon => $_getN(0);
  @$pb.TagNumber(1)
  set eon(Event_Eon v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEon() => $_has(0);
  @$pb.TagNumber(1)
  void clearEon() => clearField(1);
  @$pb.TagNumber(1)
  Event_Eon ensureEon() => $_ensure(0);

  @$pb.TagNumber(2)
  Event_Era get era => $_getN(1);
  @$pb.TagNumber(2)
  set era(Event_Era v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEra() => $_has(1);
  @$pb.TagNumber(2)
  void clearEra() => clearField(2);
  @$pb.TagNumber(2)
  Event_Era ensureEra() => $_ensure(1);

  @$pb.TagNumber(3)
  Event_Epoch get epoch => $_getN(2);
  @$pb.TagNumber(3)
  set epoch(Event_Epoch v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEpoch() => $_has(2);
  @$pb.TagNumber(3)
  void clearEpoch() => clearField(3);
  @$pb.TagNumber(3)
  Event_Epoch ensureEpoch() => $_ensure(2);

  @$pb.TagNumber(4)
  Event_Header get header => $_getN(3);
  @$pb.TagNumber(4)
  set header(Event_Header v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeader() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeader() => clearField(4);
  @$pb.TagNumber(4)
  Event_Header ensureHeader() => $_ensure(3);

  @$pb.TagNumber(5)
  Event_IoTransaction get ioTransaction => $_getN(4);
  @$pb.TagNumber(5)
  set ioTransaction(Event_IoTransaction v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasIoTransaction() => $_has(4);
  @$pb.TagNumber(5)
  void clearIoTransaction() => clearField(5);
  @$pb.TagNumber(5)
  Event_IoTransaction ensureIoTransaction() => $_ensure(4);
}

