import 'package:flutter_annulus/blocks/utils/extensions.dart';
import 'package:flutter_annulus/blocks/utils/utils.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/genus/providers/genus_provider.dart';
import 'package:flutter_annulus/search/models/search_result.dart';
import 'package:flutter_annulus/shared/models/logger.dart';
import 'package:flutter_annulus/shared/providers/logger_provider.dart';
import 'package:flutter_annulus/shared/providers/mock_state_provider.dart';
import 'package:flutter_annulus/transactions/models/utxo.dart';
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
final searchProvider =
    StateNotifierProvider<SearchNotifier, AsyncValue<List<SearchResult>>>(
        (ref) {
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
  Future<List<SearchResult>> searchById(int id) async {
    final idString = id.toString();
    final BlockResult? block = await _searchForBlockById(idString);
    final TransactionResult? transaction =
        await _searchForTransactionById(idString);
    final UTxOResult? utxo = await _searchForUTxOById(idString);

    if (block == null && transaction == null && utxo == null) {
      state = AsyncError('No results found', StackTrace.current);
      return [];
    }

    final result = [
      if (block != null) block,
      if (transaction != null) transaction,
      if (utxo != null) utxo
    ];
    state = AsyncData(result);
    return result;
  }

  Future<BlockResult?> _searchForBlockById(String id) async {
    try {
      if (!ref.read(mockStateProvider)) {
        final Chains selectedChain = ref.read(selectedChainProvider);
        final BlockResponse blockResponse = await ref
            .read(genusProvider(selectedChain))
            .getBlockById(blockIdString: id);
        return BlockResult(blockResponse.toBlock());
      } else {
        return Future.delayed(const Duration(milliseconds: 250), () {
          return BlockResult(
            getMockBlock(),
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
        final TransactionResponse response = await ref
            .read(genusProvider(selectedChain))
            .getTransactionById(transactionIdString: id);

        return TransactionResult(response.toTransaction());
      } else {
        return Future.delayed(const Duration(milliseconds: 250), () {
          return TransactionResult(
            getMockTransaction(),
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

      return UTxOResult(utxo);
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
