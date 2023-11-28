import 'dart:math';

import 'package:fast_base58/fast_base58.dart';

String decodeId(List<int> byteArray) {
  return Base58Encode(byteArray);
}

List<int> encodeId(String id) {
  List<int> bytes = Base58Decode(id);
  return bytes;
}

// Create a random base58 safe ID

String createId() {
  final random = Random.secure();
  final bytes = List.generate(32, (_) => random.nextInt(256));
  return Base58Encode(bytes);
}
