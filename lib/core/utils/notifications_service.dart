import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indubatch_movil/core/theme/colors.dart';
import 'package:indubatch_movil/core/theme/fonts.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messageKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String title, String message) {
    return Get.snackbar(title, message,
        icon: const Icon(Icons.person, color: colorWhite),
        backgroundColor: primaryColor,
        colorText: colorWhite);
  }

  static showDefaultDialog(String title) {
    return Get.defaultDialog(
      title: title,
      titleStyle: textStyleNormal(colorWhite),
      content: const Column(
        children: [
          CircularProgressIndicator(
            strokeWidth: 3,
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
