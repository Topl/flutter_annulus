import 'dart:convert';

import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/shared/providers/config_provider.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_annulus/shared/services/hive/hives.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/proto/brambl/models/transaction/io_transaction.pb.dart';

final transactionStateAtIndexProvider = FutureProvider.family<Transaction, int>((ref, index) async {
  return ref.watch(transactionsProvider.notifier).getTransactionFromStateAtIndex(index);
});

final getTransactionByIdProvider = FutureProvider.family<Transaction, String>((ref, transactionId) async {
  return ref.watch(transactionsProvider.notifier).getTransactionById(transactionId: transactionId);
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
      final IoTransaction ioTransaction = blockRes.block.fullBody.transactions[i];
      //calculate transaction amount

      transactions.add(Transaction.fromIoTransaction(
        ioTransaction: ioTransaction,
        associatedBlock: latestBlock,
      ));
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
    getTransactions();
  }

  /// Gets a transaction from genus and adds it to state
  Future<Transaction> getTransactionById({
    required String transactionId,
  }) async {
    final transactions = state.asData?.value;

    // If the list of transactions already contains the transaction, return it
    if (transactions != null && transactions.any((element) => element.transactionId == transactionId)) {
      return transactions.firstWhere((element) => element.transactionId == transactionId);
    } else {
      final selectedChain = ref.watch(selectedChainProvider);
      final genusClient = ref.read(genusProvider(selectedChain));

      final config = ref.read(configProvider.future);
      final presentConfig = await config;

      var transactionRes = await genusClient.getTransactionById(transactionIdString: transactionId);

      var blockRes = await genusClient.getBlockById(
        blockIdBytes: transactionRes.transactionReceipt.blockId.value,
      );

      final block = Block(
        header: decodeId(blockRes.block.header.headerId.value),
        epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
        size: blockRes.writeToBuffer().lengthInBytes.toDouble(),
        height: blockRes.block.header.height.toInt(),
        slot: blockRes.block.header.slot.toInt(),
        timestamp: blockRes.block.header.timestamp.toInt(),
        transactionNumber: blockRes.block.fullBody.transactions.length,
      );

      //calculate values for fields
      final IoTransaction ioTransaction = transactionRes.transactionReceipt.transaction;

      final Transaction transaction = Transaction.fromIoTransaction(
        ioTransaction: ioTransaction,
        associatedBlock: block,
      );

      state = AsyncData([...transactions ?? [], transaction]);
      return transaction;
    }
  }

  /// This method is used to get the list of transactions
  /// and update the state of the provider
  ///
  /// It takes a bool [setState]
  ///
  /// If [setState] is true, it will update the state of the provider
  /// If [setState] is false, it will not update the state of the provider
  Future<void> getTransactions() async {
    if (selectedChain == const Chains.mock()) {
      final transactions = List.generate(100, (index) => getMockTransaction(index));
      state = AsyncData(transactions);
    } else {
      state = const AsyncLoading();
      final List<Transaction> transactions = [];

      try {
        //get first populated block
        var latestBlockRes = await ref.read(getFirstPopulatedBlockProvider(selectedChain).future);
        final config = ref.read(configProvider.future);
        final presentConfig = await config;
        int transactionCount = latestBlockRes.block.fullBody.transactions.length;
        var latestBlock = Block(
          header: decodeId(latestBlockRes.block.header.headerId.value),
          epoch: latestBlockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
          size: latestBlockRes.writeToBuffer().lengthInBytes.toDouble(),
          height: latestBlockRes.block.header.height.toInt(),
          slot: latestBlockRes.block.header.slot.toInt(),
          timestamp: latestBlockRes.block.header.timestamp.toInt(),
          transactionNumber: transactionCount,
        );
        //continue going through transactions
        for (int i = 0; i < transactionCount; i++) {
          // check is transactions exist in cache
          final cachedData =
              await ref.read(hiveProvider).getItem(boxType: Hives.transactions, key: latestBlock.height.toString());
          if (cachedData != null) {
            final List<dynamic> transactionList = jsonDecode(cachedData);
            transactions.addAll(transactionList.map((item) => Transaction.fromJson(item)));
          } else {
            //calculate transaction amount
            final IoTransaction ioTransaction = latestBlockRes.block.fullBody.transactions[i];

            transactions.add(Transaction.fromIoTransaction(
              ioTransaction: ioTransaction,
              associatedBlock: latestBlock,
            ));
            //add to cache
            await ref.read(hiveProvider).putItem(
                  boxType: Hives.transactions,
                  key: latestBlock.height.toString(),
                  value: jsonEncode(transactions),
                );
          }
        }

        state = AsyncData(transactions);
      } catch (e) {
        state = AsyncError(e, StackTrace.current);
      }
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
      Transaction newTransaction;
      final genusClient = ref.read(genusProvider(selectedChain));
      //get final transaction in state
      Transaction lastTransaction = transactions.last;
      //get block that contains the last transaction
      final lastTransactionBlock = await genusClient.getBlockById(blockIdString: lastTransaction.block.header);
      int transactionsInLastBlock = lastTransactionBlock.block.fullBody.transactions.length;
      //find transaction in block
      int indexInBlock = lastTransactionBlock.block.fullBody.transactions.indexWhere((transaction) {
        return decodeId(transaction.transactionId.value) == lastTransaction.transactionId;
      });

      if (indexInBlock < transactionsInLastBlock - 1) {
        //use next transaction in block
        newTransaction = Transaction.fromBlockRes(
            blockRes: lastTransactionBlock, index: indexInBlock + 1, block: lastTransaction.block);
      } else {
        //fetch new block descending in height
        final config = ref.read(configProvider.future);
        final presentConfig = await config;

        final nextBlockRes =
            await ref.read(blockProvider.notifier).getNextPopulatedBlock(height: lastTransaction.block.height - 1);
        var nextBlock = Block(
          header: decodeId(nextBlockRes.block.header.headerId.value),
          epoch: nextBlockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
          size: nextBlockRes.writeToBuffer().lengthInBytes.toDouble(),
          height: nextBlockRes.block.header.height.toInt(),
          slot: nextBlockRes.block.header.slot.toInt(),
          timestamp: nextBlockRes.block.header.timestamp.toInt(),
          transactionNumber: nextBlockRes.block.fullBody.transactions.length,
        );

        newTransaction = Transaction.fromBlockRes(blockRes: nextBlockRes, index: 0, block: nextBlock);
      }

      transactions.add(newTransaction);
      state = AsyncData([...transactions]);
      return newTransaction;
    }
  }
}
