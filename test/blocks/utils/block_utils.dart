import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/details/block_details_page.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

confirmBlockDetailsRoute({
  required WidgetTester tester,
  required String blockId,
}) {
  final BuildContext context = tester.element(find.byKey(HomeScreen.homeScreenKey));
  final vRouter = VRouter.of(context);

  final url = vRouter.url;
  print('QQQQ url: $url');

  final pathParams = vRouter.pathParameters;
  print('QQQQ pathParams: $pathParams');

  // Expect the chainId is the only path parameter
  expect(pathParams.length == 2, true);

  // Expect the pathParams to contain chainId
  expect(pathParams.containsKey(HomeScreen.chainIdParam), true);

  // Expect the chainId to be the mock chain
  expect(pathParams[HomeScreen.chainIdParam] == const Chains.mock().urlName, true);

  // Expect the pathParams to contain blockId
  expect(pathParams.containsKey(BlockDetailsPage.blockIdParam), true);

  print('QQQQ blockId: $blockId');

  // Expect the blockId to be the mock block
  expect(pathParams[BlockDetailsPage.blockIdParam] == blockId, true);
}
