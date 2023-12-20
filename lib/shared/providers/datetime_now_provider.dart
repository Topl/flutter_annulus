import 'package:hooks_riverpod/hooks_riverpod.dart';

// This provider is used so that in tests we can mock the DateTime.now() function
final dateTimeNowProvider = Provider<DateTime Function()>((ref) {
  return () => DateTime.now();
});
