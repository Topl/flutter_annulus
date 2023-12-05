import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/details/block_details_page.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

confirmBlockDetailsRoute({
  required WidgetTester tester,
  required String blockId,
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
  expect(pathParams.containsKey(BlockDetailsPage.blockIdParam), true);

  // Expect the blockId to be the mock block
  expect(pathParams[BlockDetailsPage.blockIdParam] == blockId, true);
}

swipeBlocks(WidgetTester tester, int itemCount) async {
  int i = 1;
  while (i != itemCount) {
    await tester.tap(find.byKey(const Key('rightButton')), warnIfMissed: false);
    await tester.pumpAndSettle();
    i++;
  }
}

validateBlockDetails(WidgetTester tester, String blockId) async {
  await tester.ensureVisible(find.text('Block Details'));
  expect(find.text(Strings.blockId), findsOneWidget);
  expect(find.text('1'), findsAny);
  expect(find.text('1361.0'), findsAny);
  expect(find.text('0x736e345d784cf4c9'), findsAny);
}

validateBlockDetailsTabletMobile(WidgetTester tester, String blockId) async {
    await tester.ensureVisible(find.text('Block Details'));
    expect(find.text(Strings.blockId), findsAny);
    expect(find.text('1'), findsAny);
    expect(find.text('1361.0'), findsAny);    
    expect(find.text('10'), findsAny);
  }
