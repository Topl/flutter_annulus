import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/chain/utils/constants.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  required int skipCount,
  required DateTime endTime,
  required Chains selectedChain,
  required Ref ref,
}) async {
  var currentBlockEndTime = DateTime.now();
  var currentBlockDepth = 0;

  Map<DateTime, double> results = {};

  while (currentBlockEndTime.isAfter(endTime)) {
    final Block block = await ref.read(getBlockByDepthProvider(currentBlockDepth).future);

    // TODO, this should be replaced with transaction provider methods
    var blockRes = await ref.read(genusProvider(selectedChain)).getBlockByDepth(depth: currentBlockDepth);

    if (blockRes.block.fullBody.hasField(1)) {
      int transactionCount = blockRes.block.fullBody.transactions.length;

      //continue going through transactions
      for (int i = 0; i < transactionCount; i++) {
        // QQQQ need to figure out how to get transaction fee
        final transaction = blockRes.block.fullBody.transactions[i];
        final iDouble = i.toDouble();

        final blockTime = DateTime.fromMillisecondsSinceEpoch(block.timestamp);

        if (results.containsKey(blockTime)) {
          results[blockTime] = (results[blockTime]! + iDouble) / 2;
        } else {
          results[blockTime] = iDouble;
        }
      }

      currentBlockDepth += skipCount;
      currentBlockEndTime = DateTime.fromMillisecondsSinceEpoch(block.timestamp);
    }
  }
  return ChartResult(results: results);
}

/// The Following proivders are [FutureProvider] that returns a [ChartResult] object
/// containing a map of [DateTime] objects to [double] values representing the average
/// transaction fee for each block within the specified time frame.

final averageTransactionFeeDayProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: chartDaySkipAmount,
    endTime: chartDayEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeWeekProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: chartWeekSkipAmount,
    endTime: chartWeekEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeTwoWeeksProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: chartTwoWeekSkipAmount,
    endTime: chartTwoWeekEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeMonthProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: chartMonthSkipAmount,
    endTime: chartMonthEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeThreeMonthsProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: chartThreeMonthSkipAmount,
    endTime: chartThreeMonthEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeSixMonthsProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: chartSixMonthSkipAmount,
    endTime: chartSixMonthEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeYearProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: chartYearSkipAmount,
    endTime: chartYearEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeAllProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: chartAllSkipAmount,
    endTime: chartAllEndTime,
    selectedChain: selectedChain,
    ref: ref,
  );
});
