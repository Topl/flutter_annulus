import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/shared/providers/node_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pb.dart';

final configProvider = StreamProvider<FetchNodeConfigRes>((ref) async* {
  final selectedChain = ref.read(selectedChainProvider);
  final nodeClient = ref.read(nodeProvider(selectedChain));
  final configStream = nodeClient.fetchNodeConfig();

  await for (var value in configStream) {
    yield value;
  }
});
