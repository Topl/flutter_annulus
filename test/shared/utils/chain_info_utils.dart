import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:topl_common/proto/node/models/node_epochData.pb.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';
import 'package:topl_common/proto/quivr/models/shared.pb.dart';
import 'package:flutter/material.dart';

getMockChainInfo() {
  return FetchEpochDataRes(
    epochData: EpochData(
      dataBytes: Int64(1),
      startTimestamp: Int64(DateTime.now().millisecondsSinceEpoch),
      transactionCount: Int64(1),
      totalTransactionReward: Int128(),
      endHeight: Int64(1),
      eon: Int64(1),
      era: Int64(1),
      epoch: Int64(1),
      activeStake: Int128(),
      inactiveStake: Int128(),
    ),
  );
}

FetchEpochDataRes getModifiedMockChainInfo({
  int? dataBytes,
  int? startTimestamp,
  int? transactionCount,
  int? totalTransactionReward,
  int? endHeight,
  int? eon,
  int? era,
  int? epoch,
  int? activeStake,
  int? inactiveStake,
}) {
  return FetchEpochDataRes(
    epochData: EpochData(
      dataBytes: Int64(dataBytes ?? 1),
      startTimestamp: Int64(startTimestamp ?? DateTime.now().millisecondsSinceEpoch),
      transactionCount: Int64(transactionCount ?? 1),
      totalTransactionReward: Int128(),
      endHeight: Int64(endHeight ?? 1),
      eon: Int64(eon ?? 1),
      era: Int64(era ?? 1),
      epoch: Int64(epoch ?? 1),
      activeStake: Int128(),
      inactiveStake: Int128(),
    ),
  );
}

testTextField(Key textFieldKey, String text) async {
  final currentKey = find.byKey(textFieldKey);
  expect(currentKey, findsOneWidget);
  final dynamic textFinder = currentKey.evaluate().single.widget;
  final textFinderData = textFinder.data;
  expect(textFinderData, text);
}
