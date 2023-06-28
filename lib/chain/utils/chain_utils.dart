import 'package:flutter_annulus/chain/models/chain.dart';

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
