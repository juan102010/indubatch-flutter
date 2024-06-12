import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/colors.dart';
import '../theme/fonts.dart';

///Class to implement de drop doen button to the application

class CustomDropDownButton extends StatelessWidget {
  final List<String> items;
  final String? dropdownvalue;
  final Function(dynamic value)? onChanged;
  final String hit;
  final double? itemWidth;

  const CustomDropDownButton({
    required this.items,
    required this.hit,
    this.onChanged,
    this.dropdownvalue,
    this.itemWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isDense: Device.screenType == ScreenType.mobile ? true : false,
      style: textStyleInput(primaryColor),
      iconEnabledColor: dropdownColor,
      elevation: 8,
      menuMaxHeight: 50.h,
      decoration: InputDecoration(
        hintStyle: textStyleInput(primaryColor),
        hintText: hit,
      ),

      // Initial Value
      value: dropdownvalue,
      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((String items) {
        return DropdownMenuItem(
            value: items,
            child: itemWidth == null
                ? Text(
                    items,
                  )
                : SizedBox(
                    width: itemWidth,
                    child: Text(
                      items,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
