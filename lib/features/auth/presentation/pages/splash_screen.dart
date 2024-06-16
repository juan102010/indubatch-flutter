import 'package:flutter/material.dart';
import 'package:indubatch_movil/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:indubatch_movil/features/auth/presentation/pages/login_page.dart';
import 'package:indubatch_movil/features/auth/presentation/widgets/background_splash.dart';
import 'package:indubatch_movil/features/auth/presentation/widgets/title_splash.dart';
import 'package:indubatch_movil/injection_container.dart.dart';
import '../../../../../../core/theme/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  ///Nombre de pantallla y ruta de navegacion
  static const routeName = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AuthBloc authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    processScreen();
    super.initState();
  }

  Future<void> processScreen() async {
    // bool isUserLogin = await authBloc.isUserLogin();
    // bool isHeadquarterSelected = await authBloc.isSelectHeadquarterUser();
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, LoginPage.routeName);
  }

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
    return const Stack(
      children: [
        BackgroundSplash(),
        TitleSplash(),
      ],
    );
  }
}
