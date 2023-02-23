import 'package:facexpress/core/bloc/base_bloc.dart';
import 'package:facexpress/features/main/domain/usecase/init_cache_usecase.dart';

import 'my_time_sheet_state.dart';




class MyTimeSheetCubit extends BaseCubit<MyTimeSheetState>{
  final InitCacheUseCase initCacheUseCase;
  MyTimeSheetCubit(this.initCacheUseCase) : super.value(const MyTimeSheetState());
  Future<void> initConfig() async {
    await initCacheUseCase.execute();
  }
}