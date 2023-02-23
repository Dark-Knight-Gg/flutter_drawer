// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class BS {
  BS();

  static BS? _current;

  static BS get current {
    assert(_current != null,
        'No instance of BS was loaded. Try to initialize the BS delegate before accessing BS.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<BS> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = BS();
      BS._current = instance;

      return instance;
    });
  }

  static BS of(BuildContext context) {
    final instance = BS.maybeOf(context);
    assert(instance != null,
        'No instance of BS present in the widget tree. Did you add BS.delegate in localizationsDelegates?');
    return instance!;
  }

  static BS? maybeOf(BuildContext context) {
    return Localizations.of<BS>(context, BS);
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Process`
  String get process {
    return Intl.message(
      'Process',
      name: 'process',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email...`
  String get enter_email {
    return Intl.message(
      'Enter your email...',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Email invalid, please enter a valid email address!`
  String get email_invalid {
    return Intl.message(
      'Email invalid, please enter a valid email address!',
      name: 'email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password...`
  String get enter_password {
    return Intl.message(
      'Enter your password...',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgot_password {
    return Intl.message(
      'Forget password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Change company?`
  String get change_company {
    return Intl.message(
      'Change company?',
      name: 'change_company',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email to proceed with the confirmation process, we will send to your email a code consisting of 6 numbers`
  String get instructions_for_entering_email {
    return Intl.message(
      'Please enter your email to proceed with the confirmation process, we will send to your email a code consisting of 6 numbers',
      name: 'instructions_for_entering_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code`
  String get Enter_the_6_digit_code {
    return Intl.message(
      'Enter the 6-digit code',
      name: 'Enter_the_6_digit_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code you received in the email.`
  String get Enter_the_6_digit_code_you_received_in_the_email {
    return Intl.message(
      'Enter the 6-digit code you received in the email.',
      name: 'Enter_the_6_digit_code_you_received_in_the_email',
      desc: '',
      args: [],
    );
  }

  /// `Insert code`
  String get Insert_code {
    return Intl.message(
      'Insert code',
      name: 'Insert_code',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get Reset_password {
    return Intl.message(
      'Reset Password',
      name: 'Reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Set the new password for your account so you can login and access all the features.`
  String get Instructions_to_reset_password {
    return Intl.message(
      'Set the new password for your account so you can login and access all the features.',
      name: 'Instructions_to_reset_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get New_password {
    return Intl.message(
      'New Password',
      name: 'New_password',
      desc: '',
      args: [],
    );
  }

  /// `*Your password must be at least 6-50 characters`
  String get Error_new_password {
    return Intl.message(
      '*Your password must be at least 6-50 characters',
      name: 'Error_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter Password`
  String get Re_enter_password {
    return Intl.message(
      'Re-enter Password',
      name: 'Re_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure your passwords match.`
  String get Error_re_password {
    return Intl.message(
      'Please make sure your passwords match.',
      name: 'Error_re_password',
      desc: '',
      args: [],
    );
  }

  /// `Failure`
  String get Error_change_password {
    return Intl.message(
      'Failure',
      name: 'Error_change_password',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success_change_password {
    return Intl.message(
      'Success',
      name: 'Success_change_password',
      desc: '',
      args: [],
    );
  }

  /// `Time Sheet`
  String get Time_sheet {
    return Intl.message(
      'Time Sheet',
      name: 'Time_sheet',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<BS> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<BS> load(Locale locale) => BS.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
