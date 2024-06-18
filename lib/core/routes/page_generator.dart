import 'package:flutter/material.dart';
import 'package:indubatch_movil/features/about/presentation/pages/about_screen.dart';
import 'package:indubatch_movil/features/auth/presentation/pages/login_page.dart';
import 'package:indubatch_movil/features/auth/presentation/pages/splash_screen.dart';
import 'package:indubatch_movil/features/configuration/presentation/pages/configuration_screen.dart';
import 'package:indubatch_movil/features/password_change/presentation/pages/password_change_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// It is a class that allows you to manipulate screen navigation without losing instances and references of elements
/// in the navigation tree in order to persist the navigation structure and user experience.

class PageClassGenerator {
  /// This method is for global  generics screens navigation routes
  static Route<dynamic> getNamedScreen(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder;

    switch (routeSettings.name) {
      case SplashPage.routeName:
        builder = (context) => const SplashPage();
        break;
      case LoginPage.routeName:
        builder = (context) => const LoginPage();
        break;
      case ConfigurationScreen.routeName:
        builder = (context) => const ConfigurationScreen();
        break;
      case ChangePasswordScreen.routeName:
        builder = (context) => const ChangePasswordScreen();
        break;
      case AboutScreen.routeName:
        builder = (context) => const AboutScreen();
        break;

      //rutas de prueba
      default:
        builder = (context) => const Material(
              child: Center(child: Text("Todavia no se ha aplicado")),
            );
    }
    return _commonPageWrappper(
      routeSettings: routeSettings,
      builder: builder,
    );
  }

  Route<dynamic> buildHomeTabPage(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder;
    switch (routeSettings.name) {
      // case HomePage.routeName:
      //   builder = (context) => const HomePage();
      //   break;

      default:
        builder = (context) => const Material(
              child: Center(child: Text("Todavia no se ha aplicado")),
            );
    }
    return _commonPageWrappper(
      routeSettings: routeSettings,
      builder: builder,
    );
  }

  Route<dynamic> buildSynchronizationTabPage(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder;
    switch (routeSettings.name) {
      // case DevicesOptionsPage.routeName:
      //   builder = (context) => DevicesOptionsPage(
      //         params: routeSettings.arguments as DevicePageParams,
      //       );
      //   break;

      default:
        builder = (context) => const Material(
              child: Center(child: Text("Todavia no se ha aplicado")),
            );
    }
    return _commonPageWrappper(
      routeSettings: routeSettings,
      builder: builder,
    );
  }

  Route<dynamic> buildCheckListTabPage(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder;
    switch (routeSettings.name) {
      // case ScanQrCodePage.routeName:
      //   builder = (context) => const ScanQrCodePage();
      //   break;

      default:
        builder = (context) => const Material(
              child: Center(child: Text("Todavia no se ha aplicado")),
            );
    }
    return _commonPageWrappper(
      routeSettings: routeSettings,
      builder: builder,
    );
  }

  Route<dynamic> buildNoveltiesTabPage(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder;
    switch (routeSettings.name) {
      // case NoveltyBoardPage.routeName:
      //   builder = (context) => const NoveltyBoardPage();
      //   break;

      default:
        builder = (context) => const Material(
              child: Center(child: Text("Todavia no se ha aplicado")),
            );
    }
    return _commonPageWrappper(
      routeSettings: routeSettings,
      builder: builder,
    );
  }

  Route<dynamic> buildHeadquartersTabPage(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder;
    switch (routeSettings.name) {
      // case HeadquartersMenuPage.routeName:
      //   builder = (context) => const HeadquartersMenuPage();
      //   break;
      default:
        builder = (context) => const Material(
              child: Center(child: Text("Todavia no se ha aplicado")),
            );
    }
    return _commonPageWrappper(
      routeSettings: routeSettings,
      builder: builder,
    );
  }

  /// Configuration method to create our own navigation
  static Route<dynamic> _commonPageWrappper({
    required RouteSettings routeSettings,
    required Widget Function(BuildContext) builder,
  }) {
    return MaterialWithModalsPageRoute(
        settings: routeSettings,
        builder: (context) => Container(
              color: Colors.black.withOpacity(0.4),
              child: SafeArea(
                top: false,
                bottom: false,
                child: builder(context),
              ),
            ));
  }
}
