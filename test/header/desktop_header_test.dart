import 'package:flutter_annulus/shared/widgets/header.dart';
import 'package:flutter_annulus/shared/providers/url_launcher_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import '../shared/utils/navigation_utils.dart';
import '../shared/mocks/url_launcher_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import 'required_header_tests.dart';

void main() async {
  final chainTests = RequiredHeaderTests(
    clickFaucetLink: (testScreenSize) => desktopHeaderTest(testScreenSize),
    testScreenSize: TestScreenSizes.desktop,
  );

  await chainTests.runTests();
}

Future<void> desktopHeaderTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Faucet Hyperlink test ${testScreenSize.name}', (WidgetTester tester) async {
      //mock URL Launcher
      final mockUrlLauncher = getMockUrlLauncher();

      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          urlLauncherProvider.overrideWithValue(mockUrlLauncher),
        ]),
      );
      await tester.pumpAndSettle();
      confirmHomeScreenRoute(tester: tester);

      //find and tap faucet button
      final faucetButton = find.byKey(Header.hyperlinkKey).first;
      await tester.ensureVisible(faucetButton);
      await tester.pumpAndSettle();
      await tester.tap(faucetButton);
      await tester.pumpAndSettle();

      verify(mockUrlLauncher.launchURL(Uri.parse('https://faucet.topl.co/#/'))).called(1);
    });
