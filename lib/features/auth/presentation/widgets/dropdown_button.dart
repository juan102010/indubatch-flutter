import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:indubatch_movil/core/theme/colors.dart';
import 'package:indubatch_movil/core/theme/fonts.dart';
import 'package:indubatch_movil/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

/// A dropdown button widget for selecting a company.
class DropdownButtonLogin extends StatefulWidget {
  /// Constructs a [DropdownButtonLogin] with the provided [items] and [authBloc].
  const DropdownButtonLogin({
    super.key,
    required this.items,
    required this.authBloc,
    this.languageController,
    required this.text,
  });

  final List<String> items;

  final AuthBloc authBloc;

  final String? languageController;

  final String text;

  @override
  State<DropdownButtonLogin> createState() => _DropdownButtonLoginState();
}

/// The controller for the search text field within the dropdown.
final TextEditingController textEditingController = TextEditingController();

class _DropdownButtonLoginState extends State<DropdownButtonLogin> {
  String? selectedValueCompany;
  String? selectedValueLanguage;

  @override
  Widget build(BuildContext context) {
    if (widget.languageController != null &&
        widget.languageController!.isNotEmpty) {
      widget.authBloc.updateLanguage(widget.languageController!, context);
      setState(() {
        selectedValueCompany = widget.languageController;
      });
    }

    final size = MediaQuery.of(context).size;
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: selectedValueCompany,
        isExpanded: true,
        items: widget.items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: textStyleNormal(primaryColor, 16),
                ),
              ),
            )
            .toList(),
        hint: Text(
          widget.text,
          style: textStyleNormal(primaryColor, 16),
        ),
        onChanged: (String? value) {
          setState(() {
            selectedValueCompany = value;
          });
          widget.authBloc.updateLanguage(value!, context);
        },
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          height: size.width > 750 ? 10.w : 13.w,
          width: 95.w,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.03,
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 10.w,
        ),
      ),
    );
  }
}
