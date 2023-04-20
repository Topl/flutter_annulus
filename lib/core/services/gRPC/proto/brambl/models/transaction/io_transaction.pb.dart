///
//  Generated code. Do not modify.
//  source: brambl/models/transaction/io_transaction.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'spent_transaction_output.pb.dart' as $19;
import 'unspent_transaction_output.pb.dart' as $20;
import '../datum.pb.dart' as $21;

class IoTransaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IoTransaction', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.transaction'), createEmptyInstance: create)
    ..pc<$19.SpentTransactionOutput>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inputs', $pb.PbFieldType.PM, subBuilder: $19.SpentTransactionOutput.create)
    ..pc<$20.UnspentTransactionOutput>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'outputs', $pb.PbFieldType.PM, subBuilder: $20.UnspentTransactionOutput.create)
    ..aOM<$21.Datum_IoTransaction>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'datum', subBuilder: $21.Datum_IoTransaction.create)
    ..hasRequiredFields = false
  ;

  IoTransaction._() : super();
  factory IoTransaction({
    $core.Iterable<$19.SpentTransactionOutput>? inputs,
    $core.Iterable<$20.UnspentTransactionOutput>? outputs,
    $21.Datum_IoTransaction? datum,
  }) {
    final _result = create();
    if (inputs != null) {
      _result.inputs.addAll(inputs);
    }
    if (outputs != null) {
      _result.outputs.addAll(outputs);
    }
    if (datum != null) {
      _result.datum = datum;
    }
    return _result;
  }
  factory IoTransaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IoTransaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IoTransaction clone() => IoTransaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IoTransaction copyWith(void Function(IoTransaction) updates) => super.copyWith((message) => updates(message as IoTransaction)) as IoTransaction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IoTransaction create() => IoTransaction._();
  IoTransaction createEmptyInstance() => create();
  static $pb.PbList<IoTransaction> createRepeated() => $pb.PbList<IoTransaction>();
  @$core.pragma('dart2js:noInline')
  static IoTransaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IoTransaction>(create);
  static IoTransaction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$19.SpentTransactionOutput> get inputs => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$20.UnspentTransactionOutput> get outputs => $_getList(1);

  @$pb.TagNumber(3)
  $21.Datum_IoTransaction get datum => $_getN(2);
  @$pb.TagNumber(3)
  set datum($21.Datum_IoTransaction v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDatum() => $_has(2);
  @$pb.TagNumber(3)
  void clearDatum() => clearField(3);
  @$pb.TagNumber(3)
  $21.Datum_IoTransaction ensureDatum() => $_ensure(2);
}

