import 'package:facexpress/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/cache/cache_manager.dart';

abstract class CacheModule {
  static RepositoryProvider<CacheHelper> _provideCacheHelper() {
    return RepositoryProvider<CacheHelper>(
      create: (context) => HiveCacheHelper(),
    );
  }

  static RepositoryProvider<CacheManager> _provideCacheManager() {
    return RepositoryProvider<CacheManager>(
      create: (context) => CacheManagerImpl(context.read()),
    );
  }

  static List<RepositoryProvider> dependencies() {
    return [
      _provideCacheHelper(),
      _provideCacheManager(),
    ];
  }
}
