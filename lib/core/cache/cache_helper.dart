abstract class CacheHelper {
  Future<bool> initialize();

  void put(String key, dynamic value);

  V get<V>(String key, {V? defaultValue});

  void delete(String key);

  void clear();
}
