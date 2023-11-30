import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

confirmHomeScreenRoute({
  required WidgetTester tester,
}) {
  final BuildContext context = tester.element(find.byKey(HomeScreen.homeScreenKey));
  final vRouter = VRouter.of(context);

  final pathParams = vRouter.pathParameters;

  // Expect the pathParams to contain chainId
  expect(pathParams.containsKey(HomeScreen.chainIdParam), true);

  // Expect the chainId is the only path parameter
  expect(pathParams.length == 1, true);

  // Expect the chainId to be the mock chain
  expect(pathParams[HomeScreen.chainIdParam] == const Chains.dev_network().urlName, true);
}
