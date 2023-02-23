import '../../domain/repository/app_repository.dart';
import '../cache/cache_manager.dart';

class AppRepositoryImpl implements AppRepository {
  final CacheManager cacheManager;

  AppRepositoryImpl(this.cacheManager);

  @override
  Future<void> initCache() async {
    await cacheManager.initialize();
  }
}
