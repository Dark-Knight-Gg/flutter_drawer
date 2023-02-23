import 'package:facexpress/core/bloc/base_bloc.dart';
import 'package:facexpress/features/main/presentation/ui/pincode/pincode_state.dart';


import '../../../domain/usecase/init_cache_usecase.dart';

class PinCodeCubit extends BaseCubit<PinCodeState> {
  final InitCacheUseCase initCacheUseCase;

  PinCodeCubit(this.initCacheUseCase) : super.value(const PinCodeState());

  void onChangePinCode(String pinCode) {
    if (pinCode.length == 6) {
      final newValue = state.value.copyWith(isActive: true);
      emit(state.copyWith(value: newValue, message: ''));
    }
  }
  Future<void> onClickNext()async {

  }
  Future<void> initConfig() async {
    await initCacheUseCase.execute();
  }
}
