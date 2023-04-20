///
//  Generated code. Do not modify.
//  source: brambl/models/box/challenge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../quivr/models/proposition.pb.dart' as $10;
import '../address.pb.dart' as $11;

class Challenge_PreviousProposition extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Challenge.PreviousProposition', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..aOM<$11.TransactionInputAddress>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: $11.TransactionInputAddress.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Challenge_PreviousProposition._() : super();
  factory Challenge_PreviousProposition({
    $11.TransactionInputAddress? address,
    $core.int? index,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    if (index != null) {
      _result.index = index;
    }
    return _result;
  }
  factory Challenge_PreviousProposition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Challenge_PreviousProposition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Challenge_PreviousProposition clone() => Challenge_PreviousProposition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Challenge_PreviousProposition copyWith(void Function(Challenge_PreviousProposition) updates) => super.copyWith((message) => updates(message as Challenge_PreviousProposition)) as Challenge_PreviousProposition; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Challenge_PreviousProposition create() => Challenge_PreviousProposition._();
  Challenge_PreviousProposition createEmptyInstance() => create();
  static $pb.PbList<Challenge_PreviousProposition> createRepeated() => $pb.PbList<Challenge_PreviousProposition>();
  @$core.pragma('dart2js:noInline')
  static Challenge_PreviousProposition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Challenge_PreviousProposition>(create);
  static Challenge_PreviousProposition? _defaultInstance;

  @$pb.TagNumber(1)
  $11.TransactionInputAddress get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($11.TransactionInputAddress v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
  @$pb.TagNumber(1)
  $11.TransactionInputAddress ensureAddress() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => clearField(2);
}

enum Challenge_Proposition {
  revealed, 
  previous, 
  notSet
}

class Challenge extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Challenge_Proposition> _Challenge_PropositionByTag = {
    1 : Challenge_Proposition.revealed,
    2 : Challenge_Proposition.previous,
    0 : Challenge_Proposition.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Challenge', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.brambl.models.box'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$10.Proposition>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'revealed', subBuilder: $10.Proposition.create)
    ..aOM<Challenge_PreviousProposition>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'previous', subBuilder: Challenge_PreviousProposition.create)
    ..hasRequiredFields = false
  ;

  Challenge._() : super();
  factory Challenge({
    $10.Proposition? revealed,
    Challenge_PreviousProposition? previous,
  }) {
    final _result = create();
    if (revealed != null) {
      _result.revealed = revealed;
    }
    if (previous != null) {
      _result.previous = previous;
    }
    return _result;
  }
  factory Challenge.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Challenge.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Challenge clone() => Challenge()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Challenge copyWith(void Function(Challenge) updates) => super.copyWith((message) => updates(message as Challenge)) as Challenge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Challenge create() => Challenge._();
  Challenge createEmptyInstance() => create();
  static $pb.PbList<Challenge> createRepeated() => $pb.PbList<Challenge>();
  @$core.pragma('dart2js:noInline')
  static Challenge getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Challenge>(create);
  static Challenge? _defaultInstance;

  Challenge_Proposition whichProposition() => _Challenge_PropositionByTag[$_whichOneof(0)]!;
  void clearProposition() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $10.Proposition get revealed => $_getN(0);
  @$pb.TagNumber(1)
  set revealed($10.Proposition v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRevealed() => $_has(0);
  @$pb.TagNumber(1)
  void clearRevealed() => clearField(1);
  @$pb.TagNumber(1)
  $10.Proposition ensureRevealed() => $_ensure(0);

  @$pb.TagNumber(2)
  Challenge_PreviousProposition get previous => $_getN(1);
  @$pb.TagNumber(2)
  set previous(Challenge_PreviousProposition v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrevious() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrevious() => clearField(2);
  @$pb.TagNumber(2)
  Challenge_PreviousProposition ensurePrevious() => $_ensure(1);
}

