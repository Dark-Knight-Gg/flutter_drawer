import 'package:facexpress/core/configs/constants_widget.dart';
import 'package:facexpress/core/utils/app_utils.dart';
import 'package:facexpress/core/widget/base_widget.dart';
import 'package:facexpress/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/app_button.dart';
import '../../widget/app_image.dart';
import '../../widget/app_text_field.dart';
import '../forgot_password/forgot_password_cubit.dart';
import '../forgot_password/forgot_password_page.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginPage extends BaseStatelessWidget<LoginState, LoginCubit> {
  const LoginPage({super.key});

  @override
  Widget buildBody(BuildContext context, StateWrapper<LoginState> state) {
    return buildContent(context, state);
  }

  @override
  Color? backgroundColor() => Colors.white;

  @override
  Widget buildContent(BuildContext context, StateWrapper<LoginState> state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          height64,
          _buildLogo(state.value.domainLogo),
          height32,
          _buildEmailInput(context, state),
          height12,
          _buildPasswordInput(context, state),
          height12,
          _buildForgotPassword(context),
          height12,
          _buildNextButton(context, state.value),
          const Spacer(),
          _buildChangeCompany(context),
        ],
      ),
    );
  }

  Widget _buildLogo(String url) {
    return AppNetworkImage(
      url,
      width: 220,
      height: 70,
    );
  }

  Widget _buildEmailInput(
    BuildContext context,
    StateWrapper<LoginState> state,
  ) {
    return BorderTextField(
      initialValue: state.value.email.value,
      hint: BS.current.enter_email,
      autoFocus: true,
      onChanged: (value) {
        cubit(context).onEmailChange(value);
      },
    );
  }

  Widget _buildPasswordInput(
    BuildContext context,
    StateWrapper<LoginState> state,
  ) {
    return BorderTextField(
      hint: BS.current.enter_password,
      isPasswordField: true,
      autoFocus: true,
      onChanged: (value) {
        cubit(context).onPasswordChange(value);
      },
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppTextButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            shape: const RoundedRectangleBorder( // <-- SEE HERE
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                child: SizedBox(
                  height:  MediaQuery.of(context).size.height/5*3.7,
                  child: BlocProvider<ForgotPasswordCubit>(
                    create: (context) => ForgotPasswordCubit(context.read()),
                    child: const ForgotPasswordPage(),
                  ),
                ),
              );
            },
          );
        },
        text: BS.current.forgot_password,
      ),
    );
  }

  Widget _buildNextButton(BuildContext context, LoginState state) {
    return AppButton(
      BS.current.login,
      state.valid,
      () {
        AppUtils.hideKeyboard();
        cubit(context).onLoginClick();
      },
    );
  }

  Widget _buildChangeCompany(BuildContext context) {
    return Center(
      child: AppTextButton(
        onPressed: () {
          cubit(context).onChangeCompanyClick();
        },
        text: BS.current.change_company,
      ),
    );
  }
}
