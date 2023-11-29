import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import '../shared/mocks/hive_mocks.dart';
import '../utils/tester_utils.dart';

class MobileTransationDetails extends RequiredTest {
  Future<void> Function(TestScreenSizes testScreenSize) mobileTransactionDetailsTest;

  MobileTransationDetails({
    required this.mobileTransactionDetailsTest,
    required super.testScreenSize,
  });

  Future<void> runTests() async {
    await mobileTransactionDetailsTest(testScreenSize);
  }
}

void main() async {
  final requestTests = MobileTransationDetails(
    mobileTransactionDetailsTest: (testScreenSize) => mobileTransactionDetailsTest(testScreenSize),
    testScreenSize: TestScreenSizes.mobile,
  );

  await requestTests.runTests();
}

Future<void> mobileTransactionDetailsTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Transation details test ${testScreenSize.name}', (WidgetTester tester) async {
      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
        ]),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('08EhwUBiHJ3evyGi...'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('08EhwUBiHJ3evyGi...'));
      (WidgetTester tester) async {
        await customRunAsync(tester, test: () async {
          expect(find.text('08EhwUBiHJ3evyGidV1WH8Q8EhwUBiHJ3evyGidV1WH8Q'), findsOneWidget);
          await tester.ensureVisible(find.text('Transation Details'));
        });
      };
    });
