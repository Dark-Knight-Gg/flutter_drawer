import 'package:facexpress/core/extensions/string_ext.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure([super.value = '']) : super.pure();

  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    if (value.isNullOrEmpty) return PasswordValidationError.empty;
    return (value?.length ?? 0) >= 6 ? null : PasswordValidationError.invalid;
  }
}
