import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/chain/utils/chain_utils.dart';
import 'package:flutter_annulus/chain/utils/constants.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/transactions/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/proto/genus/genus_rpc.pb.dart';

const maxDataPoints = 100;

/// Gets the average transaction fee for the given block
double? _getAverageTransactionFeeForBlock({
  required BlockResponse blockRes,
}) {
  if (blockRes.block.fullBody.hasField(1)) {
    int transactionCount = blockRes.block.fullBody.transactions.length;

    double averageTransactionFee = 0;

    //continue going through transactions
    for (int i = 0; i < transactionCount; i++) {
      final transaction = blockRes.block.fullBody.transactions[i];

      final inputList = transaction.inputs;

      final outputList = transaction.outputs;

      final double fee = calculateFees(inputs: inputList, outputs: outputList).toDouble();

      // If this is the first transaction, set the average to the fee of the first transaction.
      if (averageTransactionFee == 0) {
        averageTransactionFee = fee;
      } else {
        averageTransactionFee = (averageTransactionFee + fee) / 2;
      }
    }

    return averageTransactionFee;
  } else {
    return null;
  }
}

/// Returns a [ChartResult] object containing a map of [DateTime] objects to
/// [double] values representing the average transaction fee for each block
/// since decentralization.
///
/// The [ref] parameter is a reference to the current [ProviderReference]. The
/// [selectedChain] parameter specifies the chain to query for block data.
Future<ChartResult> _getAverageTransactionFeeSinceDecentralization({
  required Ref ref,
  required Chains selectedChain,
}) async {
  final List<Block> blocks = await getBlocksSinceDecentralization(ref: ref);

  Map<DateTime, double> results = {};

  // Loop through the most recent blocks and calculate the data throughput.
  for (int i = 0; i < blocks.length - 1; i++) {
    final block = blocks[i];

    final int depth = blocks[0].height - block.height;

    // TODO, this should be replaced with transaction provider methods
    var blockRes = await ref.read(genusProvider(selectedChain)).getBlockByDepth(depth: depth);

    final double? averageTransactionFee = _getAverageTransactionFeeForBlock(blockRes: blockRes);

    if (averageTransactionFee != null) {
      results[DateTime.fromMillisecondsSinceEpoch(block.timestamp)] = averageTransactionFee;
    }
  }

  return ChartResult(results: results);
}

/// Returns a [ChartResult] object containing a map of [DateTime] objects to
/// [double] values representing the average transaction fee for each block
/// within the specified time range.
///
/// The [skipCount] parameter determines how many blocks to skip between each
/// block that is included in the calculation. The [endTime] parameter specifies
/// the end of the time range to include in the calculation. The [selectedChain]
/// parameter specifies the chain to query for block data. The [ref] parameter
/// is a reference to the current [ProviderReference].
Future<ChartResult> _getTransactionFee({
  required DateTime endTime,
  required Chains selectedChain,
  required Ref ref,
}) async {
  final blockAtHeight0 = await ref.read(blockStateAtHeightProvider(1).future);

  int skipCount = await blockSkipAmount(
    timeFrame: Duration(milliseconds: endTime.millisecondsSinceEpoch - blockAtHeight0.timestamp),
    ref: ref,
    blockAtHeight0: blockAtHeight0,
  );

  var currentBlockEndTime = DateTime.now();
  var currentBlockDepth = 0;
  int amountOfBlocksRequested = 1;
  Map<DateTime, double> results = {};

  while (currentBlockEndTime.isAfter(endTime) && amountOfBlocksRequested <= maxDataPoints) {
    late Block block;
    amountOfBlocksRequested += 1;
    try {
      block = await ref.read(blockStateAtDepthProvider(currentBlockDepth).future);
      var blockRes = await ref.read(genusProvider(selectedChain)).getBlockByDepth(depth: currentBlockDepth);

      final double? averageTransactionFee = _getAverageTransactionFeeForBlock(blockRes: blockRes);

      if (averageTransactionFee != null) {
        results[DateTime.fromMillisecondsSinceEpoch(block.timestamp)] = averageTransactionFee;
      }
    } catch (e) {
      break;
    }
    currentBlockDepth += skipCount;
  }
  if (results.length < minimumResults) {
    return await _getAverageTransactionFeeSinceDecentralization(ref: ref, selectedChain: selectedChain);
  }

  return ChartResult(results: results);
}

/// The Following proivders are [FutureProvider] that returns a [ChartResult] object
/// containing a map of [DateTime] objects to [double] values representing the average
/// transaction fee for each block within the specified time frame.

final averageTransactionFeeDayProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    endTime: chartDayEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeWeekProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    endTime: chartWeekEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeTwoWeeksProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    endTime: chartTwoWeekEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeMonthProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    endTime: chartMonthEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeThreeMonthsProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    endTime: chartThreeMonthEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeSixMonthsProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    endTime: chartSixMonthEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeYearProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    endTime: chartYearEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeAllProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getAverageTransactionFeeSinceDecentralization(ref: ref, selectedChain: selectedChain);
});
