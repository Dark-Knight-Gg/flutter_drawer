import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/fetch_domain_usecase.dart';
import '../../../domain/usecase/init_cache_usecase.dart';

abstract class UseCaseModule {
  static RepositoryProvider<InitCacheUseCase> _provideInitCacheUseCase() {
    return RepositoryProvider(
      create: (context) => InitCacheUseCase(context.read()),
    );
  }

  static RepositoryProvider<FetchDomainUsecase> _provideFetchDomainUseCase() {
    return RepositoryProvider(
      create: (context) => FetchDomainUsecase(context.read()),
    );
  }

  static List<RepositoryProvider> dependencies() {
    return [
      _provideInitCacheUseCase(),
      _provideFetchDomainUseCase(),
    ];
  }
}
