import 'package:flutter_annulus/shared/services/hive/hives.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Future<Box<dynamic>> _openBox(String box) async {
    return await Hive.openBox(box);
  }

  Future<void> putItem({
    required Hives boxType,
    required String key,
    required dynamic value,
  }) async {
    final box = await _openBox(boxType.id);
    await box.put(key, value);
  }

  Future<dynamic> getItem({
    required Hives boxType,
    required String key,
  }) async {
    final box = await _openBox(boxType.id);
    return box.get(key);
  }

  Future<Iterable<dynamic>> getAllItems({
    required Hives boxType,
  }) async {
    final box = await _openBox(boxType.id);
    return box.values;
  }

  Future<void> deleteItem({
    required Hives boxType,
    required String key,
  }) async {
    final box = await _openBox(boxType.id);
    await box.delete(key);
  }

  Future<void> deleteBox({
    required Hives boxType,
  }) async {
    final box = await _openBox(boxType.id);
    await box.deleteFromDisk();
  }

  Future<void> deleteAll() async {
    await Hive.deleteFromDisk();
  }
}
