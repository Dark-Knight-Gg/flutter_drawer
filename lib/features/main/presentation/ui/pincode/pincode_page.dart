import 'package:facexpress/core/configs/constants_widget.dart';
import 'package:facexpress/core/widget/base_widget.dart';
import 'package:facexpress/features/main/presentation/ui/change_password/change_password_cubit.dart';
import 'package:facexpress/features/main/presentation/ui/change_password/change_password_page.dart';
import 'package:facexpress/features/main/presentation/ui/pincode/pincode_cubit.dart';
import 'package:facexpress/features/main/presentation/ui/pincode/pincode_state.dart';
import 'package:facexpress/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/configs/constants.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text.dart';

class PinCodePage extends BaseStatelessWidget<PinCodeState, PinCodeCubit> {
  const PinCodePage({super.key});
  @override
  Color? backgroundColor() => Colors.white;
  @override
  Widget buildContent(BuildContext context, StateWrapper<PinCodeState> state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        height12,
        AppText(
          text: BS.current.Enter_the_6_digit_code,
          size: 20,
          color: Colors.black,
          paddingBottom: 10,
          fontWeight: FontWeight.bold,
        ),
        AppText(
          text: BS.current.Enter_the_6_digit_code_you_received_in_the_email,
          size: 14,
          color: Colors.grey,
          paddingBottom: 10,
          fontWeight: FontWeight.normal,
        ),
        AppText(
          text: BS.current.Insert_code,
          size: 14,
          color: Colors.black87,
          paddingBottom: 20,
          fontWeight: FontWeight.normal,
        ),
        _buildTextFilePinCode(context),
        _buildNextButton(context, state.value),
      ],
    );
  }

  Widget _buildNextButton(BuildContext context, PinCodeState state) {
    return AppButton(
      BS.current.next,
      state.isActive,
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
                height: MediaQuery.of(context).size.height/5*4.3,
                child: BlocProvider<ChangePassWordCubit>(
                  create: (context) =>ChangePassWordCubit(context.read()),
                  child: const ChangePassWordPage(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTextFilePinCode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: PinCodeTextField(
          appContext: context,
          length: 6,
          enableActiveFill: true,
          textStyle: const TextStyle(
              fontFamily: Constants.primaryFont,
              fontSize: 19,
              color: Colors.black87),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            fieldWidth: 50,
            activeColor: Colors.grey,
            inactiveColor: Colors.grey,
            selectedColor: Colors.blueAccent,
            activeFillColor: Colors.white,
            selectedFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            disabledColor: Colors.white,
            borderWidth: 1,
            borderRadius: BorderRadius.circular(12),
          ),
          onChanged: (value) => cubit(context).onChangePinCode(value)),
    );
  }
}
