import 'package:flutter_annulus/chain/sections/chain_info.dart';
import 'package:flutter_annulus/chain/utils/chain_info_calc_utils.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/stat_info_card.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/top_chain_info_section.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:topl_common/genus/data_extensions.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';

import '../../../shared/utils/chain_info_utils.dart';

Future<void> expectLoadingChainInfo(WidgetTester tester) async {
  // Pump once and find the loading widget
  await tester.pump();
  final loadingChainInfoFinder = find.byKey(ChainInfo.loadingChainInfoKey);
  expect(loadingChainInfoFinder, findsOneWidget);
}

void confirmChainInfoText({
  required FetchEpochDataRes mockChainInfo,
  required int currentTimestamp,
}) {
  final avgTransactionFeeKey =
      TopChainInfoSection.averageTransactionFeeKey(calculateAverageTransactionFee(chainData: mockChainInfo));
  expect(find.byKey(avgTransactionFeeKey), findsOneWidget);

  final dataThroughputKey = TopChainInfoSection.dataThroughputKey(calculateDataThroughput(
    chainData: mockChainInfo,
    currentTimestamp: currentTimestamp,
  ));
  expect(find.byKey(dataThroughputKey), findsOneWidget);

  testTextField(StatInfoCard.statInfoItemKey("Epoch"), mockChainInfo.epochData.epoch.toString());
  testTextField(StatInfoCard.statInfoItemKey("Txs"), mockChainInfo.epochData.transactionCount.toString());
  testTextField(StatInfoCard.statInfoItemKey("Height"), mockChainInfo.epochData.endHeight.toString());
  testTextField(
    StatInfoCard.statInfoItemKey("Avg Block Time"),
    calculateAverageBlockTime(
      chainData: mockChainInfo,
      currentTimestamp: currentTimestamp,
    ).toString(),
  );

  final activeStakes = mockChainInfo.epochData.activeStake.toBigInt().toInt();
  final inactiveStakes = mockChainInfo.epochData.inactiveStake.toBigInt().toInt();
  final totalStakes = activeStakes + inactiveStakes;
  testTextField(StatInfoCard.statInfoItemKey("Registered\nStakes"), "$totalStakes");
  testTextField(StatInfoCard.statInfoItemKey("Active\nStakes"), "$activeStakes%");
  testTextField(StatInfoCard.statInfoItemKey("Inactive\nStakes"), "$inactiveStakes%");
}
