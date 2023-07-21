import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/transaction_status.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/transactions/models/transaction_type.dart';
import 'package:flutter_annulus/shared/providers/config_provider.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/transactions/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/proto/brambl/models/transaction/unspent_transaction_output.pb.dart';
import 'package:topl_common/proto/genus/genus_rpc.pb.dart';
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
    header: decodeId(blockRes.block.header.headerId.value),
    epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
    size: 5432.2,
    height: blockRes.block.header.height.toInt(),
    slot: blockRes.block.header.slot.toInt(),
    timestamp: blockRes.block.header.timestamp.toInt(),
    transactionNumber: blockRes.block.fullBody.transactions.length,
  );

  //calculate values for fields
  var txAmount = calculateAmount(outputs: transactionRes.transactionReceipt.transaction.outputs);
  var txFees = calculateFees(
      inputs: transactionRes.transactionReceipt.transaction.inputs,
      outputs: transactionRes.transactionReceipt.transaction.outputs);

  var transaction = Transaction(
      transactionId: decodeId(transactionRes.transactionReceipt.transaction.transactionId.value),
      status: TransactionStatus.confirmed,
      block: block,
      broadcastTimestamp: transactionRes.transactionReceipt.transaction.datum.event.schedule.timestamp.toInt(),
      confirmedTimestamp: block.timestamp,
      transactionType: TransactionType.transfer,
      amount: txAmount.toDouble(),
      transactionFee: txFees.toDouble(),
      senderAddress:
          transactionRes.transactionReceipt.transaction.inputs.map((e) => decodeId(e.address.id.value)).toList(),
      receiverAddress:
          transactionRes.transactionReceipt.transaction.outputs.map((e) => decodeId(e.address.id.value)).toList(),
      transactionSize: 10,
      quantity: 10,
      name: transactionRes.transactionReceipt.transaction.inputs[0].value.hasLvl() ? 'Lvl' : 'Topl');

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

  //check that fullBody is not empty
  if (blockRes.block.fullBody.hasField(1)) {
    int transactionCount = blockRes.block.fullBody.transactions.length;

    var latestBlock = Block(
      header: decodeId(blockRes.block.header.headerId.value),
      epoch: blockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
      size: 5432.2,
      height: blockRes.block.header.height.toInt(),
      slot: blockRes.block.header.slot.toInt(),
      timestamp: blockRes.block.header.timestamp.toInt(),
      transactionNumber: transactionCount,
    );

    //continue going through transactions
    for (int i = 0; i < transactionCount; i++) {
      final iDouble = i.toDouble();

      //calculate transaction amount
      var txAmount = calculateAmount(outputs: blockRes.block.fullBody.transactions[i].outputs);
      var txFees = calculateFees(
          inputs: blockRes.block.fullBody.transactions[i].inputs,
          outputs: blockRes.block.fullBody.transactions[i].outputs);

      transactions.add(
        Transaction(
          transactionId: decodeId(blockRes.block.fullBody.transactions[0].transactionId.value),
          status: TransactionStatus.pending,
          block: latestBlock,
          broadcastTimestamp: latestBlock.timestamp,
          confirmedTimestamp: 0, //for the latest block, it will never be confirmed (confirmation depth is 5)
          transactionType: TransactionType.transfer,
          amount: txAmount.toDouble(),
          transactionFee: txFees.toDouble(),
          senderAddress:
              blockRes.block.fullBody.transactions[i].inputs.map((e) => decodeId(e.address.id.value)).toList(),
          receiverAddress:
              blockRes.block.fullBody.transactions[i].outputs.map((e) => decodeId(e.address.id.value)).toList(),
          transactionSize: i,
          quantity: i,
          name: blockRes.block.fullBody.transactions[i].inputs[0].value.hasLvl() ? 'Lvl' : 'Topl',
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
    if (selectedChain == Chains.mock) {
      final transactions = List.generate(100, (index) => getMockTransaction());
      if (setState) state = AsyncData(transactions);
      return transactions;
    } else {
      if (setState) state = const AsyncLoading();
      final List<Transaction> transactions = [];
      //get most recent block
      final selectedChain = ref.read(selectedChainProvider.notifier).state;
      final genusClient = ref.read(genusProvider(selectedChain));
      int depth = 0;

      //TODO: figure out a better way since a ton of empty blocks means this is taking too long
      var latestBlockRes = await genusClient.getBlockByDepth(depth: depth);
      //check that block has transactions
      while (!latestBlockRes.block.fullBody.hasField(1)) {
        depth++;
        latestBlockRes = await genusClient.getBlockByDepth(depth: depth);
      }
      final config = ref.read(configProvider.future);
      final presentConfig = await config;

      int transactionCount = latestBlockRes.block.fullBody.transactions.length;

      var latestBlock = Block(
        header: decodeId(latestBlockRes.block.header.headerId.value),
        epoch: latestBlockRes.block.header.slot.toInt() ~/ presentConfig.config.epochLength.toInt(),
        size: 5432.2,
        height: latestBlockRes.block.header.height.toInt(),
        slot: latestBlockRes.block.header.slot.toInt(),
        timestamp: latestBlockRes.block.header.timestamp.toInt(),
        transactionNumber: transactionCount,
      );

      //continue going through transactions
      for (int i = 0; i < transactionCount; i++) {
        final iDouble = i.toDouble();

        //calculate transaction amount
        var txAmount = calculateAmount(outputs: latestBlockRes.block.fullBody.transactions[i].outputs);
        var txFees = calculateFees(
            inputs: latestBlockRes.block.fullBody.transactions[i].inputs,
            outputs: latestBlockRes.block.fullBody.transactions[i].outputs);

        transactions.add(
          Transaction(
            transactionId: decodeId(latestBlockRes.block.fullBody.transactions[0].transactionId.value),
            status: TransactionStatus.pending,
            block: latestBlock,
            broadcastTimestamp: latestBlock.timestamp,
            confirmedTimestamp: 0, //for the latest block, it will never be confirmed (confirmation depth is 5)
            transactionType: TransactionType.transfer,
            amount: txAmount.toDouble(),
            transactionFee: txFees.toDouble(),
            senderAddress:
                latestBlockRes.block.fullBody.transactions[i].inputs.map((e) => decodeId(e.address.id.value)).toList(),
            receiverAddress:
                latestBlockRes.block.fullBody.transactions[i].outputs.map((e) => decodeId(e.address.id.value)).toList(),
            transactionSize: i,
            quantity: i,
            name: latestBlockRes.block.fullBody.transactions[i].inputs[0].value.hasLvl() ? 'Lvl' : 'Topl',
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
}
