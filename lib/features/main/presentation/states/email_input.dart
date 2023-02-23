import 'package:facexpress/core/extensions/string_ext.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid }

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure([super.value = '']) : super.pure();

  const EmailInput.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    if (value.isNullOrEmpty) return EmailValidationError.empty;
    return value.isEmail ? null : EmailValidationError.invalid;
  }
}
