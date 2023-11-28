import 'package:flutter_annulus/shared/widgets/header.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> openMobileHeader(WidgetTester tester) async {
  expect(find.byKey(Header.menuKey), findsOneWidget);
  await tester.tap(find.byKey(Header.menuKey));
  await tester.pumpAndSettle();
}
