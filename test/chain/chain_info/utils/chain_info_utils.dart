import 'package:flutter_annulus/chain/sections/chain_info.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> expectLoadingChainInfo(WidgetTester tester) async {
  // Pump once and find the loading widget
  await tester.pump();
  final loadingChainInfoFinder = find.byKey(ChainInfo.loadingChainInfoKey);
  expect(loadingChainInfoFinder, findsOneWidget);
}
