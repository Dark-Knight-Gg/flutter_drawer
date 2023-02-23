import 'package:facexpress/core/configs/app_theme.dart';
import 'package:facexpress/core/navigation/navigator_helper.dart';
import 'package:facexpress/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'main/presentation/di/app_injector_widget.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Locale _provideAppLocale() => const Locale('vi');

  Iterable<Locale> _provideSupportedLocales() => BS.delegate.supportedLocales;

  Iterable<LocalizationsDelegate<dynamic>>? _provideLocalizationsDelegates() =>
      const [
        BS.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  @override
  Widget build(BuildContext context) {
    return AppInjector(
      child: GestureDetector(
        onTap: () {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          title: 'Flutter Base',
          color: Colors.red,
          theme: AppTheme.lightTheme,
          navigatorKey: NavigatorHelper.navigatorKey,
          locale: _provideAppLocale(),
          localizationsDelegates: _provideLocalizationsDelegates(),
          supportedLocales: _provideSupportedLocales(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}
