import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/genus/services/node_grpc.dart';

final nodeProvider = Provider.family<NodeGRPCService, Chains>((ref, chain) {
  final NodeGRPCService service = NodeGRPCService(host: chain.hostUrl, port: chain.port);

  return service;
});
