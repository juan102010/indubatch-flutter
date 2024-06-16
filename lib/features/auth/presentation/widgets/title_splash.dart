import 'package:flutter/material.dart';
import 'package:indubatch_movil/core/routes/resource_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TitleSplash extends StatefulWidget {
  const TitleSplash({super.key});

  @override
  State<TitleSplash> createState() => _TitleSplashState();
}

class _TitleSplashState extends State<TitleSplash> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Image(
        image: const AssetImage(logoWhite),
        fit: BoxFit.contain,
        height: 15.h,
        width: size.width > 700 ? 98.w : 90.w,
      ),
    );
  }
}
