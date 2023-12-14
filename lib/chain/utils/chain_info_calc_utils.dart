import 'package:topl_common/genus/data_extensions.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';

double calculateEpochDuration({
  required FetchEpochDataRes chainData,
  required int currentTimestamp,
}) {
  final int startTimestamp = chainData.epochData.startTimestamp.toInt();

  final double epochDuration = (currentTimestamp - startTimestamp) / 1000;
  return epochDuration;
}

double calculateAverageTransactionFee({
  required FetchEpochDataRes chainData,
}) {
  final int totalTransactionsInEpoch = chainData.epochData.transactionCount.toInt();
  final totalTransactionReward = chainData.epochData.totalTransactionReward.toBigInt();
  return totalTransactionReward.toInt() / totalTransactionsInEpoch;
}

int calculateAverageBlockTime({
  required FetchEpochDataRes chainData,
  required int currentTimestamp,
}) {
  final int endBlocks = chainData.epochData.endHeight.toInt();
  final int startBlocks = chainData.epochData.startHeight.toInt();

  final int totalBlocksInEpoch = endBlocks - startBlocks;

  final double epochDuration = calculateEpochDuration(
    chainData: chainData,
    currentTimestamp: currentTimestamp,
  );

  final int averageBlockTime = totalBlocksInEpoch == 0 ? 0 : (epochDuration / totalBlocksInEpoch).round();
  return averageBlockTime;
}

double calculateDataThroughput({
  required FetchEpochDataRes chainData,
  required int currentTimestamp,
}) {
  final int dataBytes = chainData.epochData.dataBytes.toInt();

  final double epochDuration = calculateEpochDuration(
    chainData: chainData,
    currentTimestamp: currentTimestamp,
  );

  // Convert milliseconds to seconds

  final double dataThroughput = double.parse((dataBytes / (epochDuration)).toStringAsFixed(2));
  return dataThroughput;
}
