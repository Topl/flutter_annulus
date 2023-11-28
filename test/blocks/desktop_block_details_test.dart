import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import '../shared/mocks/hive_mocks.dart';
import '../utils/tester_utils.dart';

class DesktopBlockDetails extends RequiredTest {
  Future<void> Function(TestScreenSizes testScreenSize) desktopBlockDetailsTest;

  DesktopBlockDetails({
    required this.desktopBlockDetailsTest,
    required super.testScreenSize,
  });

  Future<void> runTests() async {
    await desktopBlockDetailsTest(testScreenSize);
  }
}

void main() async {
  final requestTests = DesktopBlockDetails(
    desktopBlockDetailsTest: (testScreenSize) => desktopBlockDetailsTest(testScreenSize),
    testScreenSize: TestScreenSizes.desktop,
  );

  await requestTests.runTests();
}

Future<void> desktopBlockDetailsTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Block details test ${testScreenSize.name}', (WidgetTester tester) async {
      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
        ]),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('1000'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('1000'));
      (WidgetTester tester) async {
        await customRunAsync(tester, test: () async {
          expect(find.text('1000'), findsOneWidget);
          await tester.ensureVisible(find.text('Block Details'));
        });
      };
    });
