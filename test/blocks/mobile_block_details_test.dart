import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import '../shared/mocks/hive_mocks.dart';
import 'required_block_detail_tests.dart';

void main() async {
  final chainTests = RequiredBlockDetailTests(
    navigateToBlockDetails: (testScreenSize) => mobileBlockSliderTest(testScreenSize),
    testScreenSize: TestScreenSizes.mobile,
  );

  await chainTests.runTests();
}

Future<void> mobileBlockSliderTest(TestScreenSizes testScreenSize) async =>
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
      await tester.pumpAndSettle();
      expect(find.text('1000'), findsOneWidget);
      await tester.ensureVisible(find.text('Block Details'));
    });
