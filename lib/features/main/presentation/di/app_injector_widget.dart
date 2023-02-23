import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'module/cache_module.dart';
import 'module/network_module.dart';
import 'module/repository_module.dart';
import 'module/usecase_module.dart';

class AppInjector extends StatelessWidget {
  final Widget child;

  const AppInjector({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        ...CacheModule.dependencies(),
        ...NetworkModule.dependencies(),
        ...RepositoryModule.dependencies(),
        ...UseCaseModule.dependencies(),
      ],
      child: child,
    );
  }
}
