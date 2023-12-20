import 'package:flutter_annulus/blocks/utils/utils.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:flutter_annulus/shared/utils/extensions.dart';
import 'package:topl_common/proto/brambl/models/transaction/spent_transaction_output.pb.dart';
import 'package:topl_common/proto/brambl/models/transaction/unspent_transaction_output.pb.dart';

import '../../blocks/models/block.dart';

Transaction getMockTransaction([int? i]) {
  final baseTransation = Transaction(
    transactionId: "8EhwUBiHJ3evyGidV1WH8Q8EhwUBiHJ3evyGidV1WH8Q",
    status: TransactionStatus.confirmed,
    block: getMockBlock(i),
    broadcastTimestamp: DateTime.now().millisecondsSinceEpoch,
    confirmedTimestamp: DateTime.now().millisecondsSinceEpoch,
    transactionType: TransactionType.transfer,
    amount: 1,
    quantity: 10,
    transactionFee: 1,
    senderAddress: ['1234567890123456789012345678901234567890'],
    receiverAddress: ['1234567890123456789012345678901234567890'],
    transactionSize: 1,
    name: '1234567890',
    metadata:
        'Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata Some metadata',
  );

  return i != null
      ? baseTransation.copyWith(transactionId: "${i}8EhwUBiHJ3evyGidV1WH8Q8EhwUBiHJ3evyGidV1WH8Q")
      : baseTransation;
}

List<BigInt> getInputBigInts({required List<SpentTransactionOutput> inputs}) {
  List<SpentTransactionOutput> inputLvls = inputs.where((element) {
    return element.value.hasLvl();
  }).toList();

  return inputLvls.map((e) {
    return e.value.lvl.quantity.value.toBigInt;
  }).toList();
}

List<BigInt> getOutputBigInts({required List<UnspentTransactionOutput> outputs}) {
  List<UnspentTransactionOutput> outputLvls = outputs.where((element) {
    return element.value.hasLvl();
  }).toList();
  try {
    return outputLvls.map((e) {
      return e.value.lvl.quantity.value.toBigInt;
    }).toList();
  } catch (e) {
    return [];
  }
}

BigInt calculateAmount({required List<UnspentTransactionOutput> outputs}) {
  List<BigInt> outputBigInts = getOutputBigInts(outputs: outputs);
  if (outputBigInts.isEmpty) {
    return BigInt.zero;
  }
  return outputBigInts.reduce((value, element) => value + element);
}

BigInt calculateFees({required List<SpentTransactionOutput> inputs, required List<UnspentTransactionOutput> outputs}) {
  List<BigInt> inputBigInts = getInputBigInts(inputs: inputs);
  List<BigInt> outputBigInts = getOutputBigInts(outputs: outputs);

  if (inputBigInts.isEmpty || outputBigInts.isEmpty) {
    return BigInt.zero;
  }

  BigInt inputSum = inputBigInts.reduce((value, element) => value + element);
  BigInt outputSum = outputBigInts.reduce((value, element) => value + element);

  return inputSum - outputSum;
}

Map<int, Block> sortBlocksByDepth({required Map<int, Block> blocks}) {
  final listOfBlocks = [...blocks.values.toList()];
  listOfBlocks.sort((a, b) => b.height.compareTo(a.height));
  return listOfBlocks.asMap();
}

String shortenNetwork(Chains chain) {
  return chain.networkName.length > 8 ? '${chain.networkName.substring(0, 7)}...' : chain.networkName;
}
