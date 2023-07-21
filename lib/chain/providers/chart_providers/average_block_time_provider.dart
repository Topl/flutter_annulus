import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<ChartResult> _getAverageBlockTime({
  required int skipCount,
  required DateTime endTime,
  required Ref ref,
}) async {
  var currentBlockEndTime = DateTime.now();
  var currentBlockDepth = 0;

  Map<DateTime, int> results = {};

  while (currentBlockEndTime.isAfter(endTime)) {
    final Block block1 = await ref.read(getBlockByDepthProvider(currentBlockDepth).future);
    print('QQQQ block1: $block1');

    final nextBlockDepth = currentBlockDepth + skipCount;
    late Block block2;
    try {
      block2 = await ref.read(getBlockByDepthProvider(nextBlockDepth).future);
    } catch (e) {
      print('QQQQ error: $e');
      break;
    }
    print('QQQQ block2: $block2');

    currentBlockDepth = nextBlockDepth;
    currentBlockEndTime = DateTime.fromMillisecondsSinceEpoch(block2.timestamp);

    results[DateTime.fromMillisecondsSinceEpoch(block1.timestamp)] =
        ((block1.timestamp - block2.timestamp) / 1000).round();
  }
  return ChartResult(results: results);
}

final averageBlockTimeDayProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    skipCount: 1,
    endTime: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    ref: ref,
  );
});

final averageBlockTimeWeekProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    skipCount: 5,
    endTime: DateTime.now().subtract(
      const Duration(days: 7),
    ),
    ref: ref,
  );
});

final averageBlockTimeTwoWeeksProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    skipCount: 10,
    endTime: DateTime.now().subtract(
      const Duration(days: 14),
    ),
    ref: ref,
  );
});

final averageBlockTimeMonthProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    skipCount: 20,
    endTime: DateTime.now().subtract(
      const Duration(days: 30),
    ),
    ref: ref,
  );
});

final averageBlockTimeThreeMonthsProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    skipCount: 60,
    endTime: DateTime.now().subtract(
      const Duration(days: 90),
    ),
    ref: ref,
  );
});

final averageBlockTimeSixMonthsProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    skipCount: 120,
    endTime: DateTime.now().subtract(
      const Duration(days: 180),
    ),
    ref: ref,
  );
});

final averageBlockTimeYearProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    skipCount: 240,
    endTime: DateTime.now().subtract(
      const Duration(days: 365),
    ),
    ref: ref,
  );
});

final averageBlockTimeAllTimeProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    skipCount: 480,
    endTime: DateTime.fromMillisecondsSinceEpoch(0),
    ref: ref,
  );
});
