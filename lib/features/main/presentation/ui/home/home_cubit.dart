import 'package:facexpress/core/core.dart';
import 'package:facexpress/features/main/presentation/ui/home/home_state.dart';

import '../../../domain/usecase/init_cache_usecase.dart';

class HomeCubit extends BaseCubit<HomeState>{
  final InitCacheUseCase initCacheUseCase;
  HomeCubit(this.initCacheUseCase) : super.value(const HomeState());
  Future<void> initConfig() async {
    await initCacheUseCase.execute();
  }

}