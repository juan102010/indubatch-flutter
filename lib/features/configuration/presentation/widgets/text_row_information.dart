import 'package:flutter/material.dart';
import 'package:indubatch_movil/core/theme/colors.dart';
import 'package:indubatch_movil/core/theme/fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextRowInformation extends StatefulWidget {
  const TextRowInformation({
    super.key,
    required this.result,
    required this.title,
  });

  final String title;
  final String result;

  @override
  State<TextRowInformation> createState() => _TextRowInformationState();
}

class _TextRowInformationState extends State<TextRowInformation> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: textBlackStyleSubTitle(Adaptive.sp(17)),
          ),
        ),
        Expanded(
          child: Text(
            widget.result,
            style: textStyleInput(primaryColor, size.width > 700 ? 2.w : 4.w),
          ),
        ),
      ],
    );
  }
}
