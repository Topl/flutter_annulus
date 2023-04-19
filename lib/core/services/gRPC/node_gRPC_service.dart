import 'package:hooks_riverpod/hooks_riverpod.dart';

final nodeGRPCProvider = Provider<NodeGRPCService>((ref) {
  return NodeGRPCService();
});

class NodeGRPCService {}
