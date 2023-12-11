import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/shared/widgets/snackbar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../essential_test_provider_widget.dart';
import '../../required_test_class.dart';
import '../mocks/genus_mocks.dart';
import '../mocks/hive_mocks.dart';
import 'required_test_class.dart';

void main() async {
  final chainTests = RequiredRetryErrorToastTest(
    navigateToBlockDetails: (testScreenSize) => desktopRetryError(testScreenSize),
    testScreenSize: TestScreenSizes.desktop,
  );

  await chainTests.runTests();
}

Future<void> desktopRetryError(TestScreenSizes testScreenSize) async {
  testWidgets('Retry Error Toast message test for ${testScreenSize.name}', (WidgetTester tester) async {
    final blockId = createId();

    await tester.pumpWidget(
      await essentialTestProviderWidget(
        tester: tester,
        testScreenSize: testScreenSize,
        overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
          genusProvider.overrideWith((ref, arg) => getMockGenus(blockId: blockId)),
        ],
      ),
    );
     await tester.pumpAndSettle();

      expect(find.byKey(CustomSnackBar.snackBarContentKey), findsOneWidget);

      expect(find.text(Strings.failedToLoadPage), findsOneWidget);

      expect(find.text(Strings.tryAgainLater), findsOneWidget);

      expect(find.text(Strings.retry), findsOneWidget);

      await tester.ensureVisible(find.byKey(CustomSnackBar.retryButtonKey));

      final retryButton = find.byKey(CustomSnackBar.retryButtonKey);

      await tester.tap(retryButton);

      await tester.pumpAndSettle();

      final closeButton = find.byKey(CustomSnackBar.closeButtonKey);

      await tester.ensureVisible(find.byKey(CustomSnackBar.closeButtonKey));

      await tester.tap(closeButton);

      await tester.pumpAndSettle();

  });
}
