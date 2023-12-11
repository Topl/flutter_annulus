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
    navigateToBlockDetails: (testScreenSize) => mobileRetryError(testScreenSize),
    testScreenSize: TestScreenSizes.mobile,
  );

  await chainTests.runTests();
}

Future<void> mobileRetryError(TestScreenSizes testScreenSize) async =>
    testWidgets('Retry Error Toast message test for ${testScreenSize.name}', (WidgetTester tester) async {
      final blockId = createId();
      
      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
          genusProvider.overrideWith((ref, arg) => getMockGenus(blockId: blockId)),
        ]),
      );

      await tester.pumpAndSettle();
      
      expect(find.byKey(CustomSnackBar.snackBarContentKey), findsOneWidget);
      
      final retryButton = find.byKey(CustomSnackBar.retryButtonKey);
      
      await tester.tap(retryButton, warnIfMissed: false);
      
      await tester.pumpAndSettle();

      expect(find.text(Strings.failedToLoadPage), findsOne);
      
      expect(find.text(Strings.tryAgainLater), findsOne);
      
      expect(find.text(Strings.retry), findsOne);
    });
