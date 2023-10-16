import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:flutter_annulus/chain/utils/chain_utils.dart';
import 'package:flutter_annulus/chain/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Gets the data throughput for 2 blocks
double _getDataThroughputBetween2Blocks({
  required Block block1,
  required Block block2,
}) {
  return ((block1.size - block2.size) / 2).abs();
}

/// Gets the data throughput since decentralization.
/// Returns a [Future] of [ChartResult].
Future<ChartResult> _getDataThroughputSinceDecentralization({
  required Ref ref, // The reference to the block state.
}) async {
  final List<Block> blocks = await getBlocksSinceDecentralization(ref: ref); // Get the blocks since decentralization.

  Map<DateTime, double> results = {}; // The results of the calculation.

  // Loop through the blocks and calculate the data throughput between each pair of blocks.
  for (int i = 0; i < blocks.length - 1; i++) {
    final block1 = blocks[i]; // Get the first block.
    final block2 = blocks[i + 1]; // Get the second block.

    results[DateTime.fromMillisecondsSinceEpoch(block1.timestamp)] = _getDataThroughputBetween2Blocks(
      block1: block1,
      block2: block2,
    ); // Calculate the data throughput between the two blocks and add it to the results.
  }

  return ChartResult(results: results); // Return the results.
}

/// Calculates the data throughput between blocks at a given skip count and end time.
/// Returns a [Future] of [ChartResult].
Future<ChartResult> _calculateDataThroughput({
  required int skipCount, // The number of blocks to skip between each calculation.
  required DateTime endTime, // The end time for the calculation.
  required Ref ref, // The reference to the block state.
}) async {
  final blockAtHeight0 = await ref.read(blockStateAtHeightProvider(1).future);
  int skipCount = await blockSkipAmount(
    timeFrame: endTime.millisecondsSinceEpoch - blockAtHeight0.timestamp,
    ref: ref,
    blockAtHeight0: blockAtHeight0,
  );
  var currentBlockEndTime = DateTime.now(); // The current block's end time.
  var currentBlockDepth = 0; // The current block's depth.

  Map<DateTime, double> results = {}; // The results of the calculation.
  int amountOfBlocksRequested = 1;
  // Loop through the blocks until the current block's end time is before the end time.
  while (currentBlockEndTime.isAfter(endTime) && amountOfBlocksRequested <= 100) {
    amountOfBlocksRequested += 1;
    final Block block1 = await ref.read(blockStateAtDepthProvider(currentBlockDepth).future); // Get the current block.

    final nextBlockDepth = currentBlockDepth + skipCount; // Calculate the depth of the next block.
    late Block block2; // Declare the next block.

    // If the next block is not available, break the loop.
    try {
      block2 = await ref.read(blockStateAtDepthProvider(nextBlockDepth).future); // Get the next block.
    } catch (e) {
      break;
    }

    currentBlockDepth = nextBlockDepth; // Update the current block's depth.
    currentBlockEndTime = DateTime.fromMillisecondsSinceEpoch(block2.timestamp); // Update the current block's end time.

    results[DateTime.fromMillisecondsSinceEpoch(block1.timestamp)] = _getDataThroughputBetween2Blocks(
      block1: block1,
      block2: block2,
    ); // Calculate the data throughput between the two blocks and add it to the results.
  }

  // If there are not enough results, get the data throughput since decentralization.
  if (results.length < minimumResults) {
    return await _getDataThroughputSinceDecentralization(ref: ref);
  }

  return ChartResult(results: results); // Return the results.
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
  return _getDataThroughputSinceDecentralization(ref: ref);
});
