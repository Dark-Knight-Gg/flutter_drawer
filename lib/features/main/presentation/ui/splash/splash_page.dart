import 'package:facexpress/core/widget/base_widget.dart';
import 'package:flutter/material.dart';

import '../../widget/app_logo.dart';
import 'splash_cubit.dart';
import 'splash_state.dart';

class SplashPage extends BaseStatelessWidget<SplashState, SplashCubit> {
  const SplashPage({super.key});

  @override
  Widget buildContent(BuildContext context, StateWrapper<SplashState> state) {
    return Container(
      alignment: Alignment.center,
      child: const AppLogo(width: 220),
    );
  }

  @override
  Color? backgroundColor() => Colors.white;
}
