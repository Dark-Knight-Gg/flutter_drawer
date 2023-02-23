import 'package:facexpress/core/core.dart';
import 'package:facexpress/features/routes.dart';

import '../../../domain/usecase/init_cache_usecase.dart';
import 'splash_state.dart';

class SplashCubit extends BaseCubit<SplashState> {
  final InitCacheUseCase initCacheUseCase;

  SplashCubit(this.initCacheUseCase) : super.value(SplashState());

  @override
  Future<void> start() async {
    await initConfig();
    await Future.delayed(const Duration(seconds: 2));
    emitNewEvent(NavigateEvent.pushNamed(Routes.domain.path));
  }

  Future<void> initConfig() async {
    await initCacheUseCase.execute();
  }
}
