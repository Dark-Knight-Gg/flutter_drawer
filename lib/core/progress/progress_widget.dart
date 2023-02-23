import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final bool dismissible;

  const ProgressWidget({Key? key, required this.dismissible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => dismissible,
      child: Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
