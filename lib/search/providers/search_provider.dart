import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/search/models/search_result.dart';
import 'package:flutter_annulus/search/models/utxo.dart';
import 'package:flutter_annulus/shared/models/logger.dart';
import 'package:flutter_annulus/shared/providers/logger_provider.dart';
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
  return SearchNotifier(ref);
});

class SearchNotifier extends StateNotifier<AsyncValue<List<SearchResult>>> {
  final Ref ref;
  SearchNotifier(this.ref) : super(const AsyncLoading());

  /// Search for blocks, transactions and utxos
  ///
  /// Returns a list of [SearchResult]
  Future<List<SearchResult>> searchById(String id) async {
    final BlockResult? block = await _searchForBlockById(id);
    final TransactionResult? transaction = await _searchForTransactionById(id);
    final UTxOResult? utxo = await _searchForUTxOById(id);

    if (block == null && transaction == null && utxo == null) {
      state = AsyncError('No results found', StackTrace.current);
      return [];
    }

    final result = [if (block != null) block, if (transaction != null) transaction, if (utxo != null) utxo];
    state = AsyncData(result);
    return result;
  }

  Future<BlockResult?> _searchForBlockById(String id) async {
    try {
      return Future.delayed(const Duration(milliseconds: 250), () {
        return const BlockResult(
          Block(
            blockId: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w",
            header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZu",
            epoch: 243827,
            size: 5432.2,
            height: 1000 + 1,
            slot: 10,
            timestamp: 1683494060,
            transactionNumber: 200,
            withdrawalNumber: 127,
          ),
        );
      });
    } catch (e) {
      ref.read(loggerProvider).log(
            logLevel: LogLevel.Warning,
            loggerClass: LoggerClass.ApiError,
            message: 'Block not found for id: $id',
          );

      return null;
    }
  }

  Future<TransactionResult?> _searchForTransactionById(String id) async {
    try {
      return Future.delayed(const Duration(milliseconds: 250), () {
        return TransactionResult(
          Transaction(
            transactionId: "8EhwUBiHJ3evyGidV1WH8Q8EhwUBiHJ3evyGidV1WH8Q",
            status: TransactionStatus.confirmed,
            block: const Block(
              blockId: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w",
              header: "vytVMYVjgHDHAc7AwA2Qu7JE3gPHddaTPbFWvqb2gZu",
              epoch: 243827,
              size: 5432.2,
              height: 1000 + 1,
              slot: 10,
              timestamp: 1683494060,
              transactionNumber: 200,
              withdrawalNumber: 127,
            ),
            broadcastTimestamp: DateTime.now().millisecondsSinceEpoch,
            confirmedTimestamp: DateTime.now().millisecondsSinceEpoch,
            transactionType: TransactionType.transfer,
            amount: 1,
            transactionFee: 1,
            senderAddress: '1',
            receiverAddress: '1',
            transactionSize: 1,
            proposition: '1',
            quantity: 1,
            name: '1',
          ),
        );
      });
    } catch (e) {
      ref.read(loggerProvider).log(
            logLevel: LogLevel.Warning,
            loggerClass: LoggerClass.ApiError,
            message: 'Transaction not found for id: $id',
          );

      return null;
    }
  }

  Future<UTxOResult?> _searchForUTxOById(String id) async {
    try {
      return UTxOResult(UTxO());
    } catch (e) {
      ref.read(loggerProvider).log(
            logLevel: LogLevel.Warning,
            loggerClass: LoggerClass.ApiError,
            message: 'UTxO not found for id: $id',
          );

      return null;
    }
  }

  void clearSearch() {
    state = const AsyncValue.data([]);
  }
}
