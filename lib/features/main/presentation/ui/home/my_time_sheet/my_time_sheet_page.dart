import 'package:facexpress/core/configs/constants.dart';
import 'package:facexpress/core/configs/constants_widget.dart';
import 'package:facexpress/core/widget/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:date_range_form_field/date_range_form_field.dart';


import 'my_time_sheet_cubit.dart';
import 'my_time_sheet_state.dart';

class MyTimeSheetPage
    extends BaseStatelessWidget<MyTimeSheetState, MyTimeSheetCubit> {
  const MyTimeSheetPage({super.key});

  @override
  Widget buildContent(
      BuildContext context, StateWrapper<MyTimeSheetState> state) {
    return Column(
      children: [
        height12,
        _buildDateRanger(context, state),
      ],
    );
  }

  Widget _buildDateRanger(
    BuildContext context,
    StateWrapper<MyTimeSheetState> state,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 80,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: DateRangeField(
          firstDate: DateTime(1990),
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          enabled: true,
          initialValue: DateTimeRange(
              start: DateTime.now(),
              end: DateTime.now().add(const Duration(days: 5))),
          decoration: const InputDecoration(
            hintStyle: TextStyle(
              fontFamily: Constants.primaryFont,
              color: Color(0xff11374B),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.calendar_month),
           prefixIconColor: Color(0xff11374B),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
          validator: (value) {
            if (value!.start.isBefore(DateTime.now())) {
              return 'Please enter a later start date';
            }
            return null;
          },
        ),
      ),
    );
  }
}
