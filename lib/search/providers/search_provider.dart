import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/search/models/search_result.dart';
import 'package:flutter_annulus/search/models/utxo.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// This provider returns a [AsyncValue<List<SearchResult>>]
///
/// Usage Example:
///
/// ```dart
/// final searchNotifier = ref.watch(searchProvider.notifier);
/// searchNotifier.search(query);
///
/// final searchResult = ref.watch(searchProvider);
/// searchResult.when(
///  data: (SearchResult result) {
///     return result.map(
///       block: (BlockResult result) {
///        final Block block = result.block;
///         // Show block
///       },
///       transaction: (TransactionResult result) {
///       final Transaction transaction = result.transaction;
///         // Show transaction
///       },
///       utxo: (UTxOResult result) {
///      final UTxO utxo = result.utxo;
///         // Show utxo
///       },
///   },
///   loading: () {
///    // Show loading indicator
///   },
///   error: (error, stackTrace) {
///   // Show error message
///   },
///  );
/// ```
final searchProvider = StateNotifierProvider<SearchNotifier, AsyncValue<List<SearchResult>>>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<AsyncValue<List<SearchResult>>> {
  SearchNotifier() : super(const AsyncLoading());

  Future<List<SearchResult>> search(String query) async {
    final List<BlockResult> blocks = await _searchBlocks(query);
    final List<TransactionResult> transactions = await _searchTransactions(query);
    final List<UTxOResult> utxos = await _searchUTxOs(query);
    final result = [...blocks, ...transactions, ...utxos];
    state = AsyncData(result);
    return result;
    // Add Transaction
  }

  Future<List<BlockResult>> _searchBlocks(String query) {
    return Future.delayed(const Duration(milliseconds: 250), () {
      return List.generate(3, (i) {
        final iString = i.toString();
        return BlockResult(
          Block(
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
        );
      });
    });
  }

  Future<List<TransactionResult>> _searchTransactions(String query) {
    return Future.delayed(const Duration(milliseconds: 250), () {
      return List.generate(3, (i) {
        final iString = i.toString();
        final iDouble = i.toDouble();
        return TransactionResult(
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
      });
    });
  }

  Future<List<UTxOResult>> _searchUTxOs(String query) async {
    return List.generate(3, (i) {
      return UTxOResult(UTxO());
    });
  }

  void clearSearch() {
    state = const AsyncValue.data([]);
  }
}
