import 'package:flutter_annulus/blocks/widgets/block_slider/block_view.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_test/flutter_test.dart';

import '../essential_test_provider_widget.dart';
import '../required_test_class.dart';
import '../shared/mocks/genus_mocks.dart';
import '../shared/mocks/hive_mocks.dart';
import '../shared/utils/navigation_utils.dart';
import '../shared/utils/tester_utils.dart';
import 'required_block_detail_tests.dart';
import 'utils/block_utils.dart';

void main() async {
  final chainTests = RequiredBlockDetailTests(
    navigateToBlockDetails: (testScreenSize) => desktopBlockDetailsTest(testScreenSize),
    testScreenSize: TestScreenSizes.desktop,
  );

  await chainTests.runTests();
}

Future<void> desktopBlockDetailsTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Block details test ${testScreenSize.name}', (WidgetTester tester) async {
      final blockId = createId();

      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
          genusProvider.overrideWith((ref, arg) => getMockGenus(blockId: blockId)),
        ]),
      );

      await tester.pumpAndSettle();

      confirmHomeScreenRoute(tester: tester);

      final blockFinder = find.byKey(BlockView.blockItemKey(blockId)).first;

      await closeCustomSnackBar(tester);

      await tester.ensureVisible(blockFinder);

      await tester.pumpAndSettle();

      await tester.tap(blockFinder);

      await tester.pumpAndSettle();

      confirmBlockDetailsRoute(
        tester: tester,
        blockId: blockId,
      );

      await tester.ensureVisible(find.text('Block Details'));
    });
