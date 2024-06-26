import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indubatch_movil/core/components/custom_input.dart';
import 'package:indubatch_movil/core/components/custom_loading.dart';
import 'package:indubatch_movil/core/components/primary_button.dart';
import 'package:indubatch_movil/core/routes/cache.dart';
import 'package:indubatch_movil/core/routes/resource_icons.dart';
import 'package:indubatch_movil/core/theme/colors.dart';
import 'package:indubatch_movil/core/theme/fonts.dart';
import 'package:indubatch_movil/core/components/dropdown_button.dart';
import 'package:indubatch_movil/features/configuration/domain/entities/get_information_entity.dart';
import 'package:indubatch_movil/features/configuration/presentation/bloc/configuration_bloc.dart';
import 'package:indubatch_movil/features/configuration/presentation/widgets/box_information.dart';
import 'package:indubatch_movil/injection_container.dart.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({super.key});
  static const routeName = "/configuration";
  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final ConfigurationBloc configurationBloc = getIt<ConfigurationBloc>();
  bool _isLoading = false;
  dynamic languageText = '';
  var deviceData = <String, dynamic>{};
  GetInformationEntity getInformationEntity =
      const GetInformationEntity.empty();
  late String? url;
  late String? comapny;

  @override
  void initState() {
    _loadCompanyUserData();
    initPlatformState();
    super.initState();
  }

  Future<void> _loadCompanyUserData() async {
    final data = await CacheService.getDataCompanyUser();
    if (data != null) {
      url = data['companyUrl'];
      comapny = data['company'];
      setState(() {});
    } else {
      url = 'null';
      comapny = 'null';
    }
  }

  Future<void> initPlatformState() async {
    if (Platform.isAndroid) {
      deviceData = configurationBloc
          .readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      setState(() {
        getInformationEntity = GetInformationEntity(
          id: deviceData['id'],
          model: deviceData['model'],
          product: deviceData['product'],
          versionRelease: deviceData['version.release'],
          versionSdkInt: deviceData['version.sdkInt'].toString(),
        );
      });
    } else if (Platform.isIOS) {
      deviceData =
          configurationBloc.readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      setState(() {
        getInformationEntity = GetInformationEntity(
          model: deviceData['model'],
          product: deviceData['name'],
          id: deviceData['identifierForVendor'].toString(),
          versionRelease: deviceData['systemVersion'],
          versionSdkInt: deviceData['systemVersion'],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: backgroundGray,
            body: BlocProvider.value(
              value: configurationBloc,
              child: BlocConsumer<ConfigurationBloc, ConfigurationState>(
                listener: (context, state) async {},
                builder: (context, state) =>
                    _isLoading ? const CustomLoadingPage() : _principalBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _principalBody() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(0.5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: const AssetImage(logoBlue),
                  fit: BoxFit.fill,
                  height: 13.h,
                  width: 93.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Text(
                    AppLocalizations.of(context)!.settings,
                    style: textBlackStyleSubTitle(Adaptive.sp(20)),
                  ),
                ),
                BoxInformation(
                  info: getInformationEntity,
                ),
                _middleView(),
                _lowerButtonsColumn(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _lowerButtonsColumn() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.w),
      child: Column(
        children: [
          PrimaryButton(
            onPressed: null,
            height: 6.h,
            child: Text(AppLocalizations.of(context)!.sendConfiguration,
                style: textWhiteStyleButton),
          ),
          SizedBox(
            height: 2.h,
          ),
          PrimaryButton(
            onPressed: null,
            height: 6.h,
            child: Text(AppLocalizations.of(context)!.connectionTest,
                style: textWhiteStyleButton),
          ),
          SizedBox(
            height: 2.h,
          ),
          PrimaryButton(
            onPressed: null,
            height: 6.h,
            child: Text(AppLocalizations.of(context)!.sendDatabase,
                style: textWhiteStyleButton),
          ),
        ],
      ),
    );
  }

  Widget _middleView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StreamBuilder(
          stream: configurationBloc.urlStream,
          builder: (_, AsyncSnapshot<String> snapshot) {
            return CustomInput(
              initialValue: url,
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 1.w),
                child: SvgPicture.asset(
                  urlIconSVG,
                  height: 2.5.h,
                  width: 2.5.w,
                  colorFilter:
                      const ColorFilter.mode(mainGrey, BlendMode.srcIn),
                ),
              ),
              enable: false,
              colorInputText: primaryColor,
              placeholder: AppLocalizations.of(context)!.url,
              keyboardType: TextInputType.text,
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
              onChanged: (text) {
                //Update email to validate
                configurationBloc.updateUrl(text, context);
              },
            );
          },
        ),
        SizedBox(height: 3.h),
        StreamBuilder(
          stream: configurationBloc.companyStream,
          builder: (_, AsyncSnapshot<String> snapshot) {
            return CustomInput(
              initialValue: comapny,
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 1.w),
                child: SvgPicture.asset(
                  companySVG,
                  height: 2.5.h,
                  width: 2.5.w,
                  colorFilter:
                      const ColorFilter.mode(mainGrey, BlendMode.srcIn),
                ),
              ),
              enable: false,
              colorInputText: primaryColor,
              placeholder: AppLocalizations.of(context)!.company,
              keyboardType: TextInputType.text,
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
              onChanged: (text) {
                //Update email to validate
                configurationBloc.updateCompany(text, context);
              },
            );
          },
        ),
        SizedBox(height: 3.h),
        DropdownButtonLogin(
          updateBloc: configurationBloc,
          items: [
            AppLocalizations.of(context)!.spanish,
            AppLocalizations.of(context)!.english
          ],
          text: AppLocalizations.of(context)!.language,
          languageController: languageText,
        )
      ],
    );
  }
}
