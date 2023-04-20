///
//  Generated code. Do not modify.
//  source: brambl/models/transaction/unspent_transaction_output.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../address.pb.dart' as $11;
import '../box/value.pb.dart' as $16;

class UnspentTransactionOutput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnspentTransactionOutput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.transaction'), createEmptyInstance: create)
    ..aOM<$11.LockAddress>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: $11.LockAddress.create)
    ..aOM<$16.Value>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', subBuilder: $16.Value.create)
    ..hasRequiredFields = false
  ;

  UnspentTransactionOutput._() : super();
  factory UnspentTransactionOutput({
    $11.LockAddress? address,
    $16.Value? value,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory UnspentTransactionOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnspentTransactionOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnspentTransactionOutput clone() => UnspentTransactionOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnspentTransactionOutput copyWith(void Function(UnspentTransactionOutput) updates) => super.copyWith((message) => updates(message as UnspentTransactionOutput)) as UnspentTransactionOutput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnspentTransactionOutput create() => UnspentTransactionOutput._();
  UnspentTransactionOutput createEmptyInstance() => create();
  static $pb.PbList<UnspentTransactionOutput> createRepeated() => $pb.PbList<UnspentTransactionOutput>();
  @$core.pragma('dart2js:noInline')
  static UnspentTransactionOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnspentTransactionOutput>(create);
  static UnspentTransactionOutput? _defaultInstance;

  @$pb.TagNumber(1)
  $11.LockAddress get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($11.LockAddress v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
  @$pb.TagNumber(1)
  $11.LockAddress ensureAddress() => $_ensure(0);

  @$pb.TagNumber(2)
  $16.Value get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($16.Value v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  $16.Value ensureValue() => $_ensure(1);
}

