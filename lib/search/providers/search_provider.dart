import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/blocks/utils/extensions.dart';
import 'package:flutter_annulus/blocks/utils/utils.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/search/models/search_result.dart';
import 'package:flutter_annulus/shared/models/logger.dart';
import 'package:flutter_annulus/shared/providers/logger_provider.dart';
import 'package:flutter_annulus/shared/providers/mock_state_provider.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/utxo.dart';
import 'package:flutter_annulus/transactions/providers/transactions_provider.dart';
import 'package:flutter_annulus/transactions/providers/utxo_provider.dart';
import 'package:flutter_annulus/transactions/utils/extension.dart';
import 'package:flutter_annulus/transactions/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/proto/genus/genus_rpc.pbgrpc.dart';

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

  /// Searches for a list of [SearchResult] objects by the given [id].
  /// Returns a [Future] that completes with the search results.
  ///
  /// If no results are found, an empty list is returned.
  ///
  /// The search results are collected from three different methods:
  /// - [_searchForBlockById]
  /// - [_searchForTransactionById]
  /// - [_searchForUTxOById]
  ///
  /// If any of the results are null, it means no corresponding result was found.
  /// In such cases, the [state] is set to an [AsyncError] with a message and [StackTrace].
  /// Otherwise, the search results are stored in the [state] as an [AsyncData] object.
  ///
  /// Typically the return value is a list of one item,
  /// but it can be more than one item if multiple results are found
  /// IE. An ID returns both a block and a transaction
  Future<List<SearchResult>> searchById(String id) async {
    print('QQQQ searchById: $id');

    final List<SearchResult> results = [];

    final currentBlocks = ref.read(blockProvider).asData?.value;
    if (currentBlocks != null) {
      print('QQQQ looking for matching blocks in currentBlocks: ${currentBlocks.length}');
      final matchingCurrentBlocks =
          currentBlocks.values.where((Block element) => element.header.toLowerCase().contains(id.toLowerCase()));
      print('QQQQ matchingCurrentBlocks: ${matchingCurrentBlocks.length}');
      print('QQQQ matchingCurrentBlocks: ${matchingCurrentBlocks}');
      if (matchingCurrentBlocks.isNotEmpty) {
        results.addAll(matchingCurrentBlocks
            .map((Block block) => BlockResult(
                  block,
                  block.header,
                ))
            .toList());
        state = AsyncData(results);
      }
    }

    final currentTransactions = ref.read(transactionsProvider).asData?.value;
    if (currentTransactions != null) {
      final matchingCurrentTransactions = currentTransactions
          .where((Transaction element) => element.transactionId.toLowerCase().contains(id.toLowerCase()));
      print('QQQQ matchingCurrentTransactions: ${matchingCurrentTransactions.length}');
      if (matchingCurrentTransactions.isNotEmpty) {
        results.addAll(matchingCurrentTransactions
            .map((Transaction transaction) => TransactionResult(
                  transaction,
                  transaction.transactionId,
                ))
            .toList());

        state = AsyncData(results);
      }
    }

    state = AsyncData(results);

    final BlockResult? block = await _searchForBlockById(id);
    final TransactionResult? transaction = await _searchForTransactionById(id);
    final UTxOResult? utxo = await _searchForUTxOById(id);

    results.addAll([if (block != null) block, if (transaction != null) transaction, if (utxo != null) utxo]);

    state = AsyncData(results);
    return results;
  }

  Future<BlockResult?> _searchForBlockById(String id) async {
    try {
      if (!ref.read(mockStateProvider)) {
        final Chains selectedChain = ref.read(selectedChainProvider);
        final BlockResponse blockResponse =
            await ref.read(genusProvider(selectedChain)).getBlockById(blockIdString: id);
        return BlockResult(blockResponse.toBlock(), blockResponse.toBlock().header);
      } else {
        return Future.delayed(const Duration(milliseconds: 250), () {
          return BlockResult(
            getMockBlock(),
            getMockBlock().header,
          );
        });
      }
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
      if (!ref.read(mockStateProvider)) {
        final Chains selectedChain = ref.read(selectedChainProvider);

        final TransactionResponse response =
            await ref.read(genusProvider(selectedChain)).getTransactionById(transactionIdString: id);

        return TransactionResult(
          response.toTransaction(),
          response.toTransaction().transactionId,
        );
      } else {
        return Future.delayed(const Duration(milliseconds: 250), () {
          return TransactionResult(
            getMockTransaction(),
            getMockTransaction().transactionId,
          );
        });
      }
    } catch (e) {
      ref.read(loggerProvider).log(
            logLevel: LogLevel.Warning,
            loggerClass: LoggerClass.ApiError,
            message: 'Transaction not found for id: $id',
          );

      return null;
    }
  }

  // TODO: Are we sure that the id is a int?
  Future<UTxOResult?> _searchForUTxOById(String id) async {
    try {
      final UTxO utxo = await ref.read(utxoByIdProvider(
        id,
      ).future);

      return UTxOResult(utxo, utxo.utxoId);
    } catch (e) {
      ref.read(loggerProvider).log(
            logLevel: LogLevel.Warning,
            loggerClass: LoggerClass.ApiError,
            message: 'UTxO not found for id: $id',
          );

      return null;
    }
  }

  /// Clears the search results by setting the [state] to an empty list.
  void clearSearch() {
    state = const AsyncValue.data([]);
  }
}
