import 'package:flutter/foundation.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/providers/chain_statistics_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/chains.dart';

Chain getMockChain() {
  return const Chain(
    dataThroughput: 39.887,
    averageTransactionFee: 3.71,
    uniqueActiveAddresses: 2076,
    eon: 2,
    era: 5,
    epoch: 72109,
    totalTransactionsInEpoch: 266,
    height: 22100762,
    averageBlockTime: 127,
    totalStake: .77,
    registeredStakes: 519,
    activeStakes: 453,
    inactiveStakes: 66,
  );
}

Chains getDefaultChain() {
  return kDebugMode ? const Chains.private_network() : const Chains.topl_mainnet();
}

Future<int> blockSkipAmount({
  required int timeFrame,
  required Ref ref,
  required Block blockAtHeight0,
}) async {
  const int skipCount = 100;

  var chainInfo = ref.read(chainStatisticsProvider);
  var averageBlockTime = chainInfo.asData!.value.averageBlockTime;
  var blockSkipAmount = (timeFrame / (averageBlockTime * skipCount)).round();

  if (blockSkipAmount < 1) {
    return 1;
  }

  // Calculate the height difference between the block at depth 0 and the block at depth skipCount
  var heightDifference = blockSkipAmount * skipCount;
  if (heightDifference > blockAtHeight0.height) {
    final blockAtDepth0Time = DateTime.fromMillisecondsSinceEpoch(blockAtHeight0.timestamp);
    final blockAtHeight0Time = DateTime.fromMillisecondsSinceEpoch(blockAtHeight0.timestamp);

    final timeDifference = blockAtDepth0Time.difference(blockAtHeight0Time).inSeconds;

    blockSkipAmount = (timeDifference / (averageBlockTime * skipCount)).round();
  }
  return blockSkipAmount;
}
