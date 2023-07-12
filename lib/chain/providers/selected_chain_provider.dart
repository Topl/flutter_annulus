import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// TODO: This will need some thought of what the [Chains] model will look like
/// Currently [Chains] is an enum because it is convenient to predefine chains
/// But [Chains] will need some additional info such as rpc ip and port
final selectedChainProvider = StateProvider<Chains>((ref) {
  return Chains.private_network;
});
