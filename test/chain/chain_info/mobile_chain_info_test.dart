import 'package:flutter_annulus/chain/sections/chain_info.dart';
import 'package:flutter_annulus/shared/providers/datetime_now_provider.dart';
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
import 'required_chain_info_tests.dart';
import 'utils/chain_info_utils.dart';

void main() async {
  final requestTests = RequiredChainInfoTests(
    loadChainInfoSection: (testScreenSize) => desktopChainInfoTest(testScreenSize),
    testScreenSize: TestScreenSizes.mobile,
  );

  await requestTests.runTests();
}

Future<void> desktopChainInfoTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Chain Info test ${testScreenSize.name}', (WidgetTester tester) async {
      final blockId = createId();
      final currentTime = DateTime.now();
      final mockChainInfo = getModifiedMockChainInfo(
        dataBytes: 200,
        startTimestamp: DateTime.now().millisecondsSinceEpoch,
        transactionCount: 300,
        totalTransactionReward: 1500,
        endHeight: 1,
        eon: 600,
        era: 500,
        epoch: 400,
        activeStake: 200,
        inactiveStake: 200,
      );
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
            dateTimeNowProvider.overrideWithValue(() => currentTime),
          ],
        ),
      );

      await expectLoadingChainInfo(tester);

      await tester.pumpAndSettle();

      confirmHomeScreenRoute(tester: tester);

      final chainInfoFinder = find.byKey(ChainInfo.chainInfoKey);
      await tester.ensureVisible(chainInfoFinder);
      await tester.pumpAndSettle();

      confirmChainInfoText(
        mockChainInfo: mockChainInfo,
        currentTimestamp: currentTime.millisecondsSinceEpoch,
      );
    });
