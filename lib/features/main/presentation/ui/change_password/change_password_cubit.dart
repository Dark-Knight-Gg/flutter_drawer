import 'package:facexpress/core/bloc/base_bloc.dart';
import 'package:facexpress/core/core.dart';
import 'package:facexpress/features/main/presentation/states/password_input.dart';
import 'package:facexpress/features/main/presentation/ui/change_password/change_password_state.dart';
import 'package:facexpress/generated/l10n.dart';

import '../../../../routes.dart';
import '../../../domain/usecase/init_cache_usecase.dart';

class ChangePassWordCubit extends BaseCubit<ChangePassWordState> {
  final InitCacheUseCase initCacheUseCase;

  ChangePassWordCubit(this.initCacheUseCase)
      : super.value(const ChangePassWordState());

  void onNewPassWordChange(String newPassword) {
    final newValue =
        value.copyWith(newPassword: PasswordInput.dirty(newPassword));
    emit(state.copyWith(value: newValue, message: ''));
  }

  void onRePassWordChange(String rePassword) {
    final newValue = value.copyWith(
        newPassword: value.newPassword,
        rePassword: PasswordInput.dirty(rePassword));
    emit(state.copyWith(value: newValue, message: ''));
  }

  Future<void> onClickNext() async {
    if (value.rePassword.value != value.newPassword.value) {
      final newValue = value.copyWith(
          newPassword: value.newPassword,
          rePassword: value.rePassword,
          isRePassWord: true);
      emit(state.copyWith(value: newValue, message: ''));
      final newEvent = ToastEvent.error(BS.current.Error_change_password);
      emitNewEvent(newEvent);
    } else {
      final newValue = value.copyWith(
          newPassword: value.newPassword,
          rePassword: value.rePassword,
          isRePassWord: false);
      emit(state.copyWith(value: newValue));
      final newEventToast =
          ToastEvent.success(BS.current.Success_change_password);
      emitNewEvent(newEventToast);
      final newEventNavigate = NavigateEvent.pop(Routes.login.path);
      Future.delayed(const Duration(seconds: 1), () {
        emitNewEvent(newEventNavigate);
      });
    }
  }
}
