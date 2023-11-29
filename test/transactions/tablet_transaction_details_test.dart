import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/transactions/sections/transactions.dart';
import 'package:flutter_test/flutter_test.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import '../shared/mocks/genus_mocks.dart';
import '../shared/mocks/hive_mocks.dart';
import '../shared/utils/tester_utils.dart';

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
      final transactionId = createId();
      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
          genusProvider.overrideWith((ref, arg) => getMockGenus(transactionId: transactionId)),
        ]),
      );

      await tester.pumpAndSettle();

      final transactionFinder = find.byKey(Transactions.transactionListItemKey(transactionId)).first;

      await tester.ensureVisible(transactionFinder);
      await tester.pumpAndSettle();
      await tester.tap(transactionFinder);
      (WidgetTester tester) async {
        await customRunAsync(tester, test: () async {
          expect(find.text(transactionId), findsOneWidget);
          await tester.ensureVisible(find.text('Transation Details'));
        });
      };
    });