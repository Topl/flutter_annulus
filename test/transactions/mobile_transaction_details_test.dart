import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/transactions/sections/transactions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:topl_common/proto/brambl/models/transaction/io_transaction.pb.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import '../shared/mocks/genus_mocks.dart';
import '../shared/mocks/hive_mocks.dart';
import '../shared/utils/navigation_utils.dart';
import '../shared/utils/transaction_utils.dart';
import 'required_transaction_details_tests.dart';
import 'utils/transaction_utils.dart';

void main() async {
  final requestTests = RequiredTransactionDetailTests(
    navigateToTransactionDetails: (testScreenSize) => mobileTransactionDetailsTest(testScreenSize),
    testScreenSize: TestScreenSizes.mobile,
  );

  await requestTests.runTests();
}

Future<void> mobileTransactionDetailsTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Transation details test ${testScreenSize.name}', (WidgetTester tester) async {
      final transactionId = createId();
      final IoTransaction ioTransaction = getMockIoTransaction(id: transactionId);

      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
          genusProvider.overrideWith((ref, arg) => getMockGenus(
                ioTransaction: ioTransaction,
              )),
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
      confirmMobileTransactionDetails(
        ioTransaction: ioTransaction,
        tester: tester,
        transactionId: transactionId,
      );
    });
