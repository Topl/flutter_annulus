///
//  Generated code. Do not modify.
//  source: brambl/models/transaction/spent_transaction_output.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../address.pb.dart' as $11;
import '../box/attestation.pb.dart' as $15;
import '../box/value.pb.dart' as $16;

class SpentTransactionOutput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SpentTransactionOutput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.transaction'), createEmptyInstance: create)
    ..aOM<$11.TransactionOutputAddress>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: $11.TransactionOutputAddress.create)
    ..aOM<$15.Attestation>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attestation', subBuilder: $15.Attestation.create)
    ..aOM<$16.Value>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', subBuilder: $16.Value.create)
    ..hasRequiredFields = false
  ;

  SpentTransactionOutput._() : super();
  factory SpentTransactionOutput({
    $11.TransactionOutputAddress? address,
    $15.Attestation? attestation,
    $16.Value? value,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    if (attestation != null) {
      _result.attestation = attestation;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory SpentTransactionOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SpentTransactionOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SpentTransactionOutput clone() => SpentTransactionOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SpentTransactionOutput copyWith(void Function(SpentTransactionOutput) updates) => super.copyWith((message) => updates(message as SpentTransactionOutput)) as SpentTransactionOutput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpentTransactionOutput create() => SpentTransactionOutput._();
  SpentTransactionOutput createEmptyInstance() => create();
  static $pb.PbList<SpentTransactionOutput> createRepeated() => $pb.PbList<SpentTransactionOutput>();
  @$core.pragma('dart2js:noInline')
  static SpentTransactionOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpentTransactionOutput>(create);
  static SpentTransactionOutput? _defaultInstance;

  @$pb.TagNumber(1)
  $11.TransactionOutputAddress get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($11.TransactionOutputAddress v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
  @$pb.TagNumber(1)
  $11.TransactionOutputAddress ensureAddress() => $_ensure(0);

  @$pb.TagNumber(2)
  $15.Attestation get attestation => $_getN(1);
  @$pb.TagNumber(2)
  set attestation($15.Attestation v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAttestation() => $_has(1);
  @$pb.TagNumber(2)
  void clearAttestation() => clearField(2);
  @$pb.TagNumber(2)
  $15.Attestation ensureAttestation() => $_ensure(1);

  @$pb.TagNumber(3)
  $16.Value get value => $_getN(2);
  @$pb.TagNumber(3)
  set value($16.Value v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
  @$pb.TagNumber(3)
  $16.Value ensureValue() => $_ensure(2);
}

