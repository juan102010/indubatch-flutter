import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/fonts.dart';

class CustomInput extends StatelessWidget {
  final String placeholder;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final void Function(String value)? onChanged;
  final String? errorText;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final Color colorInputText;

  const CustomInput({
    super.key,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.errorText,
    this.onChanged,
    this.maxLength,
    this.maxLines,
    this.inputFormatters,
    required this.colorInputText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines ?? 1,
      controller: controller,
      autocorrect: false,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLength: maxLength,
      style: textStyleInput(colorInputText),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorText: errorText,
        errorMaxLines: 2,
        hintText: placeholder,
        counterText: "",
        hintStyle: textStylePlaceholder(colorInputText),
      ),
    );
  }
}
