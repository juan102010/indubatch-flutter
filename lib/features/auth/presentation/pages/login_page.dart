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
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(0.5.h),
            decoration: _createCardShape(context),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  AppLocalizations.of(context)!.enter,
                  style: textTitleStyle,
                ),
                SizedBox(
                  height: 3.h,
                ),
                _middleView(authBloc, state),
                SizedBox(
                  height: 5.h,
                ),
                _bottomButton(authBloc, state),
                SizedBox(
                  height: 2.h,
                ),
                _bottomTextButton(authBloc),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StreamBuilder(
            stream: authBloc.emailStream,
            builder: (_, AsyncSnapshot<String> snapshot) {
              return CustomInput(
                colorInputText: primaryColor,
                // placeholder: AppLocalizations.of(context)!.email,
                placeholder: 'email',
                keyboardType: TextInputType.emailAddress,
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                onChanged: (text) {
                  //Update email to validate
                  // authBloc.updateEmail(text, context);
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
                        height: 4.h,
                        width: 4.w,
                        eyeVisibleSVG,
                        colorFilter:
                            const ColorFilter.mode(colorWhite, BlendMode.srcIn),
                      )
                    : SvgPicture.asset(
                        height: 4.h,
                        width: 4.w,
                        eyeInvisibleSVG,
                        colorFilter: const ColorFilter.mode(
                            secondColor, BlendMode.srcIn),
                      ),
              );

              return CustomInput(
                colorInputText: primaryColor,
                // placeholder: AppLocalizations.of(context)!.password,
                placeholder: 'password',
                keyboardType: TextInputType.emailAddress,
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
        SizedBox(height: 1.h),
      ],
    );
  }

  /// Bottom Button for login in netvoz
  StreamBuilder _bottomButton(AuthBloc authBloc, AuthState state) {
    return StreamBuilder(
      stream: authBloc.validateLoginForm,
      builder: (context, snapshot) {
        return PrimaryButton(
          onPressed: snapshot.hasData ? () async {} : null,
          height: 6.h,
          child: Text(
            // AppLocalizations.of(context)!.login,
            'login',
            style:
                snapshot.hasData ? textWhiteStyleButton : textBlackStyleButton,
          ),
        );
      },
    );
  }

  TextButton _bottomTextButton(AuthBloc authBloc) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () async {},
      child: Text(
        // AppLocalizations.of(context)!.enterUserGuest,
        'enterUserGuest',
        style: textStyleNormal(primaryColor),
      ),
    );
  }

  BoxDecoration _createCardShape(BuildContext context) {
    return BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(5.h)),
        boxShadow: const [
          BoxShadow(
            color: backgroundGray,
            blurRadius: 15,
            offset: Offset(0, 5),
          )
        ]);
  }
}
