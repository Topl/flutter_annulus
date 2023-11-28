import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import '../shared/mocks/hive_mocks.dart';
import '../utils/tester_utils.dart';

class TabletTransactionDetails extends RequiredTest {
  Future<void> Function(TestScreenSizes testScreenSize) tabletTransactionDetailsTest;

  TabletTransactionDetails({
    required this.tabletTransactionDetailsTest,
    required super.testScreenSize,
  });

  Future<void> runTests() async {
    await tabletTransactionDetailsTest(testScreenSize);
  }
}

void main() async {
  final requestTests = TabletTransactionDetails(
    tabletTransactionDetailsTest: (testScreenSize) => tabletTransactionDetailsTest(testScreenSize),
    testScreenSize: TestScreenSizes.tablet,
  );

  await requestTests.runTests();
}

Future<void> tabletTransactionDetailsTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Transation details test ${testScreenSize.name}', (WidgetTester tester) async {
      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
        ]),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('08EhwUB...'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('08EhwUB...'));
      (WidgetTester tester) async {
        await customRunAsync(tester, test: () async {
          expect(find.text('08EhwUBiHJ3evyGidV1WH8Q8EhwUBiHJ3evyGidV1WH8Q'), findsOneWidget);
          await tester.ensureVisible(find.text('Transation Details'));
        });
      };
    });
