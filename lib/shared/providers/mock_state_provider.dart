import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Returns [bool] depending on whether to  to mock state or use API
final mockStateProvider = Provider<bool>((ref) {
  return true;
});
