
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/routes/resource_icons.dart';
import '../../../../core/theme/colors.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  ///Nombre de pantallla y ruta de navegacion
  static const routeName = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // AuthBloc authBloc = getIt<AuthBloc>();

  // @override
  // void initState() {
  //   processScreen();
  //   super.initState();
  // }

  // Future<void> processScreen() async {
  //   bool isUserLogin = await authBloc.isUserLogin();
  //   bool isHeadquarterSelected = await authBloc.isSelectHeadquarterUser();
  //   await Future.delayed(const Duration(seconds: 3));

  //   navigation(isUserLogin, isHeadquarterSelected);
  // }

  // void navigation(bool isUserLogin, bool isHeadquarterSelected) {
  //   if (isUserLogin) {
  //     if (isHeadquarterSelected) {
  //       Navigator.pushReplacementNamed(context, MenuStructPage.routeName);
  //     } else {
  //       Navigator.pushReplacementNamed(context, HeadquartersPage.routeName);
  //     }
  //   } else {
  //     Navigator.pushReplacementNamed(context, LoginPage.routeName);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(child: _mainScreen()),
    );
  }

  Widget _mainScreen() {
    return Stack(
      children: [
        _backgroundSplash(),
        _titleScreen(),
      ],
    );
  }

  Widget _titleScreen() {
    return Align(
      alignment: Alignment.center,
      child: Image(
        image: const AssetImage(logoSplash),
        fit: BoxFit.cover,
        height: 15.h,
      ),
    );
  }

  Widget _backgroundSplash() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(fondoFecurity),
        fit: BoxFit.cover,
      )),
    );
  }
}
