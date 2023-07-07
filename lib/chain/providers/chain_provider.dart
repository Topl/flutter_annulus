import 'dart:typed_data';

import 'package:flutter_annulus/chain/models/chain.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/chain/utils/chain_utils.dart';
import 'package:flutter_annulus/shared/providers/genus_provider.dart';
import 'package:flutter_annulus/shared/providers/node_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/genus/services/node_grpc.dart';
import 'package:topl_common/genus/services/transaction_grpc.dart';
import 'package:topl_common/proto/consensus/models/block_header.pb.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pbgrpc.dart';

final last10BlockHeadersProvider = FutureProvider<List<BlockHeader>>((ref) async {
  final selectedChain = ref.watch(selectedChainProvider);
  final GenusGRPCService genusClient = ref.read(genusProvider(selectedChain));

  final List<BlockHeader> last10Blocks = [];

  for (int i = 0; i < 10; i++) {
    final block = await genusClient.getBlockByDepth(depth: i);
    final blockHeader = block.block.header;
    last10Blocks.add(blockHeader);
  }

  return last10Blocks;
});

final chainProvider = StateNotifierProvider<ChainNotifier, AsyncValue<Chain>>((ref) {
  /// Adding some dev notes here
  ///
  /// THIS STILL NEEDS TO BE TESTED!
  ///
  /// Watching selected chain here and providing to the notifier
  /// Ideally, when the chain is changed, the notifier should be updated
  /// Since Annulus will support the ability to add new chains, we cant have pre-defined providers for each chain
  ///
  /// In Ribn we have a similar use case where we have a selected chain
  /// but we have individual providers for each chain since it currently only supports 3 chains
  final selectedChain = ref.watch(selectedChainProvider);

  return ChainNotifier(
    ref,
    selectedChain,
  );
});

class ChainNotifier extends StateNotifier<AsyncValue<Chain>> {
  final Chains selectedChain;
  final Ref ref;

  final GenusGRPCService genusClient;
  final NodeGRPCService nodeClient;

  ChainNotifier(
    this.ref,
    this.selectedChain,
  )   : genusClient = ref.read(genusProvider(selectedChain)),
        nodeClient = ref.read(nodeProvider(selectedChain)),
        super(
          const AsyncLoading(),
        ) {
    getSelectedChain(setState: true);
  }

  /// TODO: Implements with dart gRPC client
  ///
  /// It takes a bool [setState]
  ///
  /// If [setState] is true, it will update the state of the provider
  /// If [setState] is false, it will not update the state of the provider
  Future<Chain> getSelectedChain({bool setState = false}) async {
    if (setState) state = const AsyncLoading();

    final Chain chain = selectedChain == Chains.mock ? getMockChain() : await _getLiveChain();

    // Adding delay here to simulate API call
    if (setState) {
      state = AsyncData(chain);
    }

    return chain;
  }

  Future<Chain> _getLiveChain() async {
    try {
      final FetchEpochDataRes chainData = await nodeClient.fetchEpochData(epoch: 1);

      //////// Data Throughput ////////
      final int dataBytes = chainData.epochData.dataBytes.toInt();
      print('QQQQ dataBytes: $dataBytes');

      final int startTimestamp = chainData.epochData.startTimestamp.toInt();
      print('QQQQ startTimestamp: $startTimestamp');

      final int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
      print('QQQQ currentTimestamp: $currentTimestamp');

      final double dataThroughput = dataBytes / ((currentTimestamp - startTimestamp) / 1000);
      print('QQQQ dataThroughput: $dataThroughput');

      //////// Average Transaction fee ////////
      /// TODO, totalTransactionReward is returning no data, might need to update implementation
      final int totalTransactionsInEpoch = chainData.epochData.transactionCount.toInt();
      final totalTransactionReward = chainData.epochData.totalTransactionReward;
      final buffer = totalTransactionReward.writeToBuffer();

      final data = Int8List.fromList(totalTransactionReward.value).buffer.asByteData();
      BigInt _bigInt = BigInt.zero;

      for (var i = 0; i < data.lengthInBytes; i++) {
        _bigInt = (_bigInt << 8) | BigInt.from(data.getUint8(i));
      }

      print('QQQQ _bigInt: $_bigInt');

      int decimalValue = ByteData.view(buffer.buffer).getInt16(0);
      print('QQQQ $decimalValue');

      int decimalValueq = 0;
      for (int i = 0; i < buffer.length; i++) {
        decimalValueq = decimalValueq << 8; // shift everything one byte to the left
        decimalValueq = decimalValueq | buffer[i]; // bitwise or operation
      }

      print('QQQQ decimalValueq $decimalValueq');

      final value = totalTransactionReward.value;

      final double averageTransactionFee = value[0] / totalTransactionsInEpoch;
      print('QQQQ averageTransactionFee: $averageTransactionFee');

      //////// Others ////////
      final int eon = chainData.epochData.eon.toInt();
      print('QQQQ eon: $eon');

      final int era = chainData.epochData.era.toInt();
      print('QQQQ era: $era');

      final int epoch = chainData.epochData.epoch.toInt();
      print('QQQQ epoch: $epoch');

      final int endHeight = chainData.epochData.endHeight.toInt();
      print('QQQQ endHeight: $endHeight');

      print('QQQQ activeStakes ${chainData.epochData.activeStake}');
      final q1 = chainData.epochData.activeStake.value;
      Int8List q2 = Int8List.fromList(q1);
      ByteData q3 = ByteData.view(q2.buffer);

      print('QQQQ q3 $q3');
      print('QQQQ q3 ${q3.getInt16(0)}');
      print('QQQQ q2 $q2');
      final activeStakes = int.parse(chainData.epochData.activeStake.toString());
      print('QQQQ activeStakes $activeStakes');

      final inactiveStakes = int.parse(chainData.epochData.inactiveStake.toString());
      print('QQQQ inactiveStakes $inactiveStakes');

      final totalStakes = activeStakes + inactiveStakes;

      final Chain chain = Chain(
        dataThroughput: dataThroughput,
        averageTransactionFee: averageTransactionFee,
        uniqueActiveAddresses: 0,
        eon: eon,
        era: era,
        epoch: epoch,
        totalTransactionsInEpoch: totalTransactionsInEpoch,
        height: endHeight,
        // QQQQ implement this
        averageBlockTime: 0,
        totalStake: activeStakes / totalStakes,
        registeredStakes: totalStakes,
        activeStakes: activeStakes,
        inactiveStakes: inactiveStakes,
      );
      return chain;
    } catch (e) {
      print('QQQQ error: $e');

      throw ('Error retrieving chain data $e');
    }
  }
}
