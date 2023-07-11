import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/genus/providers/genus_provider.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:flutter_annulus/shared/providers/config_provider.dart';
import 'package:flutter_annulus/shared/utils/get_chain_id.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../blocks/models/block.dart';

final getTransactionByIdProvider = FutureProvider.family<Transaction, String>((ref, transactionId) async {
  final selectedChain = ref.watch(selectedChainProvider);
  final genusClient = ref.read(genusProvider(selectedChain));

  final config = ref.read(configProvider.future);
  final presentConfig = await config;

  var transactionRes = await genusClient.getTransactionById(transactionIdString: transactionId);

  var blockRes = await genusClient.getBlockById(
    blockIdBytes: transactionRes.transactionReceipt.blockId.value,
  );

  var block = Block(
    header: getChainId(blockRes.block.header.headerId.value),
    epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
    size: 5432.2,
    height: blockRes.block.header.height.toInt(),
    slot: blockRes.block.header.slot.toInt(),
    timestamp: blockRes.block.header.timestamp.toInt(),
    transactionNumber: blockRes.block.fullBody.transactions.length,
  );

  //calculate transaction amount
  var txAmount = transactionRes.transactionReceipt.transaction.inputs[0].value.lvl.quantity.value
      .reduce((value, element) => value + element);

  var transaction = Transaction(
      transactionId: getChainId(transactionRes.transactionReceipt.transaction.transactionId.value),
      status: TransactionStatus.confirmed,
      block: block,
      broadcastTimestamp: transactionRes.transactionReceipt.transaction.datum.event.schedule.timestamp.toInt(),
      confirmedTimestamp: block.timestamp,
      transactionType: TransactionType.transfer,
      amount: txAmount.toDouble(),
      transactionFee: 10,
      senderAddress: getChainId(transactionRes.transactionReceipt.transaction.inputs[0].address.id.value),
      receiverAddress: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w",
      transactionSize: 10,
      proposition: "28EhwUBiHJ3evyGidV1WH8QMfrLF6N8UDze9Yw7jqi6w",
      quantity: 10,
      name: "transaction");

  return transaction;
});

final getTransactionsByDepthProvider = FutureProvider.family<List<Transaction>, int>((ref, depth) async {
  final List<Transaction> transactions = [];
  //get most recent block
  final selectedChain = ref.read(selectedChainProvider.notifier).state;
  final genusClient = ref.read(genusProvider(selectedChain));

  var blockRes = await genusClient.getBlockByDepth(depth: depth);
  final config = ref.read(configProvider.future);
  final presentConfig = await config;

  if (blockRes.block.fullBody.hasField(1)) {
    int transactionCount = blockRes.block.fullBody.transactions.length;

    var latestBlock = Block(
      header: getChainId(blockRes.block.header.headerId.value),
      epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
      size: 5432.2,
      height: blockRes.block.header.height.toInt(),
      slot: blockRes.block.header.slot.toInt(),
      timestamp: blockRes.block.header.timestamp.toInt(),
      transactionNumber: transactionCount,
    );

    //continue going through transactions
    for (int i = 0; i < transactionCount; i++) {
      final iString = i.toString();
      final iDouble = i.toDouble();

      //calculate transaction amount
      var txAmount = blockRes.block.fullBody.transactions[i].inputs[0].value.lvl.quantity.value
          .reduce((value, element) => value + element);

      transactions.add(
        Transaction(
          transactionId: getChainId(blockRes.block.fullBody.transactions[0].transactionId.value),
          status: TransactionStatus.pending,
          block: latestBlock,
          broadcastTimestamp: latestBlock.timestamp,
          confirmedTimestamp: 0, //for the latest block, it will never be confirmed (confirmation depth is 5)
          transactionType: TransactionType.transfer,
          amount: txAmount.toDouble(),
          transactionFee: iDouble,
          senderAddress: getChainId(blockRes.block.fullBody.transactions[0].inputs[0].address.id.value),
          receiverAddress: iString,
          transactionSize: i,
          proposition: iString,
          quantity: i,
          name: iString,
        ),
      );
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
    final selectedChain = ref.read(selectedChainProvider.notifier).state;
    final genusClient = ref.read(genusProvider(selectedChain));
    int depth = 0;

    //TODO: figure out a better way since a ton of empty blocks means this is taking too long
    var latestBlockRes = await genusClient.getBlockByDepth(depth: depth);
    while (!latestBlockRes.block.fullBody.hasField(1)) {
      depth++;
      latestBlockRes = await genusClient.getBlockByDepth(depth: depth);
    }
    final config = ref.read(configProvider.future);
    final presentConfig = await config;

    int transactionCount = latestBlockRes.block.fullBody.transactions.length;

    var latestBlock = Block(
      header: getChainId(latestBlockRes.block.header.headerId.value),
      epoch: latestBlockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
      size: 5432.2,
      height: latestBlockRes.block.header.height.toInt(),
      slot: latestBlockRes.block.header.slot.toInt(),
      timestamp: latestBlockRes.block.header.timestamp.toInt(),
      transactionNumber: transactionCount,
    );

    //continue going through transactions
    for (int i = 0; i < transactionCount; i++) {
      final iString = i.toString();
      final iDouble = i.toDouble();

      //calculate transaction amount
      var txAmount = latestBlockRes.block.fullBody.transactions[i].inputs[0].value.lvl.quantity.value
          .reduce((value, element) => value + element);

      transactions.add(
        Transaction(
          transactionId: getChainId(latestBlockRes.block.fullBody.transactions[0].transactionId.value),
          status: TransactionStatus.pending,
          block: latestBlock,
          broadcastTimestamp: latestBlock.timestamp,
          confirmedTimestamp: 0, //for the latest block, it will never be confirmed (confirmation depth is 5)
          transactionType: TransactionType.transfer,
          amount: txAmount.toDouble(),
          transactionFee: iDouble,
          senderAddress: getChainId(latestBlockRes.block.fullBody.transactions[0].inputs[0].address.id.value),
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
}
