import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<ChartResult> _calculateDataThroughput({
  required int skipCount,
  required DateTime endTime,
  required Ref ref,
}) async {
  var currentBlockEndTime = DateTime.now();
  var currentBlockDepth = 0;

  Map<DateTime, double> results = {};

  while (currentBlockEndTime.isAfter(endTime)) {
    final Block block1 = await ref.read(getBlockByDepthProvider(currentBlockDepth).future);

    final nextBlockDepth = currentBlockDepth + skipCount;
    late Block block2;

    // If the next block is not available, break the loop
    try {
      block2 = await ref.read(getBlockByDepthProvider(nextBlockDepth).future);
    } catch (e) {
      break;
    }

    currentBlockDepth = nextBlockDepth;
    currentBlockEndTime = DateTime.fromMillisecondsSinceEpoch(block2.timestamp);

    results[DateTime.fromMillisecondsSinceEpoch(block1.timestamp)] = (block1.size - block2.size) / 2;
  }

  return ChartResult(results: results);
}

final dataThroughputDayProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: 1,
    endTime: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    ref: ref,
  );
});

final dataThroughputWeekProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: 5,
    endTime: DateTime.now().subtract(
      const Duration(days: 7),
    ),
    ref: ref,
  );
});

final dataThroughputTwoWeeksProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: 10,
    endTime: DateTime.now().subtract(
      const Duration(days: 14),
    ),
    ref: ref,
  );
});

final dataThroughputMonthProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: 20,
    endTime: DateTime.now().subtract(
      const Duration(days: 30),
    ),
    ref: ref,
  );
});

final dataThroughputThreeMonthsProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: 60,
    endTime: DateTime.now().subtract(
      const Duration(days: 90),
    ),
    ref: ref,
  );
});

final dataThroughputSixMonthsProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: 120,
    endTime: DateTime.now().subtract(
      const Duration(days: 180),
    ),
    ref: ref,
  );
});

final dataThroughputYearProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: 240,
    endTime: DateTime.now().subtract(
      const Duration(days: 365),
    ),
    ref: ref,
  );
});

final dataThroughputAllProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: 480,
    endTime: DateTime.fromMillisecondsSinceEpoch(0),
    ref: ref,
  );
});
