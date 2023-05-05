import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// TODO: This provider is just mock data currently
/// It is also untested, so it may not work in practice
final transactionsProvider = StateNotifierProvider<TransactionsNotifier, AsyncValue<List<Transaction>>>((ref) {
  return TransactionsNotifier();
});

class TransactionsNotifier extends StateNotifier<AsyncValue<List<Transaction>>> {
  TransactionsNotifier() : super(const AsyncLoading()) {
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
          transactionId: iString,
          status: TransactionStatus.confirmed,
          block: i,
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
    return state.when(
      data: (data) => AsyncData(data.firstWhere((element) => element.transactionId == transactionId)),
      error: (error, stakeTrace) => AsyncError(error, stakeTrace),
      loading: () => const AsyncLoading(),
    );
  }
}
