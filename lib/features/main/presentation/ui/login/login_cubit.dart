import 'package:facexpress/core/core.dart';
import 'package:facexpress/features/routes.dart';

import '../../states/email_input.dart';
import '../../states/password_input.dart';
import 'login_params.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(LoginParams params) : super.value(LoginState.fromParams(params));

  void onEmailChange(String email) {
    final newValue = value.copyWith(email: EmailInput.dirty(email));
    emit(state.copyWith(value: newValue, message: ''));
  }

  void onPasswordChange(String password) {
    final newValue = value.copyWith(password: PasswordInput.dirty(password));
    emit(state.copyWith(value: newValue, message: ''));
  }

  void onForgotPasswordClick() {}

  void onLoginClick() {
    final newEventNavigate = NavigateEvent.pushNamed(Routes.home.path);
    emitNewEvent(newEventNavigate);
  }

  void onChangeCompanyClick() {
    final event = NavigateEvent.popAndPushNamed(Routes.domain.path);
    emitNewEvent(event);
  }
}
