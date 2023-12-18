import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/transactions/sections/details/desktop_transaction_details_page.dart';
import 'package:flutter_annulus/transactions/sections/details/mobile_transaction_details_page.dart';
import 'package:flutter_annulus/transactions/sections/details/transaction_details_page.dart';
import 'package:flutter_annulus/transactions/sections/transactions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:topl_common/proto/brambl/models/transaction/io_transaction.pb.dart';
import 'package:vrouter/vrouter.dart';

import '../../shared/utils/chain_info_utils.dart';

confirmTransactionDetailsRoute({
  required WidgetTester tester,
  required String transactionId,
}) {
  final BuildContext context = tester.element(find.byKey(HomeScreen.homeScreenKey));
  final vRouter = VRouter.of(context);

  final pathParams = vRouter.pathParameters;

  // Expect the chainId is the only path parameter
  expect(pathParams.length == 2, true);

  // Expect the pathParams to contain chainId
  expect(pathParams.containsKey(HomeScreen.chainIdParam), true);

  // Expect the chainId to be the mock chain
  expect(pathParams[HomeScreen.chainIdParam] == const Chains.dev_network().urlName, true);

  // Expect the pathParams to contain blockId
  expect(pathParams.containsKey(TransactionDetailsPage.transactionIdParam), true);

  // Expect the blockId to be the mock block
  expect(pathParams[TransactionDetailsPage.transactionIdParam] == transactionId, true);
}

void confirmTransactionDetails({
  required WidgetTester tester,
  required String transactionId,
  required IoTransaction ioTransaction,
}) {
  expect(find.text(transactionId), findsOneWidget);
  expect(find.text(Strings.transactionDetailsHeader), findsOneWidget);
  final metadata = decodeId(ioTransaction.datum.event.metadata.value);
  testTextField(DesktopTransactionDetailsPage.metaDataKey, metadata);
}

// TODO: Can remove this once detaisl has been refactored into shared widgets
void confirmMobileTransactionDetails({
  required WidgetTester tester,
  required String transactionId,
  required IoTransaction ioTransaction,
}) {
  final transactionIdFinder = find.byKey(MobileTransactionDetailsPage.transactionIdKey(transactionId));
  expect(transactionIdFinder, findsOneWidget);
  expect(find.text(Strings.transactionDetailsHeader), findsOneWidget);
  final metadata = decodeId(ioTransaction.datum.event.metadata.value);
  testTextField(DesktopTransactionDetailsPage.metaDataKey, metadata);
}

Future<void> expectLoadingTransactions(WidgetTester tester) async {
  // Pump once and find the loading widget
  await tester.pump();
  final loadingTransactionsFinder = find.byKey(Transactions.loadingTransactionsKey);
  expect(loadingTransactionsFinder, findsOneWidget);
}
