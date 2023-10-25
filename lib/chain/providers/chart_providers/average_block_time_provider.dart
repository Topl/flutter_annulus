import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:flutter_annulus/chain/providers/chart_providers/average_transaction_fee_provider.dart';
import 'package:flutter_annulus/chain/utils/chain_utils.dart';
import 'package:flutter_annulus/chain/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// This function will return the average block time for 2 blocks
double _getAverageBlockTimeBetween2Blocks({
  required Block block1, // First block
  required Block block2, // Second block
}) {
  final blockTime1 = DateTime.fromMillisecondsSinceEpoch(block1.timestamp); // Get the timestamp of the first block
  final blockTime2 = DateTime.fromMillisecondsSinceEpoch(block2.timestamp); // Get the timestamp of the second block

  final blockTimeDifference = blockTime1.difference(blockTime2); // Calculate the difference between the 2 timestamps
  final heightDifference = block1.height - block2.height; // Calculate the difference between the 2 block heights

  return (blockTimeDifference.inSeconds / heightDifference) / 2; // Return the average block time
}

/// Function to get the block time since decentralization
Future<ChartResult> _getBlockTimeSinceDecentralization({
  required Ref ref, // Reference to the provider
}) async {
  // First get the blocks
  final List<Block> blocks = await getBlocksSinceDecentralization(ref: ref);

  // Then calculate the block time difference between each block
  Map<DateTime, double> results = {};

  for (int i = 0; i < blocks.length - 1; i++) {
    final block1 = blocks[i];
    final block2 = blocks[i + 1];

    results[DateTime.fromMillisecondsSinceEpoch(block1.timestamp)] = _getAverageBlockTimeBetween2Blocks(
      block1: block1,
      block2: block2,
    );
  }

  return ChartResult(results: results); // Return the results
}

// Function to get the average block time
Future<ChartResult> _getAverageBlockTime({
  required DateTime endTime, // End time for the calculation
  required Ref ref, // Reference to the provider
}) async {
  final blockAtHeight0 = await ref.read(blockStateAtHeightProvider(1).future);

  int skipCount = await blockSkipAmount(
    timeFrame: Duration(milliseconds:  endTime.millisecondsSinceEpoch - blockAtHeight0.timestamp),
    ref: ref,
    blockAtHeight0: blockAtHeight0,
  );

  var currentBlockEndTime = DateTime.now(); // Set the current block end time to now
  var currentBlockDepth = 0; // Set the current block depth to 0

  Map<DateTime, double> results = {}; // Map to store the results
  int amountOfBlocksRequested = 1;
  // Loop until the current block end time is after the end time
  while (currentBlockEndTime.isAfter(endTime) && amountOfBlocksRequested <= maxDataPoints) {
    amountOfBlocksRequested += 1;
    final Block block1 =
        await ref.read(blockStateAtDepthProvider(currentBlockDepth).future); // Get the block at the current depth

    final nextBlockDepth = currentBlockDepth + skipCount; // Calculate the depth of the next block

    late Block block2; // Declare the next block

    // If the next block is not available, break the loop
    try {
      block2 = await ref.read(blockStateAtDepthProvider(nextBlockDepth).future); // Get the next block
    } catch (e) {
      // If there is no block at the next depth, then break the loop
      break;
    }

    currentBlockDepth = nextBlockDepth; // Update the current block depth

    currentBlockEndTime = DateTime.fromMillisecondsSinceEpoch(
        block2.timestamp); // Set the current block end time to the timestamp of the next block

    results[DateTime.fromMillisecondsSinceEpoch(block1.timestamp)] = _getAverageBlockTimeBetween2Blocks(
      block1: block1,
      block2: block2,
    ); // Calculate the block time difference and store it in the results map
  }

  // If there are not enough results, return the block time since decentralization
  if (results.length < minimumResults) {
    return await _getBlockTimeSinceDecentralization(ref: ref);
  }

  return ChartResult(results: results); // Return the results
}

final averageBlockTimeDayProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    endTime: chartDayEndTime,
    ref: ref,
  );
});

final averageBlockTimeWeekProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    endTime: chartWeekEndTime,
    ref: ref,
  );
});

final averageBlockTimeTwoWeeksProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    endTime: chartTwoWeekEndTime,
    ref: ref,
  );
});

final averageBlockTimeMonthProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    endTime: chartMonthEndTime,
    ref: ref,
  );
});

final averageBlockTimeThreeMonthsProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    endTime: chartThreeMonthEndTime,
    ref: ref,
  );
});

final averageBlockTimeSixMonthsProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    endTime: chartSixMonthEndTime,
    ref: ref,
  );
});

final averageBlockTimeYearProvider = FutureProvider<ChartResult>((ref) async {
  return _getAverageBlockTime(
    endTime: chartYearEndTime,
    ref: ref,
  );
});

final averageBlockTimeAllTimeProvider = FutureProvider<ChartResult>((ref) async {
  return _getBlockTimeSinceDecentralization(ref: ref);
});
