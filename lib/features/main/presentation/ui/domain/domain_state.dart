import 'package:equatable/equatable.dart';

import '../../states/email_input.dart';

class DomainState extends Equatable {
  final EmailInput email;

  const DomainState({this.email = const EmailInput.pure()});

  String get emailValue => email.value;

  bool get valid => email.valid;

  DomainState copyWith({
    EmailInput? email,
  }) {
    return DomainState(email: email ?? this.email);
  }

  @override
  String toString() {
    return 'DomainState{email: $email}';
  }

  @override
  List<Object?> get props => [email];
}
