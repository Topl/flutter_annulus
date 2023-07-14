import 'dart:convert';
import 'package:fast_base58/fast_base58.dart';

String decodeId(List<int> byteArray) {
  return Base58Encode(byteArray);
}
