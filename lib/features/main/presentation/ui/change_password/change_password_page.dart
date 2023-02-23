import 'package:facexpress/core/configs/constants_widget.dart';
import 'package:facexpress/core/widget/base_widget.dart';
import 'package:facexpress/features/main/presentation/ui/change_password/change_password_state.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_utils.dart';
import '../../../../../generated/l10n.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text.dart';
import '../../widget/app_text_field.dart';
import 'change_password_cubit.dart';

class ChangePassWordPage
    extends BaseStatelessWidget<ChangePassWordState, ChangePassWordCubit> {
  const ChangePassWordPage({super.key});
  @override
  Color? backgroundColor() => Colors.white;
  @override
  Widget buildContent(
      BuildContext context, StateWrapper<ChangePassWordState> state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        height12,
        AppText(
          text: BS.current.Reset_password,
          size: 20,
          color: Colors.black,
          paddingBottom: 10,
          fontWeight: FontWeight.normal,
        ),
        AppText(
          text: BS.current.Instructions_to_reset_password,
          size: 14,
          color: Colors.grey,
          paddingBottom: 10,
          fontWeight: FontWeight.normal,
        ),
        AppText(
          text: BS.current.New_password,
          size: 14,
          color: Colors.black87,
          paddingBottom: 20,
          fontWeight: FontWeight.normal,
        ),
        _buildNewPasswordInput(context, state),
        height8,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AppText(
            text: BS.current.Error_new_password,
            size: 10,
            color: const Color(0xffBDBDBD),
            paddingBottom: 5,
            fontWeight: FontWeight.normal,
          ),
        ),
        height8,
        AppText(
          text: BS.current.Re_enter_password,
          size: 14,
          color: Colors.black87,
          paddingBottom: 20,
          fontWeight: FontWeight.normal,
        ),
        _buildRePasswordInput(context, state),
        height24,
        _buildResetPassWordButton(context, state.value),
      ],
    );
  }

  Widget _buildNewPasswordInput(
    BuildContext context,
    StateWrapper<ChangePassWordState> state,
  ) {
    return BorderTextField(
      hint: BS.current.enter_password,
      isPasswordField: true,
      autoFocus: false,
      onChanged: (value) {
        cubit(context).onNewPassWordChange(value);
      },
    );
  }

  Widget _buildRePasswordInput(
    BuildContext context,
    StateWrapper<ChangePassWordState> state,
  ) {
    return BorderTextField(
      hint: BS.current.enter_password,
      isPasswordField: true,
      autoFocus: false,
      error: state.value.isRePassWord ? BS.current.Error_re_password : null,
      onChanged: (value) {
        cubit(context).onRePassWordChange(value);
      },
    );
  }

  Widget _buildResetPassWordButton(
      BuildContext context, ChangePassWordState state) {
    return AppButton(
      BS.current.next,
      state.valid,
      () {
        AppUtils.hideKeyboard();
        cubit(context).onClickNext();
      },
    );
  }

}
