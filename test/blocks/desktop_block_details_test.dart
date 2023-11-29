import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import '../shared/mocks/hive_mocks.dart';
import '../utils/tester_utils.dart';
import 'required_block_detail_tests.dart';

void main() async {
  final chainTests = RequiredBlockDetailTests(
    navigateToBlockDetails: (testScreenSize) => desktopBlockDetailsTest(testScreenSize),
    testScreenSize: TestScreenSizes.desktop,
  );

  await chainTests.runTests();
}

Future<void> desktopBlockDetailsTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Block details test ${testScreenSize.name}', (WidgetTester tester) async {
      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
        ]),
      );

      await tester.pumpAndSettle();

      final BuildContext context = tester.element(find.byKey(HomeScreen.homeScreenKey));
      final vRouter = VRouter.of(context);

      final url = vRouter.url;
      print('QQQQ url: $url');

      final pathParams = vRouter.pathParameters;
      print('QQQQ pathParams: $pathParams');

      // Expect the pathParams to contain chainId
      expect(pathParams.containsKey('chainId'), true);

      // Expect the chainId is the only path parameter
      expect(pathParams.length == 1, true);

      // Expect the chainId to be the mock chain
      expect(pathParams['chainId'] == const Chains.mock().urlName, true);

      await tester.ensureVisible(find.text('1000'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('1000'));
      await tester.pumpAndSettle();
      expect(find.text('1000'), findsOneWidget);
      await tester.ensureVisible(find.text('Block Details'));
    });
