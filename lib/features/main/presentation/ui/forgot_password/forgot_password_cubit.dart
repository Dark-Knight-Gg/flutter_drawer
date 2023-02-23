import 'package:facexpress/core/core.dart';
import 'package:facexpress/features/main/presentation/ui/forgot_password/forgot_password_state.dart';

import '../../../domain/usecase/init_cache_usecase.dart';
import '../../states/email_input.dart';

class ForgotPasswordCubit extends BaseCubit<ForgotPasswordState>{
  final InitCacheUseCase initCacheUseCase;
  ForgotPasswordCubit(this.initCacheUseCase) : super.value(const ForgotPasswordState());
  void onEmailChange(String email) {
    final newValue = state.value.copyWith(email: EmailInput.dirty(email));
    emit(state.copyWith(value: newValue, message: ''));
  }
  Future<void> onNextClick() async {
  }
  Future<void> initConfig() async {
    await initCacheUseCase.execute();
  }
  
}