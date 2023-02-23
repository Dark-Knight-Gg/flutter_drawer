import 'package:facexpress/core/configs/constants_widget.dart';
import 'package:facexpress/core/core.dart';
import 'package:facexpress/core/extensions/string_ext.dart';
import 'package:facexpress/core/widget/base_widget.dart';
import 'package:facexpress/features/main/presentation/ui/forgot_password/forgot_password_cubit.dart';
import 'package:facexpress/features/main/presentation/ui/forgot_password/forgot_password_state.dart';
import 'package:facexpress/features/main/presentation/ui/pincode/pincode_page.dart';
import 'package:facexpress/features/main/presentation/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_utils.dart';
import '../../../../../generated/l10n.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text_field.dart';
import '../pincode/pincode_cubit.dart';

class ForgotPasswordPage
    extends BaseStatelessWidget<ForgotPasswordState, ForgotPasswordCubit> {
  const ForgotPasswordPage({super.key});
  @override
  Color? backgroundColor() => Colors.white;
  @override
  Widget buildContent(
      BuildContext context, StateWrapper<ForgotPasswordState> state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        height12,
        AppText(
          text: BS.current.forgot_password,
          size: 20,
          color: Colors.black,
          paddingBottom: 20,
          fontWeight: FontWeight.normal,
        ),
        height8,
        AppText(
          text: BS.current.instructions_for_entering_email,
          size: 14,
          color: Colors.grey,
          paddingBottom: 20,
          fontWeight: FontWeight.normal,
        ),
        height12,
        AppText(
          text: BS.current.email,
          size: 14,
          color: Colors.black,
          paddingBottom: 20,
          fontWeight:  FontWeight.normal,
        ),
        _buildEmailInput(context, state),
        height32,
        _buildNextButton(context, state.value),
      ],
    );
  }

  Widget _buildEmailInput(
    BuildContext context,
    StateWrapper<ForgotPasswordState> state,
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

  Widget _buildNextButton(BuildContext context, ForgotPasswordState state) {
    return AppButton(
      BS.current.next,
      state.valid,
      () {
        AppUtils.hideKeyboard();
        Navigator.of(context).pop();
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
                height: MediaQuery.of(context).size.height/5*3.7,
                child: BlocProvider<PinCodeCubit>(
                  create: (context) => PinCodeCubit(context.read()),
                  child: const PinCodePage(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
