import 'package:flutter_annulus/chain/sections/chain_info.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/stat_info_card.dart';
import 'package:flutter_annulus/chain/widgets/chain_info/top_stat_with_icon.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/providers/node_provider.dart';
import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../essential_test_provider_widget.dart';
import '../../required_test_class.dart';
import '../../shared/mocks/genus_mocks.dart';
import '../../shared/mocks/hive_mocks.dart';
import '../../shared/mocks/node_config_mocks.dart';
import '../../shared/utils/chain_info_utils.dart';
import '../../shared/utils/navigation_utils.dart';
import 'required_chain_info_test.dart';

void main() async {
  final requestTests = RequiredChainInfoTests(
    loadChainInfoSection: (testScreenSize) => desktopChainInfoTest(testScreenSize),
    testScreenSize: TestScreenSizes.tablet,
  );

  await requestTests.runTests();
}

final mockChainInfo = getModifiedMockChainInfo(
  dataBytes: 200,
  startTimestamp: DateTime.now().millisecondsSinceEpoch,
  transactionCount: 300,
  totalTransactionReward: 1500,
  endHeight: 100,
  eon: 600,
  era: 500,
  epoch: 400,
  activeStake: 200,
  inactiveStake: 200,
);

Future<void> desktopChainInfoTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Chain Info test ${testScreenSize.name}', (WidgetTester tester) async {
      final blockId = createId();
      await tester.pumpWidget(
        await essentialTestProviderWidget(
          tester: tester,
          testScreenSize: testScreenSize,
          overrides: [
            hivePackageProvider.overrideWithValue(getMockHive().mockHive),
            genusProvider.overrideWith((ref, arg) => getMockGenus(blockId: blockId)),
            nodeProvider.overrideWith(
              (ref, arg) => getMockNodeGRPCService(
                chainInfo: mockChainInfo,
              ),
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      confirmHomeScreenRoute(tester: tester);

      final chainInfoFinder = find.byKey(ChainInfo.chainInfoKey);
      await tester.ensureVisible(chainInfoFinder);
      await tester.pumpAndSettle();

      testTextField(ChainInfo.eraTextKey, mockChainInfo.epochData!.era.toString());
      testTextField(ChainInfo.eonTextKey, mockChainInfo.epochData!.eon.toString());

      testTextField(TopStatWithIcon.topStatItemKey("Average Transaction Fees"), "0.0");
      testTextField(StatInfoCard.statInfoItemKey("Epoch"), mockChainInfo.epochData!.epoch.toString());
      testTextField(StatInfoCard.statInfoItemKey("Txs"), mockChainInfo.epochData!.transactionCount.toString());
      testTextField(StatInfoCard.statInfoItemKey("Height"), mockChainInfo.epochData!.endHeight.toString());
      testTextField(StatInfoCard.statInfoItemKey("Avg Block Time"), "0");
      testTextField(StatInfoCard.statInfoItemKey("Registered\nStakes"), "0");
      testTextField(StatInfoCard.statInfoItemKey("Active\nStakes"), "0%");
      testTextField(StatInfoCard.statInfoItemKey("Inactive\nStakes"), "0%");
    });
