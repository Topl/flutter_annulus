///
//  Generated code. Do not modify.
//  source: node/models/block.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../brambl/models/identifier.pb.dart' as $9;
import '../../brambl/models/transaction/io_transaction.pb.dart' as $22;
import '../../consensus/models/block_header.pb.dart' as $23;

class BlockBody extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BlockBody', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.node.models'), createEmptyInstance: create)
    ..pc<$9.Identifier_IoTransaction32>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionIds', $pb.PbFieldType.PM, protoName: 'transactionIds', subBuilder: $9.Identifier_IoTransaction32.create)
    ..hasRequiredFields = false
  ;

  BlockBody._() : super();
  factory BlockBody({
    $core.Iterable<$9.Identifier_IoTransaction32>? transactionIds,
  }) {
    final _result = create();
    if (transactionIds != null) {
      _result.transactionIds.addAll(transactionIds);
    }
    return _result;
  }
  factory BlockBody.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockBody.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockBody clone() => BlockBody()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockBody copyWith(void Function(BlockBody) updates) => super.copyWith((message) => updates(message as BlockBody)) as BlockBody; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockBody create() => BlockBody._();
  BlockBody createEmptyInstance() => create();
  static $pb.PbList<BlockBody> createRepeated() => $pb.PbList<BlockBody>();
  @$core.pragma('dart2js:noInline')
  static BlockBody getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockBody>(create);
  static BlockBody? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$9.Identifier_IoTransaction32> get transactionIds => $_getList(0);
}

class FullBlockBody extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FullBlockBody', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.node.models'), createEmptyInstance: create)
    ..pc<$22.IoTransaction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactions', $pb.PbFieldType.PM, subBuilder: $22.IoTransaction.create)
    ..hasRequiredFields = false
  ;

  FullBlockBody._() : super();
  factory FullBlockBody({
    $core.Iterable<$22.IoTransaction>? transactions,
  }) {
    final _result = create();
    if (transactions != null) {
      _result.transactions.addAll(transactions);
    }
    return _result;
  }
  factory FullBlockBody.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FullBlockBody.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FullBlockBody clone() => FullBlockBody()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FullBlockBody copyWith(void Function(FullBlockBody) updates) => super.copyWith((message) => updates(message as FullBlockBody)) as FullBlockBody; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FullBlockBody create() => FullBlockBody._();
  FullBlockBody createEmptyInstance() => create();
  static $pb.PbList<FullBlockBody> createRepeated() => $pb.PbList<FullBlockBody>();
  @$core.pragma('dart2js:noInline')
  static FullBlockBody getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FullBlockBody>(create);
  static FullBlockBody? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$22.IoTransaction> get transactions => $_getList(0);
}

class Block extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Block', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.node.models'), createEmptyInstance: create)
    ..aOM<$23.BlockHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: $23.BlockHeader.create)
    ..aOM<BlockBody>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body', subBuilder: BlockBody.create)
    ..hasRequiredFields = false
  ;

  Block._() : super();
  factory Block({
    $23.BlockHeader? header,
    BlockBody? body,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory Block.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Block.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Block clone() => Block()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Block copyWith(void Function(Block) updates) => super.copyWith((message) => updates(message as Block)) as Block; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Block create() => Block._();
  Block createEmptyInstance() => create();
  static $pb.PbList<Block> createRepeated() => $pb.PbList<Block>();
  @$core.pragma('dart2js:noInline')
  static Block getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Block>(create);
  static Block? _defaultInstance;

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
  BlockBody get body => $_getN(1);
  @$pb.TagNumber(2)
  set body(BlockBody v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => clearField(2);
  @$pb.TagNumber(2)
  BlockBody ensureBody() => $_ensure(1);
}

class FullBlock extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FullBlock', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'co.topl.node.models'), createEmptyInstance: create)
    ..aOM<$23.BlockHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: $23.BlockHeader.create)
    ..aOM<FullBlockBody>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fullBody', protoName: 'fullBody', subBuilder: FullBlockBody.create)
    ..hasRequiredFields = false
  ;

  FullBlock._() : super();
  factory FullBlock({
    $23.BlockHeader? header,
    FullBlockBody? fullBody,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (fullBody != null) {
      _result.fullBody = fullBody;
    }
    return _result;
  }
  factory FullBlock.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FullBlock.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FullBlock clone() => FullBlock()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FullBlock copyWith(void Function(FullBlock) updates) => super.copyWith((message) => updates(message as FullBlock)) as FullBlock; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FullBlock create() => FullBlock._();
  FullBlock createEmptyInstance() => create();
  static $pb.PbList<FullBlock> createRepeated() => $pb.PbList<FullBlock>();
  @$core.pragma('dart2js:noInline')
  static FullBlock getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FullBlock>(create);
  static FullBlock? _defaultInstance;

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
  FullBlockBody get fullBody => $_getN(1);
  @$pb.TagNumber(2)
  set fullBody(FullBlockBody v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFullBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullBody() => clearField(2);
  @$pb.TagNumber(2)
  FullBlockBody ensureFullBody() => $_ensure(1);
}

