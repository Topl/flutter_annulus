import 'package:flutter_annulus/blocks/utils/extensions.dart';
import 'package:flutter_annulus/blocks/utils/utils.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/genus/providers/genus_provider.dart';
import 'package:flutter_annulus/search/models/search_result.dart';
import 'package:flutter_annulus/search/models/utxo.dart';
import 'package:flutter_annulus/shared/models/logger.dart';
import 'package:flutter_annulus/shared/providers/logger_provider.dart';
import 'package:flutter_annulus/shared/providers/mock_state_provider.dart';
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

  /// Search for blocks, transactions and utxos
  ///
  /// Returns a list of [SearchResult]
  ///
  /// Typically the return value is a list of one item,
  /// but it can be more than one item if multiple results are found
  /// IE. An ID returns both a block and a transaction
  Future<List<SearchResult>> searchById(int id) async {
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

  Future<BlockResult?> _searchForBlockById(int id) async {
    try {
      if (!ref.read(mockStateProvider)) {
        final Chains selectedChain = ref.read(selectedChainProvider);
        final BlockResponse blockResponse = await ref.read(genusProvider(selectedChain)).getBlockById(blockId: id);
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

  Future<TransactionResult?> _searchForTransactionById(int id) async {
    try {
      if (!ref.read(mockStateProvider)) {
        final Chains selectedChain = ref.read(selectedChainProvider);
        final TransactionResponse response =
            await ref.read(genusProvider(selectedChain)).getTransactionById(transactionId: id);

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

  Future<UTxOResult?> _searchForUTxOById(int id) async {
    try {
      // TODO: Have to implement find UTxO by id
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
