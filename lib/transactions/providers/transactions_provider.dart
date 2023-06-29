import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_annulus/shared/utils/get_chain_id.dart';

import '../../blocks/models/block.dart';

/// TODO: This provider is just mock data currently
/// It is also untested, so it may not work in practice
final transactionsProvider =
    StateNotifierProvider<TransactionsNotifier, AsyncValue<List<Transaction>>>(
        (ref) {
  return TransactionsNotifier(ref);
});

class TransactionsNotifier
    extends StateNotifier<AsyncValue<List<Transaction>>> {
  final Ref ref;
  TransactionsNotifier(this.ref) : super(const AsyncLoading()) {
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
    if (setState) state = const AsyncLoading();
    final List<Transaction> transactions = [];

    //get most recent block
    const tempChain = Chains.private_network;
    final genusClient = ref.read(genusProvider(tempChain));

    var latestBlockRes = await genusClient.getBlockByDepth(depth: 0);
    int transactionCount = latestBlockRes.block.fullBody.transactions.length;

    var latestBlock = Block(
      header: getChainId(latestBlockRes.block.header.headerId.value),
      epoch: 243827,
      size: 5432.2,
      height: latestBlockRes.block.header.height.toInt(),
      slot: latestBlockRes.block.header.slot.toInt(),
      timestamp: latestBlockRes.block.header.timestamp.toInt(),
      transactionNumber: transactionCount,
    );

    //continue going through transactions, fetch new block if necessary
    for (int i = 0; i < transactionCount; i++) {
      final iString = i.toString();
      final iDouble = i.toDouble();

      //calculate transaction amount
      //calculate transaction amount
      var txAmount = latestBlockRes
          .block.fullBody.transactions[i].inputs[0].value.lvl.quantity.value
          .reduce((value, element) => value + element);

      transactions.add(
        Transaction(
          transactionId: getChainId(latestBlockRes
              .block.fullBody.transactions[0].transactionId.value),
          status: TransactionStatus.pending,
          block: latestBlock,
          broadcastTimestamp: latestBlock.timestamp,
          confirmedTimestamp:
              0, //for the latest block, it will never be confirmed (confirmation depth is 5)
          transactionType: TransactionType.transfer,
          amount: txAmount.toDouble(),
          transactionFee: iDouble,
          senderAddress: getChainId(latestBlockRes
              .block.fullBody.transactions[0].inputs[0].address.id.value),
          receiverAddress: iString,
          transactionSize: i,
          proposition: iString,
          quantity: i,
          name: iString,
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

  /// This method is used to get a single transaction
  ///
  /// It takes a [transactionId] as a parameter
  /// and returns a [AsyncValue<Transaction>]
  AsyncValue<Transaction> getSingleTransaction({
    required String transactionId,
  }) {

    // var block = await genusClient.getBlockById(
    //     blockId: transactionRes.transactionReceipt.blockId.value);

    var block = const Block(
      header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZu",
      epoch: 243827,
      size: 5432.2,
      height: 10,
      slot: 5,
      timestamp: 243827,
      transactionNumber: 127,
    );

    var transaction = Transaction(
        transactionId: getChainId(
            transactionRes.transactionReceipt.transaction.transactionId.value),
        status: TransactionStatus.confirmed,
        block: block,
        broadcastTimestamp: 243827,
        confirmedTimestamp: 243827,
        transactionType: TransactionType.transfer,
        amount: 10,
        transactionFee: 10,
        senderAddress: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w",
        receiverAddress: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w",
        transactionSize: 10,
        proposition: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w",
        quantity: 10,
        name: "transaction");

    return AsyncValue.data(transaction);
  }
}
