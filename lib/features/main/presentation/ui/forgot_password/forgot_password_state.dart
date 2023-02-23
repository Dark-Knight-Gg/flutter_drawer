import 'package:equatable/equatable.dart';

import '../../states/email_input.dart';

class ForgotPasswordState extends Equatable{
  final EmailInput email;

  const ForgotPasswordState({this.email = const EmailInput.pure()});

  String get emailValue => email.value;

  bool get valid => email.valid;

  ForgotPasswordState copyWith({
    EmailInput? email,
  }) {
    return ForgotPasswordState(email: email ?? this.email);
  }

  @override
  String toString() {
    return 'DomainState{email: $email}';
  }

  @override
  List<Object?> get props => [email];
}