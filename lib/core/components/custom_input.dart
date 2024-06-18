import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indubatch_movil/core/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/fonts.dart';

class CustomInput extends StatelessWidget {
  final String placeholder;
  final TextInputType? keyboardType;
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
  final Color? fillColor;
  final String? initialValue;
  final bool? enable;
  final bool? requiredData;

  const CustomInput({
    super.key,
    required this.placeholder,
    this.keyboardType,
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
    this.fillColor,
    this.initialValue,
    this.enable = true,
    this.requiredData = false,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      enabled: enable,
      initialValue: initialValue,
      cursorColor: colorInputText,
      showCursor: true,
      maxLines: maxLines ?? 1,
      controller: controller,
      autocorrect: false,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLength: maxLength,
      style: textStyleInput(colorInputText, size.width > 700 ? 2.w : 4.w),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: !enable!,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorText: errorText,
        errorMaxLines: 2,
        labelStyle: textStylePlaceholder(
            requiredData! ? redColor : colorInputText,
            size.width > 700 ? 2.w : 4.w),
        labelText: placeholder,
        hintText: placeholder,
        counterText: "",
        hintStyle:
            textStylePlaceholder(colorInputText, size.width > 700 ? 2.w : 4.w),
      ),
    );
  }
}
