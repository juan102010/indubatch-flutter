import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors.dart';

/// This textStyle its for all Logo Text in the aplication
TextStyle get textLogoStyle => GoogleFonts.lato(
      color: colorWhite,
      fontSize: Adaptive.sp(30),
      fontWeight: FontWeight.bold,
    );

TextStyle get textTitleStyle => GoogleFonts.lato(
      color: colorWhite,
      fontSize: Adaptive.sp(20),
      fontWeight: FontWeight.bold,
    );

/// This textStyle its for all Text in the aplication
TextStyle textStyleNormal(Color color) => GoogleFonts.lato(
      color: color,
      fontSize: Adaptive.sp(17),
      fontWeight: FontWeight.w600,
    );

TextStyle textStyleInput(Color color, double fontSize) => GoogleFonts.lato(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: Adaptive.sp(fontSize),
    );

TextStyle textStylePlaceholder(Color color, double fontSize) =>
    GoogleFonts.lato(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: Adaptive.sp(fontSize),
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textWhiteStyleButton => GoogleFonts.lato(
      color: colorWhite,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(17),
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textBlackStyleButton => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(17),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleTitle => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(22),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyle => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: Adaptive.sp(15),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleLitte => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: Adaptive.sp(14),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleBold => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: Adaptive.sp(15),
    );

/// This textStyle its for all black SubTitle in the aplication

TextStyle textBlackStyleSubTitle(double fontSize) => GoogleFonts.lato(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textWhiteStyle => GoogleFonts.lato(
      color: colorWhite,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(14),
    );
TextStyle get textBlueUrl => GoogleFonts.lato(
      color: lightBlue,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(17),
    );
