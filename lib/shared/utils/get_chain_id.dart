import 'dart:convert';
import 'package:fast_base58/fast_base58.dart';

String getChainId(List<int> byteArray) {
  return Base58Encode(byteArray);
}
