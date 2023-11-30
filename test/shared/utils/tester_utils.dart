import 'package:flutter_test/flutter_test.dart';

/// This will call [tester.pump] for a duration and loops. Useful for when [pumpAndSettle] is timing out
///
/// Optional Parameters [loops] and [duration can be supplied]
///
/// [loops] is defaulted to 5
///
/// [duration] is defaulted to 0 and is in seconds
Future<void> pumpTester(WidgetTester tester, {int loops = 5, int duration = 0}) async {
  try {
    for (int i = 0; i <= loops; i++) {
      await tester.pump(
        Duration(seconds: duration),
      );
    }
  } catch (e) {
    await tester.pumpAndSettle();
  }
}

/// [delayDuration] is in milliseconds
/// [loopDuration] is in seconds
Future<void> customRunAsync(
  WidgetTester tester, {
  required Future<Null> Function() test,
  int delayDuration = 500,
  int loops = 5,
  int loopDuration = 0,
}) async {
  await tester.runAsync(() async {
    await test();
    await Future.delayed(Duration(milliseconds: delayDuration));
    await pumpTester(
      tester,
      duration: loopDuration,
      loops: loops,
    );
  });
}

// Timers Pending fix
Future<void> pendingTimersFix(WidgetTester tester) async {
  await customRunAsync(tester, test: () async {
    await Future.delayed(const Duration(milliseconds: 500));
    await pumpTester(tester, duration: 10, loops: 100);
    await Future.delayed(const Duration(milliseconds: 500));
  });
}
