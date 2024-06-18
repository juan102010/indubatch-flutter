import 'package:indubatch_movil/core/theme/app_theme.dart';
import 'package:indubatch_movil/features/about/presentation/pages/about_screen.dart';
import 'package:indubatch_movil/features/auth/presentation/widgets/dropdown_button.dart';
import 'package:indubatch_movil/features/configuration/presentation/pages/configuration_screen.dart';
import 'package:indubatch_movil/features/password_change/presentation/pages/password_change_screen.dart';

import '../../../../core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/components/custom_input.dart';
import '../../../../core/components/custom_loading.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/routes/resource_icons.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../injection_container.dart.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBloc authBloc = getIt<AuthBloc>();
  dynamic languageText = '';
  bool _isLoading = false;
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
              value: authBloc,
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) async {},
                builder: (context, state) => _isLoading
                    ? const CustomLoadingPage()
                    : _principalBody(authBloc, state),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _principalBody(AuthBloc authBloc, AuthState state) {
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
            decoration: createCardShapeLogin(context),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AboutScreen.routeName);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(3.h),
                        child: Text(
                          AppLocalizations.of(context)!.about,
                          style: textBlueUrl,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  AppLocalizations.of(context)!.welcomeTo,
                  style: textBlackStyleSubTitle(Adaptive.sp(20)),
                ),
                Image(
                  image: const AssetImage(logoBlue),
                  fit: BoxFit.fill,
                  height: 12.h,
                  width: 93.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Text(
                    AppLocalizations.of(context)!.enterDataToAccess,
                    style: textBlackStyleSubTitle(Adaptive.sp(16)),
                  ),
                ),
                _middleView(authBloc, state),
                SizedBox(
                  height: 3.h,
                ),
                _bottomButton(authBloc, state),
                SizedBox(
                  height: 2.h,
                ),
                _twoButtons(),
              ],
            ),
          ),
        )
      ],
    );
  }

  /// Middle View to login form
  Column _middleView(AuthBloc authBloc, AuthState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StreamBuilder(
            stream: authBloc.userStream,
            builder: (_, AsyncSnapshot<String> snapshot) {
              return CustomInput(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 1.w),
                  child: Icon(
                    size: 5.w,
                    Icons.person,
                    color: mainGrey,
                  ),
                ),
                colorInputText: primaryColor,
                placeholder: AppLocalizations.of(context)!.user,
                keyboardType: TextInputType.text,
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                onChanged: (text) {
                  //Update email to validate
                  authBloc.updateUser(text, context);
                },
              );
            }),
        SizedBox(
          height: 2.h,
        ),
        StreamBuilder(
            stream: authBloc.passwordStream,
            builder: (_, AsyncSnapshot<String> snapshot) {
              final visibility = state.showPassword;

              final iconVisibility = GestureDetector(
                onTap: () {
                  authBloc.add(ShowPasswordEvent(!state.showPassword));
                },
                child: visibility
                    ? SvgPicture.asset(
                        height: 2.5.h,
                        width: 2.5.w,
                        padlockOpenSVG,
                        colorFilter:
                            const ColorFilter.mode(lightBlue, BlendMode.srcIn),
                      )
                    : SvgPicture.asset(
                        height: 2.5.h,
                        width: 2.5.w,
                        padlockSVG,
                        colorFilter: const ColorFilter.mode(
                            primaryColor, BlendMode.srcIn),
                      ),
              );

              return CustomInput(
                colorInputText: primaryColor,
                placeholder: AppLocalizations.of(context)!.password,
                keyboardType: TextInputType.text,
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: iconVisibility,
                ),
                obscureText: !visibility,
                onChanged: (text) {
                  //Update password to validate
                  authBloc.updatePassword(text, context);
                },
              );
            }),
        SizedBox(height: 2.h),
        StreamBuilder(
            stream: authBloc.companyStream,
            builder: (_, AsyncSnapshot<String> snapshot) {
              return CustomInput(
                suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 1.w),
                    child: SvgPicture.asset(
                      companySVG,
                      colorFilter:
                          const ColorFilter.mode(mainGrey, BlendMode.srcIn),
                    )),
                colorInputText: primaryColor,
                placeholder: AppLocalizations.of(context)!.company,
                keyboardType: TextInputType.text,
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                onChanged: (text) {
                  //Update email to validate
                  authBloc.updateCompany(text, context);
                },
              );
            }),
        SizedBox(height: 2.h),
        DropdownButtonLogin(
          authBloc: authBloc,
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

  /// Bottom Button for login in netvoz
  StreamBuilder _bottomButton(AuthBloc authBloc, AuthState state) {
    return StreamBuilder(
      stream: authBloc.validateLoginForm,
      builder: (context, snapshot) {
        return PrimaryButton(
          onPressed: snapshot.hasData
              ? () async {
                  Future<String> userNameFuture = authBloc.userStream.first;
                  String username = await userNameFuture;
                  Future<String> passwordFuture = authBloc.passwordStream.first;
                  String password = await passwordFuture;
                  Future<String> companyFuture = authBloc.companyStream.first;
                  String company = await companyFuture;
                  // Future<String> languageFuture = authBloc.languageStream.first;
                  // String language = await languageFuture;

                  print(username);
                  print(password);
                  print(company);
                }
              : null,
          height: 6.h,
          child: Text(
            AppLocalizations.of(context)!.enter,
            style:
                snapshot.hasData ? textWhiteStyleButton : textBlackStyleButton,
          ),
        );
      },
    );
  }

  Widget _twoButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ConfigurationScreen.routeName);
            },
            child: Text(
              AppLocalizations.of(context)!.configuration,
              style: textBlueUrl,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ChangePasswordScreen.routeName);
            },
            child: Text(
              AppLocalizations.of(context)!.changePassword,
              style: textBlueUrl,
            ),
          ),
        ],
      ),
    );
  }
}
