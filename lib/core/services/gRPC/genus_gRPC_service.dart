import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Questions
/// How do we plan on importing the protobuf specs into annulus?
/// How do we keep them in sync?

final genusGRPCServiceProvider = Provider<genusGRPCService>((ref) {
  return genusGRPCService();
});

class genusGRPCService {}
