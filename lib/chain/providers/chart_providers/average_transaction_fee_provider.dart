import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/models/chart_result.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

final averageTransactionFeeDayProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: 1,
    endTime: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeWeekProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: 5,
    endTime: DateTime.now().subtract(
      const Duration(days: 7),
    ),
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeTwoWeeksProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: 10,
    endTime: DateTime.now().subtract(
      const Duration(days: 14),
    ),
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeMonthProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: 20,
    endTime: DateTime.now().subtract(
      const Duration(days: 30),
    ),
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeThreeMonthsProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: 60,
    endTime: DateTime.now().subtract(
      const Duration(days: 90),
    ),
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeSixMonthsProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: 120,
    endTime: DateTime.now().subtract(
      const Duration(days: 180),
    ),
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeYearProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: 240,
    endTime: DateTime.now().subtract(
      const Duration(days: 365),
    ),
    selectedChain: selectedChain,
    ref: ref,
  );
});

final averageTransactionFeeAllProvider = FutureProvider<ChartResult>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  return _getTransactionFee(
    skipCount: 480,
    endTime: DateTime.fromMillisecondsSinceEpoch(0),
    selectedChain: selectedChain,
    ref: ref,
  );
});
