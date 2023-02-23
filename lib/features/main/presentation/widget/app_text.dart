import 'package:flutter/material.dart';

import '../../../../core/configs/constants.dart';

class AppText extends StatelessWidget {
  String text = "";
  double size = 15;
  Color color = Colors.black;
  double paddingBottom = 0;
  FontWeight fontWeight = FontWeight.normal;

  AppText(
      {required this.text,
      required this.size,
      required this.color,
      required this.paddingBottom,
      required this.fontWeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: Constants.primaryFont,
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
