import 'package:facexpress/features/main/presentation/ui/change_password/change_password_page.dart';
import 'package:facexpress/features/main/presentation/ui/forgot_password/forgot_password_cubit.dart';
import 'package:facexpress/features/main/presentation/ui/forgot_password/forgot_password_page.dart';
import 'package:facexpress/features/main/presentation/ui/home/home_cubit.dart';
import 'package:facexpress/features/main/presentation/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main/presentation/ui/domain/domain_cubit.dart';
import 'main/presentation/ui/domain/domain_page.dart';
import 'main/presentation/ui/home/my_time_sheet/my_time_sheet_cubit.dart';
import 'main/presentation/ui/home/my_time_sheet/my_time_sheet_page.dart';
import 'main/presentation/ui/login/login_cubit.dart';
import 'main/presentation/ui/login/login_page.dart';
import 'main/presentation/ui/login/login_params.dart';
import 'main/presentation/ui/pincode/pincode_cubit.dart';
import 'main/presentation/ui/pincode/pincode_page.dart';
import 'main/presentation/ui/splash/splash_cubit.dart';
import 'main/presentation/ui/splash/splash_page.dart';

enum Routes {
  root('/'),
  domain('/domain'),
  login('/login'),
  forgotPassword('/forgot_password'),
  pinCode('/pin_code'),
  changePassword('/change_password'),
  home('/home'),
  myTimeSheet('/my_time_sheet');

  final String path;

  const Routes(this.path);
}

Route onGenerateRoute(RouteSettings settings) {
  var routeSelected = Routes.values.firstWhere(
    (element) => settings.name == element.path,
    orElse: () => Routes.root,
  );
  switch (routeSelected) {
    case Routes.root:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<SplashCubit>(
          create: (context) => SplashCubit(context.read()),
          child: const SplashPage(),
        ),
      );
    case Routes.domain:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<DomainCubit>(
          create: (context) => DomainCubit(context.read()),
          child: const DomainPage(),
        ),
      );
    case Routes.login:
      final arguments = settings.arguments;
      final params = (arguments is LoginParams) ? arguments : LoginParams();
      return MaterialPageRoute(
        builder: (context) => BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(params),
          child: const LoginPage(),
        ),
      );
    case Routes.forgotPassword:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<ForgotPasswordCubit>(
          create: (context) => ForgotPasswordCubit(context.read()),
          child: const ForgotPasswordPage(),
        ),
      );
    case Routes.pinCode:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<PinCodeCubit>(
          create: (context) => PinCodeCubit(context.read()),
          child: const PinCodePage(),
        ),
      );
    case Routes.changePassword:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<PinCodeCubit>(
          create: (context) => PinCodeCubit(context.read()),
          child: const ChangePassWordPage(),
        ),
      );
    case Routes.home:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(context.read()),
          child: const HomePage(),
        ),
      );
    case Routes.myTimeSheet:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<MyTimeSheetCubit>(
          create: (context) => MyTimeSheetCubit(context.read()),
          child: const MyTimeSheetPage(),
        ),
      );
  }
}
