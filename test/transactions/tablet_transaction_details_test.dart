import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/transactions/sections/details/mobile_transaction_details_page.dart';
import 'package:flutter_annulus/transactions/sections/transactions.dart';
import 'package:flutter_test/flutter_test.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import '../shared/mocks/genus_mocks.dart';
import '../shared/mocks/hive_mocks.dart';
import '../shared/utils/navigation_utils.dart';
import 'required_transaction_details_tests.dart';
import 'utils/transaction_utils.dart';

void main() async {
  final requestTests = RequiredTransactionDetailTests(
    navigateToTransactionDetails: (testScreenSize) => tabletTransactionDetailsTest(testScreenSize),
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

      confirmHomeScreenRoute(tester: tester);

      final transactionFinder = find.byKey(Transactions.transactionListItemKey(transactionId)).first;

      await tester.ensureVisible(transactionFinder);
      await tester.pumpAndSettle();
      await tester.tap(transactionFinder);
      await tester.pumpAndSettle();

      confirmTransactionDetailsRoute(
        tester: tester,
        transactionId: transactionId,
      );

      final transactionIdFinder = find.byKey(MobileTransactionDetailsPage.transactionIdKey(transactionId));
      expect(transactionIdFinder, findsOneWidget);
      expect(find.text(Strings.transactionDetailsHeader), findsOneWidget);
    });
