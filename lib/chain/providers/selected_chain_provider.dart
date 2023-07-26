import 'package:flutter/foundation.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_annulus/shared/services/hive/hive_service.dart';
import 'package:flutter_annulus/shared/services/hive/hives.dart';
import 'package:flutter_annulus/shared/utils/hive_utils.dart';

final selectedChainProvider = StateProvider<Chains>((ref) {
  return kDebugMode ? const Chains.private_network() : const Chains.topl_mainnet();
});

final chainsProvider = StateNotifierProvider<ChainsNotifier, AsyncValue<List<Chains>>>((ref) {
  return ChainsNotifier();
});

class ChainsNotifier extends StateNotifier<AsyncValue<List<Chains>>> {
  ChainsNotifier() : super(AsyncLoading()) {
    _getAvailableChains();
  }

  Future<void> _getAvailableChains() async {
    final List<Chains> customChains = [];
    final Iterable<dynamic> hiveData = await HiveService().getAllItems(boxType: Hives.customChains);
    hiveData.toList().forEach((element) {
      final Map<String, dynamic> hiveJson = convertHashMapToMap(element);
      try {
        customChains.add(Chains.fromJson(hiveJson));
      } catch (e) {
        print('Error parsing custom chain: $e');
      }
    });

    // Add each predefined chain as well

    state = AsyncData(customChains);
  }

  test() {
    switch (Chains) {
      case Chains.topl_mainnet:
        break;
      case Chains.valhalla_testnet:
        break;
      case Chains.private_network:
        break;
      case Chains.dev_network:
        break;
      case Chains.mock:
        break;
      case Chains.custom:
        break;
    }
  }

  /// Add ad custom chain
  /// Make sure to add to state
  /// And make sure the input is a CustomNetwork (See the chains class)
  Future<void> addCustomChain(CustomNetwork chain) async {}
}
