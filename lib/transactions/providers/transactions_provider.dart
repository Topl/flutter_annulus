import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:flutter_annulus/genus/providers/genus_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    const int totalTransactions = 10;

    for (int i = 0; i < totalTransactions; i++) {
      final iString = i.toString();
      final iDouble = i.toDouble();
      transactions.add(
        Transaction(
          transactionId: "8EhwUBiHJ3evyGidV1WH8Q8EhwUBiHJ3evyGidV1WH8Q",
          status: TransactionStatus.confirmed,
          block: Block(
            blockId: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w$iString",
            header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZu$iString",
            epoch: 243827 - i,
            size: 5432.2,
            height: 1000 + 1,
            slot: 10,
            timestamp: 1683494060 + i,
            transactionNumber: 200,
            withdrawalNumber: 127,
          ),
          broadcastTimestamp: DateTime.now().millisecondsSinceEpoch,
          confirmedTimestamp: DateTime.now().millisecondsSinceEpoch,
          transactionType: TransactionType.transfer,
          amount: iDouble,
          transactionFee: iDouble,
          senderAddress: iString,
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
    var block = const Block(
      blockId: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w",
      header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZu",
      epoch: 243827,
      size: 5432.2,
      height: 10,
      slot: 5,
      timestamp: 243827,
      transactionNumber: 127,
      withdrawalNumber: 127,
    );

    var transaction = Transaction(
      transactionId: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w",
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
      name: "transaction",
    );

    return AsyncValue.data(transaction);
  }
}
