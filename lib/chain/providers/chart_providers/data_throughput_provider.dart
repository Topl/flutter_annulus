import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:flutter_annulus/chain/utils/constants.dart';
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
    skipCount: chartDaySkipAmount,
    endTime: chartDayEndTime,
    ref: ref,
  );
});

final dataThroughputWeekProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: chartWeekSkipAmount,
    endTime: chartWeekEndTime,
    ref: ref,
  );
});

final dataThroughputTwoWeeksProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: chartTwoWeekSkipAmount,
    endTime: chartTwoWeekEndTime,
    ref: ref,
  );
});

final dataThroughputMonthProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: chartMonthSkipAmount,
    endTime: chartMonthEndTime,
    ref: ref,
  );
});

final dataThroughputThreeMonthsProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: chartThreeMonthSkipAmount,
    endTime: chartThreeMonthEndTime,
    ref: ref,
  );
});

final dataThroughputSixMonthsProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: chartSixMonthSkipAmount,
    endTime: chartSixMonthEndTime,
    ref: ref,
  );
});

final dataThroughputYearProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: chartYearSkipAmount,
    endTime: chartYearEndTime,
    ref: ref,
  );
});

final dataThroughputAllProvider = FutureProvider<ChartResult>((ref) async {
  return _calculateDataThroughput(
    skipCount: chartAllSkipAmount,
    endTime: chartAllEndTime,
    ref: ref,
  );
});
