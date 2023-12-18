import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/transactions/sections/details/transaction_details_page.dart';
import 'package:flutter_annulus/transactions/sections/transactions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

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

Future<void> expectLoadingTransactions(WidgetTester tester) async {
  // Pump once and find the loading widget
  await tester.pump();
  final loadingTransactionsFinder = find.byKey(Transactions.loadingTransactionsKey);
  expect(loadingTransactionsFinder, findsOneWidget);
}
