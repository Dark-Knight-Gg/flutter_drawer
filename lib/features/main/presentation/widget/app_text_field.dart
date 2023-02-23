import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../configs/assets_const.dart';

class BorderTextField extends StatefulWidget {
  final String? initialValue;
  final String? hint;
  final bool isPasswordField;
  final String? error;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  const BorderTextField({
    super.key,
    this.initialValue,
    this.hint,
    this.isPasswordField = false,
    this.error,
    this.autoFocus = false,
    this.onChanged,
    this.focusNode,
    this.controller,
  }) : assert(initialValue == null || controller == null);

  @override
  State<BorderTextField> createState() => _BorderTextFieldState();
}

class _BorderTextFieldState extends State<BorderTextField> {
  bool _obscureText = true;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _controller = TextEditingController(text: widget.initialValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller ?? _controller,
      obscureText: obscureTextValue(),
      decoration: InputDecoration(
        errorText: widget.error,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xFFBDBDBD),
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: const Color(0xFFECF4FD),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFECF4FD),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFECF4FD),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF2F80ED),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        suffixIcon: _buildSuffixIcon(),
        suffixIconConstraints: BoxConstraints.tight(const Size(36, 32)),
      ),
      textAlignVertical: TextAlignVertical.center,
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
    );
  }

  bool obscureTextValue() {
    if (!widget.isPasswordField) return false;
    return _obscureText;
  }

  Widget? _buildSuffixIcon() {
    if (!widget.isPasswordField) return null;
    final iconPath = _obscureText ? AssetsConst.icEye : AssetsConst.icEyeSlash;
    final icon = SvgPicture.asset(
      iconPath,
      width: 20,
      height: 20,
      fit: BoxFit.cover,
    );
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        alignment: Alignment.center,
        child: icon,
      ),
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
