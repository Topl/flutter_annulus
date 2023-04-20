///
//  Generated code. Do not modify.
//  source: consensus/models/block_header.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'block_id.pb.dart' as $2;
import 'eligibility_certificate.pb.dart' as $3;
import 'operational_certificate.pb.dart' as $4;
import 'staking_address.pb.dart' as $5;

class BlockHeader extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BlockHeader', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.consensus.models'), createEmptyInstance: create)
    ..aOM<$2.BlockId>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentHeaderId', protoName: 'parentHeaderId', subBuilder: $2.BlockId.create)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentSlot', $pb.PbFieldType.OU6, protoName: 'parentSlot', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'txRoot', $pb.PbFieldType.OY, protoName: 'txRoot')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bloomFilter', $pb.PbFieldType.OY, protoName: 'bloomFilter')
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slot', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$3.EligibilityCertificate>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eligibilityCertificate', protoName: 'eligibilityCertificate', subBuilder: $3.EligibilityCertificate.create)
    ..aOM<$4.OperationalCertificate>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operationalCertificate', protoName: 'operationalCertificate', subBuilder: $4.OperationalCertificate.create)
    ..a<$core.List<$core.int>>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.OY)
    ..aOM<$5.StakingAddress>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: $5.StakingAddress.create)
    ..hasRequiredFields = false
  ;

  BlockHeader._() : super();
  factory BlockHeader({
    $2.BlockId? parentHeaderId,
    $fixnum.Int64? parentSlot,
    $core.List<$core.int>? txRoot,
    $core.List<$core.int>? bloomFilter,
    $fixnum.Int64? timestamp,
    $fixnum.Int64? height,
    $fixnum.Int64? slot,
    $3.EligibilityCertificate? eligibilityCertificate,
    $4.OperationalCertificate? operationalCertificate,
    $core.List<$core.int>? metadata,
    $5.StakingAddress? address,
  }) {
    final _result = create();
    if (parentHeaderId != null) {
      _result.parentHeaderId = parentHeaderId;
    }
    if (parentSlot != null) {
      _result.parentSlot = parentSlot;
    }
    if (txRoot != null) {
      _result.txRoot = txRoot;
    }
    if (bloomFilter != null) {
      _result.bloomFilter = bloomFilter;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (height != null) {
      _result.height = height;
    }
    if (slot != null) {
      _result.slot = slot;
    }
    if (eligibilityCertificate != null) {
      _result.eligibilityCertificate = eligibilityCertificate;
    }
    if (operationalCertificate != null) {
      _result.operationalCertificate = operationalCertificate;
    }
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory BlockHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockHeader clone() => BlockHeader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockHeader copyWith(void Function(BlockHeader) updates) => super.copyWith((message) => updates(message as BlockHeader)) as BlockHeader; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockHeader create() => BlockHeader._();
  BlockHeader createEmptyInstance() => create();
  static $pb.PbList<BlockHeader> createRepeated() => $pb.PbList<BlockHeader>();
  @$core.pragma('dart2js:noInline')
  static BlockHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockHeader>(create);
  static BlockHeader? _defaultInstance;

  @$pb.TagNumber(1)
  $2.BlockId get parentHeaderId => $_getN(0);
  @$pb.TagNumber(1)
  set parentHeaderId($2.BlockId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParentHeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentHeaderId() => clearField(1);
  @$pb.TagNumber(1)
  $2.BlockId ensureParentHeaderId() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get parentSlot => $_getI64(1);
  @$pb.TagNumber(2)
  set parentSlot($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentSlot() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentSlot() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get txRoot => $_getN(2);
  @$pb.TagNumber(3)
  set txRoot($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTxRoot() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxRoot() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get bloomFilter => $_getN(3);
  @$pb.TagNumber(4)
  set bloomFilter($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBloomFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearBloomFilter() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get timestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set timestamp($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get height => $_getI64(5);
  @$pb.TagNumber(6)
  set height($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearHeight() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get slot => $_getI64(6);
  @$pb.TagNumber(7)
  set slot($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSlot() => $_has(6);
  @$pb.TagNumber(7)
  void clearSlot() => clearField(7);

  @$pb.TagNumber(8)
  $3.EligibilityCertificate get eligibilityCertificate => $_getN(7);
  @$pb.TagNumber(8)
  set eligibilityCertificate($3.EligibilityCertificate v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEligibilityCertificate() => $_has(7);
  @$pb.TagNumber(8)
  void clearEligibilityCertificate() => clearField(8);
  @$pb.TagNumber(8)
  $3.EligibilityCertificate ensureEligibilityCertificate() => $_ensure(7);

  @$pb.TagNumber(9)
  $4.OperationalCertificate get operationalCertificate => $_getN(8);
  @$pb.TagNumber(9)
  set operationalCertificate($4.OperationalCertificate v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasOperationalCertificate() => $_has(8);
  @$pb.TagNumber(9)
  void clearOperationalCertificate() => clearField(9);
  @$pb.TagNumber(9)
  $4.OperationalCertificate ensureOperationalCertificate() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.List<$core.int> get metadata => $_getN(9);
  @$pb.TagNumber(10)
  set metadata($core.List<$core.int> v) { $_setBytes(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMetadata() => $_has(9);
  @$pb.TagNumber(10)
  void clearMetadata() => clearField(10);

  @$pb.TagNumber(11)
  $5.StakingAddress get address => $_getN(10);
  @$pb.TagNumber(11)
  set address($5.StakingAddress v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasAddress() => $_has(10);
  @$pb.TagNumber(11)
  void clearAddress() => clearField(11);
  @$pb.TagNumber(11)
  $5.StakingAddress ensureAddress() => $_ensure(10);
}

