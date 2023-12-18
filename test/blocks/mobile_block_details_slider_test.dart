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
import 'required_block_detail_slider_tests.dart';
import 'utils/block_utils.dart';

void main() async {
  final chainTests = RequiredBlockDetailSliderTests(
    navigateToBlockDetails: (testScreenSize) => mobileBlockDetailsSliderTest(testScreenSize),
    testScreenSize: TestScreenSizes.mobile,
  );

  await chainTests.runTests();
}

Future<void> mobileBlockDetailsSliderTest(TestScreenSizes testScreenSize) async =>
    testWidgets('Block details test ${testScreenSize.name}', (WidgetTester tester) async {
      final blockId = createId();
      const itemCount = 100;

      await tester.pumpWidget(
        await essentialTestProviderWidget(tester: tester, testScreenSize: testScreenSize, overrides: [
          hivePackageProvider.overrideWithValue(getMockHive().mockHive),
          genusProvider.overrideWith((ref, arg) => getMockGenus(blockId: blockId)),
        ]),
      );

      await expectLoadingBlockViewSlider(tester);

      await tester.pumpAndSettle();
      confirmHomeScreenRoute(tester: tester);

      final blockFinder = find.byKey(BlockView.blockItemKey(blockId)).first;
      final blockFinderlast = find.byKey(BlockView.blockItemKey(blockId)).last;
      await tester.ensureVisible(blockFinder);
      await tester.pumpAndSettle();

      expect(blockFinder, findsOneWidget);
      await tester.ensureVisible(blockFinder);
      await tester.pumpAndSettle();

      await swipeBlocks(tester, itemCount);

      await tester.pumpAndSettle();
      expect(blockFinderlast, findsOneWidget);
      await tester.ensureVisible(blockFinderlast);

      await tester.tap(blockFinderlast);
      await tester.pumpAndSettle();
    });
