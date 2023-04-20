import 'package:flutter_annulus/core/services/gRPC/proto/genus/genus_rpc.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final genusGRPCServiceProvider = Provider<GenusGRPCService>((ref) {
  return GenusGRPCService();
});

class GenusGRPCService {}
