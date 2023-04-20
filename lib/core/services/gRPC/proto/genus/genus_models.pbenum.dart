///
//  Generated code. Do not modify.
//  source: genus/genus_models.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class TxoState extends $pb.ProtobufEnum {
  static const TxoState SPENT = TxoState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SPENT');
  static const TxoState UNSPENT = TxoState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNSPENT');
  static const TxoState PENDING = TxoState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PENDING');

  static const $core.List<TxoState> values = <TxoState> [
    SPENT,
    UNSPENT,
    PENDING,
  ];

  static final $core.Map<$core.int, TxoState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TxoState? valueOf($core.int value) => _byValue[value];

  const TxoState._($core.int v, $core.String n) : super(v, n);
}

class SortOrder extends $pb.ProtobufEnum {
  static const SortOrder ASCENDING = SortOrder._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASCENDING');
  static const SortOrder DESCENDING = SortOrder._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DESCENDING');
  static const SortOrder UNSORTED = SortOrder._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNSORTED');

  static const $core.List<SortOrder> values = <SortOrder> [
    ASCENDING,
    DESCENDING,
    UNSORTED,
  ];

  static final $core.Map<$core.int, SortOrder> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SortOrder? valueOf($core.int value) => _byValue[value];

  const SortOrder._($core.int v, $core.String n) : super(v, n);
}

class LabelType extends $pb.ProtobufEnum {
  static const LabelType EMPTY = LabelType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EMPTY');
  static const LabelType LVL = LabelType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LVL');
  static const LabelType TOPL = LabelType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TOPL');
  static const LabelType V1 = LabelType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'V1');
  static const LabelType TAM2 = LabelType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TAM2');

  static const $core.List<LabelType> values = <LabelType> [
    EMPTY,
    LVL,
    TOPL,
    V1,
    TAM2,
  ];

  static final $core.Map<$core.int, LabelType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LabelType? valueOf($core.int value) => _byValue[value];

  const LabelType._($core.int v, $core.String n) : super(v, n);
}

