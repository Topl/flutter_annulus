import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import '../shared/mocks/hive_mocks.dart';

class TabletBlockDetails extends RequiredTest {
  Future<void> Function(TestScreenSizes testScreenSize) tabletBlockDetailsTest;

  TabletBlockDetails({
    required this.tabletBlockDetailsTest,
    required super.testScreenSize,
  });

  Future<void> runTests() async {
    await tabletBlockDetailsTest(testScreenSize);
  }
}

void main() async {
  final requestTests = TabletBlockDetails(
    tabletBlockDetailsTest: (testScreenSize) => tabletBlockDetailsTest(testScreenSize),
    testScreenSize: TestScreenSizes.tablet,
  );

  await requestTests.runTests();
}

Future<void> tabletBlockDetailsTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Block details testing ${testScreenSize.name}', (WidgetTester tester) async {
      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
        ]),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('1000'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('1000'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Block Details'));
    });
