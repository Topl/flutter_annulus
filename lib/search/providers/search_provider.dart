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

/// This provider is used to determine if the RPC search results are loading.
final isLoadingRpcSearchResultsProvider = StateProvider<bool>((ref) {
  return true;
});

/// This provider is used to search for a [SearchResult] by an ID.
/// It returns a [List] of [SearchResult] objects.
final searchProvider = StateNotifierProvider<SearchNotifier, List<SearchResult>>((ref) {
  return SearchNotifier(ref);
});

class SearchNotifier extends StateNotifier<List<SearchResult>> {
  final Ref ref;
  SearchNotifier(this.ref) : super(const []);

  /// This method is used to search for a [SearchResult] by an ID.
  /// It first searches the current state for a match, then it searches the RPC.
  Future<void> searchById(String id) async {
    _searchState(id);
    await _searchRpc(id);
  }

  /// Searches the current state for matching blocks and transactions.
  _searchState(String id) {
    final currentBlocks = ref.read(blockProvider).asData?.value;
    if (currentBlocks != null) {
      final matchingCurrentBlocks =
          currentBlocks.values.where((Block element) => element.header.toLowerCase().contains(id.toLowerCase()));
      if (matchingCurrentBlocks.isNotEmpty) {
        final results = matchingCurrentBlocks
            .map((Block block) => BlockResult(
                  block,
                  block.header,
                ))
            .toList();
        state = [...state, ...results];
      }
    }

    final currentTransactions = ref.read(transactionsProvider).asData?.value;
    if (currentTransactions != null) {
      final matchingCurrentTransactions = currentTransactions
          .where((Transaction element) => element.transactionId.toLowerCase().contains(id.toLowerCase()));
      if (matchingCurrentTransactions.isNotEmpty) {
        final results = matchingCurrentTransactions
            .map((Transaction transaction) => TransactionResult(
                  transaction,
                  transaction.transactionId,
                ))
            .toList();

        state = [...state, ...results];
      }
    }
  }

  /// Searches for a block, transaction, and UTxO by ID using RPC.
  Future<void> _searchRpc(String id) async {
    ref.read(isLoadingRpcSearchResultsProvider.notifier).state = true;
    final List<SearchResult> results = [];

    final BlockResult? block = await _searchForBlockById(id);
    final TransactionResult? transaction = await _searchForTransactionById(id);
    final UTxOResult? utxo = await _searchForUTxOById(id);

    results.addAll([if (block != null) block, if (transaction != null) transaction, if (utxo != null) utxo]);
    ref.read(isLoadingRpcSearchResultsProvider.notifier).state = false;

    state = [...state, ...results];
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
    state = [];
  }
}
