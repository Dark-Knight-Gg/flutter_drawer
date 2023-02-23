import 'package:facexpress/core/cache/cache_helper.dart';

abstract class CacheKey {
  static String userToken = 'USER_TOKEN';
}

abstract class CacheManager {
  Future<bool> initialize();

  void saveUserToken(String userToken);

  String getUserToken();
}

class CacheManagerImpl implements CacheManager {
  final CacheHelper cacheHelper;

  CacheManagerImpl(this.cacheHelper);

  @override
  Future<bool> initialize() {
    return cacheHelper.initialize();
  }

  @override
  String getUserToken() {
    return cacheHelper.get(CacheKey.userToken);
  }

  @override
  void saveUserToken(String token) {
    cacheHelper.put(CacheKey.userToken, token);
  }
}
