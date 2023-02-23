import 'package:facexpress/core/configs/constants_widget.dart';
import 'package:facexpress/core/extensions/string_ext.dart';
import 'package:facexpress/core/utils/app_utils.dart';
import 'package:facexpress/core/widget/base_widget.dart';
import 'package:facexpress/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../widget/app_button.dart';
import '../../widget/app_logo.dart';
import '../../widget/app_text_field.dart';
import 'domain_cubit.dart';
import 'domain_state.dart';

class DomainPage extends BaseStatelessWidget<DomainState, DomainCubit> {
  const DomainPage({super.key});
  @override
  Color? backgroundColor() => Colors.white;

  @override
  Widget buildContent(BuildContext context, StateWrapper<DomainState> state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          height64,
          height32,
          _buildAppLogo(),
          height32,
          _buildEmailInput(context, state),
          height32,
          _buildNextButton(context, state.value)
        ],
      ),
    );
  }

  Widget _buildAppLogo() => const AppLogo(width: 220, height: 70);

  Widget _buildEmailInput(
    BuildContext context,
    StateWrapper<DomainState> state,
  ) {
    return BorderTextField(
      hint: BS.current.enter_email,
      error: state.message.isNullOrEmpty ? null : state.message,
      autoFocus: true,
      onChanged: (value) {
        cubit(context).onEmailChange(value);
      },
    );
  }

  Widget _buildNextButton(BuildContext context, DomainState state) {
    return AppButton(
      BS.current.next,
      state.valid,
      () {
        AppUtils.hideKeyboard();
        cubit(context).onNextClick();
      },
    );
  }
}
