import 'package:get_storage/get_storage.dart';

abstract class CacheService {
  String? getCache(String key);
  Future<void> setCache(String key, String? value);
  Future<void> removeCache(String key);
  Future<void> clear();
}

class CacheServiceImpl implements CacheService {
  final GetStorage _storage = GetStorage();

  @override
  String? getCache(String key) {
    final data = _storage.read<String>(key);
    return data;
  }

  @override
  Future<void> setCache(String key, String? value) async {
    if (value == null) return;
    await _storage.write(key, value);
  }

  @override
  Future<void> removeCache(String key) async {
    await _storage.remove(key);
  }

  @override
  Future<void> clear() async {
    await _storage.erase();
  }
}
