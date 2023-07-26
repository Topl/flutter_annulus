import 'package:flutter/cupertino.dart';
import 'package:flutter_annulus/shared/utils/extensions.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:flutter_annulus/shared/providers/config_provider.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/transactions/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../blocks/models/block.dart';

final transactionStateAtIndexProvider = FutureProvider.family<Transaction, int>((ref, index) async {
  return ref.watch(transactionsProvider.notifier).getTransactionFromStateAtIndex(index);
});

final getTransactionByIdProvider = FutureProvider.family<Transaction, String>((ref, transactionId) async {
  final selectedChain = ref.watch(selectedChainProvider);
  final genusClient = ref.read(genusProvider(selectedChain));

  final config = ref.read(configProvider.future);
  final presentConfig = await config;

  var transactionRes = await genusClient.getTransactionById(transactionIdString: transactionId);

  var blockRes = await genusClient.getBlockById(
    blockIdBytes: transactionRes.transactionReceipt.blockId.value,
  );

  var block = Block(
    header: decodeId(blockRes.block.header.headerId.value),
    epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
    size: 5432.2,
    height: blockRes.block.header.height.toInt(),
    slot: blockRes.block.header.slot.toInt(),
    timestamp: blockRes.block.header.timestamp.toInt(),
    transactionNumber: blockRes.block.fullBody.transactions.length,
  );

  //calculate values for fields
  var inputList = transactionRes.transactionReceipt.transaction.inputs.toList();
  var outputList = transactionRes.transactionReceipt.transaction.outputs.toList();
  var txAmount = calculateAmount(outputs: outputList);
  var txFees = calculateFees(inputs: inputList, outputs: outputList);

  var transaction = Transaction(
      transactionId: decodeId(transactionRes.transactionReceipt.transaction.transactionId.value),
      status: TransactionStatus.confirmed,
      block: block,
      broadcastTimestamp: transactionRes.transactionReceipt.transaction.datum.event.schedule.timestamp.toInt(),
      confirmedTimestamp: block.timestamp,
      transactionType: TransactionType.transfer,
      amount: txAmount.toDouble(),
      transactionFee: txFees.toDouble(),
      senderAddress:
          transactionRes.transactionReceipt.transaction.inputs.map((e) => decodeId(e.address.id.value)).toList(),
      receiverAddress:
          transactionRes.transactionReceipt.transaction.outputs.map((e) => decodeId(e.address.id.value)).toList(),
      transactionSize: transactionRes.writeToBuffer().lengthInBytes.toDouble(),
      quantity: 10,
      name: transactionRes.transactionReceipt.transaction.inputs[0].value.hasLvl() ? 'Lvl' : 'Topl');

  return transaction;
});

final getTransactionsByDepthProvider = FutureProvider.family<List<Transaction>, int>((ref, depth) async {
  final List<Transaction> transactions = [];
  //get most recent block
  final selectedChain = ref.read(selectedChainProvider.notifier).state;
  final genusClient = ref.read(genusProvider(selectedChain));

  var blockRes = await genusClient.getBlockByDepth(depth: depth);
  final config = ref.read(configProvider.future);
  final presentConfig = await config;

  //check that fullBody is not empty
  if (blockRes.block.fullBody.hasField(1)) {
    int transactionCount = blockRes.block.fullBody.transactions.length;

    var latestBlock = Block(
      header: decodeId(blockRes.block.header.headerId.value),
      epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
      size: blockRes.writeToBuffer().lengthInBytes.toDouble(),
      height: blockRes.block.header.height.toInt(),
      slot: blockRes.block.header.slot.toInt(),
      timestamp: blockRes.block.header.timestamp.toInt(),
      transactionNumber: transactionCount,
    );

    //continue going through transactions
    for (int i = 0; i < transactionCount; i++) {
      final iDouble = i.toDouble();

      //calculate transaction amount
      var inputList = blockRes.block.fullBody.transactions[i].inputs.toList();
      var outputList = blockRes.block.fullBody.transactions[i].outputs.toList();
      var txAmount = calculateAmount(outputs: outputList);
      var txFees = calculateFees(inputs: inputList, outputs: outputList);

      transactions.add(
        Transaction(
          transactionId: decodeId(blockRes.block.fullBody.transactions[i].transactionId.value),
          status: TransactionStatus.pending,
          block: latestBlock,
          broadcastTimestamp: latestBlock.timestamp,
          confirmedTimestamp: 0, //for the latest block, it will never be confirmed (confirmation depth is 5)
          transactionType: TransactionType.transfer,
          amount: txAmount.toDouble(),
          transactionFee: txFees.toDouble(),
          senderAddress:
              blockRes.block.fullBody.transactions[i].inputs.map((e) => decodeId(e.address.id.value)).toList(),
          receiverAddress:
              blockRes.block.fullBody.transactions[i].outputs.map((e) => decodeId(e.address.id.value)).toList(),
          transactionSize: blockRes.block.fullBody.transactions[i].writeToBuffer().lengthInBytes.toDouble(),
          quantity: i,
          name: blockRes.block.fullBody.transactions[i].inputs[0].value.hasLvl() ? 'Lvl' : 'Topl',
        ),
      );
    }
  }

  return transactions;
});

/// It is also untested, so it may not work in practice
final transactionsProvider = StateNotifierProvider<TransactionsNotifier, AsyncValue<List<Transaction>>>((ref) {
  final selectedChain = ref.watch(selectedChainProvider);
  return TransactionsNotifier(
    ref,
    selectedChain,
  );
});

class TransactionsNotifier extends StateNotifier<AsyncValue<List<Transaction>>> {
  final Ref ref;
  final Chains selectedChain;
  TransactionsNotifier(this.ref, this.selectedChain) : super(const AsyncLoading()) {
    getTransactions(setState: true);
  }

  /// This method is used to get the list of transactions
  /// and update the state of the provider
  ///
  /// It takes a bool [setState]
  ///
  /// If [setState] is true, it will update the state of the provider
  /// If [setState] is false, it will not update the state of the provider
  Future<List<Transaction>> getTransactions({
    bool setState = false,
  }) async {
    if (selectedChain == Chains.mock) {
      final transactions = List.generate(100, (index) => getMockTransaction());
      if (setState) state = AsyncData(transactions);
      return transactions;
    } else {
      if (setState) state = const AsyncLoading();
      final List<Transaction> transactions = [];
      //get most recent block
      final selectedChain = ref.read(selectedChainProvider.notifier).state;
      final genusClient = ref.read(genusProvider(selectedChain));
      int depth = 0;

      //TODO: figure out a better way since a ton of empty blocks means this is taking too long
      var latestBlockRes = await genusClient.getBlockByDepth(depth: depth);
      //check that block has transactions
      while (!latestBlockRes.block.fullBody.hasField(1)) {
        depth++;
        latestBlockRes = await genusClient.getBlockByDepth(depth: depth);
      }
      final config = ref.read(configProvider.future);
      final presentConfig = await config;

      int transactionCount = latestBlockRes.block.fullBody.transactions.length;

      var latestBlock = Block(
        header: decodeId(latestBlockRes.block.header.headerId.value),
        epoch: latestBlockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
        size: 5432.2,
        height: latestBlockRes.block.header.height.toInt(),
        slot: latestBlockRes.block.header.slot.toInt(),
        timestamp: latestBlockRes.block.header.timestamp.toInt(),
        transactionNumber: transactionCount,
      );

      //continue going through transactions
      for (int i = 0; i < transactionCount; i++) {
        final iDouble = i.toDouble();

        //calculate transaction amount
        var outputList = latestBlockRes.block.fullBody.transactions[i].outputs.toList();
        var inputList = latestBlockRes.block.fullBody.transactions[i].inputs.toList();
        var txAmount = calculateAmount(outputs: outputList);
        var txFees = calculateFees(inputs: inputList, outputs: outputList);

        transactions.add(
          Transaction(
            transactionId: decodeId(latestBlockRes.block.fullBody.transactions[i].transactionId.value),
            status: TransactionStatus.pending,
            block: latestBlock,
            broadcastTimestamp: latestBlock.timestamp,
            confirmedTimestamp: 0, //for the latest block, it will never be confirmed (confirmation depth is 5)
            transactionType: TransactionType.transfer,
            amount: txAmount.toDouble(),
            transactionFee: txFees.toDouble(),
            senderAddress:
                latestBlockRes.block.fullBody.transactions[i].inputs.map((e) => decodeId(e.address.id.value)).toList(),
            receiverAddress:
                latestBlockRes.block.fullBody.transactions[i].outputs.map((e) => decodeId(e.address.id.value)).toList(),
            transactionSize: latestBlockRes.block.fullBody.transactions[i].writeToBuffer().lengthInBytes.toDouble(),
            quantity: i,
            name: latestBlockRes.block.fullBody.transactions[i].inputs[0].value.hasLvl() ? 'Lvl' : 'Topl',
          ),
        );
      }
      if (setState) {
        Future.delayed(const Duration(seconds: 1), () {
          state = AsyncData(transactions);
        });
      }
      return transactions;
    }
  }

  /// This method is used to get a transaction at a specific index
  /// If the transaction is not in the state, it will fetch the transaction from Genus
  /// It takes an [index] as a parameter
  ///
  /// It returns a [Future<Transaction>]
  Future<Transaction> getTransactionFromStateAtIndex(int index) async {
    final transactions = state.asData?.value;

    if (transactions == null) {
      throw Exception('Error in transactionsProvider: transactions are null');
    }

    // If the index is less than the length of the list, return the transaction at that index
    if (index < transactions.length) {
      return transactions[index];
    } else {
      final genusClient = ref.read(genusProvider(selectedChain));
      //get final transaction in state
      Transaction lastTransaction = transactions.last;
      //get block that contains the last transaction
      final lastTransactionBlock = await genusClient.getBlockById(blockIdString: lastTransaction.block.header);
      //find transaction in block
      int indexInBlock = lastTransactionBlock.block.fullBody.transactions.indexWhere((transaction) {
        return decodeId(transaction.transactionId.value) == lastTransaction.transactionId;
      });

      Transaction newTransaction;
      //calculate transaction amount
      dynamic outputList;
      dynamic inputList;
      dynamic txAmount;
      dynamic txFees;
      if (indexInBlock < lastTransactionBlock.block.fullBody.transactions.length - 1) {
        //use next transaction in block
        outputList = lastTransactionBlock.block.fullBody.transactions[indexInBlock + 1].outputs.toList();
        inputList = lastTransactionBlock.block.fullBody.transactions[indexInBlock + 1].inputs.toList();
        txAmount = calculateAmount(outputs: outputList);
        txFees = calculateFees(inputs: inputList, outputs: outputList);

        newTransaction = Transaction(
          transactionId:
              decodeId(lastTransactionBlock.block.fullBody.transactions[indexInBlock + 1].transactionId.value),
          status: TransactionStatus.pending,
          block: lastTransaction.block,
          broadcastTimestamp: lastTransaction.block.timestamp,
          confirmedTimestamp: 0,
          transactionType: TransactionType.transfer,
          amount: txAmount.toDouble(),
          transactionFee: txFees.toDouble(),
          senderAddress: lastTransactionBlock.block.fullBody.transactions[indexInBlock + 1].inputs
              .map((e) => decodeId(e.address.id.value))
              .toList(),
          receiverAddress: lastTransactionBlock.block.fullBody.transactions[indexInBlock + 1].outputs
              .map((e) => decodeId(e.address.id.value))
              .toList(),
          transactionSize: lastTransactionBlock.block.fullBody.transactions[indexInBlock + 1]
              .writeToBuffer()
              .lengthInBytes
              .toDouble(),
          quantity: 10,
          name: lastTransactionBlock.block.fullBody.transactions[indexInBlock + 1].inputs[0].value.hasLvl()
              ? 'Lvl'
              : 'Topl',
        );
        transactions.add(newTransaction);
      } else {
        //fetch new block descending in height
        final config = ref.read(configProvider.future);
        final presentConfig = await config;

        final nextBlockRes = await genusClient.getBlockByHeight(height: lastTransaction.block.height - 1);
        var nextBlock = Block(
          header: decodeId(nextBlockRes.block.header.headerId.value),
          epoch: nextBlockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
          size: nextBlockRes.writeToBuffer().lengthInBytes.toDouble(),
          height: nextBlockRes.block.header.height.toInt(),
          slot: nextBlockRes.block.header.slot.toInt(),
          timestamp: nextBlockRes.block.header.timestamp.toInt(),
          transactionNumber: nextBlockRes.block.fullBody.transactions.length,
        );

        outputList = nextBlockRes.block.fullBody.transactions[indexInBlock + 1].outputs.toList();
        inputList = nextBlockRes.block.fullBody.transactions[indexInBlock + 1].inputs.toList();
        txAmount = calculateAmount(outputs: outputList);
        txFees = calculateFees(inputs: inputList, outputs: outputList);

        newTransaction = Transaction(
          transactionId: decodeId(nextBlockRes.block.fullBody.transactions[0].transactionId.value),
          status: TransactionStatus.pending,
          block: nextBlock,
          broadcastTimestamp: nextBlock.timestamp,
          confirmedTimestamp: 0,
          transactionType: TransactionType.transfer,
          amount: txAmount.toDouble(),
          transactionFee: txFees.toDouble(),
          senderAddress: nextBlockRes.block.fullBody.transactions[indexInBlock + 1].inputs
              .map((e) => decodeId(e.address.id.value))
              .toList(),
          receiverAddress: nextBlockRes.block.fullBody.transactions[indexInBlock + 1].outputs
              .map((e) => decodeId(e.address.id.value))
              .toList(),
          transactionSize: nextBlockRes.block.fullBody.transactions[0].writeToBuffer().lengthInBytes.toDouble(),
          quantity: 10,
          name: nextBlockRes.block.fullBody.transactions[indexInBlock + 1].inputs[0].value.hasLvl() ? 'Lvl' : 'Topl',
        );

        transactions.add(newTransaction);
      }

      state = AsyncData([...transactions]);

      // Return that block
      return newTransaction;
    }
  }
}
