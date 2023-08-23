// Dart imports:
import 'dart:convert';

Map<String, dynamic> convertHashMapToMap(hashMap) {
  return json.decode(json.encode(hashMap)) as Map<String, dynamic>;
}
