import 'package:flutter/material.dart';
import 'package:indubatch_movil/core/theme/colors.dart';
import 'package:indubatch_movil/core/theme/fonts.dart';
import 'package:indubatch_movil/features/configuration/domain/entities/get_information_entity.dart';
import 'package:indubatch_movil/features/configuration/presentation/widgets/text_row_information.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoxInformation extends StatefulWidget {
  const BoxInformation({
    super.key,
    required this.info,
  });
  final GetInformationEntity info;
  @override
  State<BoxInformation> createState() => _BoxInformationState();
}

class _BoxInformationState extends State<BoxInformation> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 2.h),
          height: 19.h,
          width: 95.w,
          decoration: BoxDecoration(
              border: Border.all(color: blueColor),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Column(
                children: [
                  TextRowInformation(
                    title: AppLocalizations.of(context)!.deviceIDInformation,
                    result: widget.info.id!,
                  ),
                  TextRowInformation(
                    title: AppLocalizations.of(context)!.modelInformation,
                    result: widget.info.model!,
                  ),
                  TextRowInformation(
                    title: AppLocalizations.of(context)!.appVersionInformation,
                    result: widget.info.versionRelease!,
                  ),
                  TextRowInformation(
                    title: AppLocalizations.of(context)!.teamNameInformation,
                    result: widget.info.product!,
                  ),
                  TextRowInformation(
                    title: AppLocalizations.of(context)!.oSVersionInformation,
                    result: widget.info.versionSdkInt!,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 60.w,
            decoration: const BoxDecoration(
              color: backgroundGray,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Text(
              AppLocalizations.of(context)!.equipmentInformation,
              style: textStyleInput(primaryColor, size.width > 700 ? 2.w : 4.w),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
