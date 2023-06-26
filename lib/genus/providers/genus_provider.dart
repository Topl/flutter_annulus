import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topl_common/genus/services/transaction_grpc.dart';

final genusProvider = Provider.family<GenusGRPCService, Chains>((ref, chain) {
  final GenusGRPCService service =
      GenusGRPCService(host: chain.host, port: chain.port);

  return service;
});
