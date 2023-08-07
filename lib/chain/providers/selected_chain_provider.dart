import 'package:flutter/foundation.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedChainProvider = StateProvider<Chains>((ref) {
  return kDebugMode ? Chains.private_network : Chains.topl_mainnet;
});
