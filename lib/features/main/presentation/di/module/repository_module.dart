import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/app_repository_impl.dart';
import '../../../data/repository/domain_repository_impl.dart';
import '../../../domain/repository/app_repository.dart';
import '../../../domain/repository/domain_repository.dart';

abstract class RepositoryModule {
  static RepositoryProvider<AppRepository> _provideAppRepository() {
    return RepositoryProvider(
      create: (context) => AppRepositoryImpl(context.read()),
    );
  }

  static RepositoryProvider<DomainRepository> _provideDomainRepository() {
    return RepositoryProvider(
      create: (context) => DomainRepositoryImpl(context.read()),
    );
  }

  static List<RepositoryProvider> dependencies() {
    return [
      _provideAppRepository(),
      _provideDomainRepository(),
    ];
  }
}
