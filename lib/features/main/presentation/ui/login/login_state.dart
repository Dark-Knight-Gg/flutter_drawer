import 'package:equatable/equatable.dart';

import '../../states/email_input.dart';
import '../../states/password_input.dart';
import 'login_params.dart';

class LoginState extends Equatable {
  final String domainLogo;
  final EmailInput email;
  final PasswordInput password;

  const LoginState({
    this.domainLogo = '',
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  factory LoginState.fromParams(LoginParams params) {
    return LoginState(
      domainLogo: params.logoUrl,
      email: EmailInput.pure(params.email),
    );
  }

  bool get valid => email.valid && password.valid;

  LoginState copyWith({
    String? domainLogo,
    EmailInput? email,
    PasswordInput? password,
  }) {
    return LoginState(
      domainLogo: domainLogo ?? this.domainLogo,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'LoginState{domainLogo: $domainLogo, email: $email, password: $password}';
  }

  @override
  List<Object?> get props => [domainLogo, email, password];
}
