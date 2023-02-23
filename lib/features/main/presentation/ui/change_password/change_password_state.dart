import 'package:equatable/equatable.dart';

import '../../states/password_input.dart';

class ChangePassWordState extends Equatable {
  final PasswordInput newPassword;
  final PasswordInput rePassword;
  final bool isRePassWord;

  const ChangePassWordState({
    this.newPassword = const PasswordInput.pure(),
    this.rePassword = const PasswordInput.pure(),
    this.isRePassWord = false,
  });
  bool get valid => newPassword.valid && rePassword.valid;

  ChangePassWordState copyWith({
    PasswordInput? newPassword,
    PasswordInput? rePassword,
    bool? isRePassWord,
  }) {
    return ChangePassWordState(
      newPassword: newPassword ?? this.rePassword,
      rePassword: rePassword ?? this.rePassword,
      isRePassWord: isRePassWord ?? this.isRePassWord,
    );
  }

  @override
  List<Object?> get props => [newPassword, rePassword, isRePassWord];
}
