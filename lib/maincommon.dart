import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indubatch_movil/core/routes/global_keys.dart';
import 'package:indubatch_movil/core/routes/navigators.dart';
import 'package:indubatch_movil/core/routes/page_generator.dart';
import 'package:indubatch_movil/core/screens/splash_screen.dart';
import 'package:indubatch_movil/core/theme/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: globalNavigatorKey,
        title: 'Indubatch',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', 'ES'),
        ],
        locale: const Locale('es', 'ES'),
        scaffoldMessengerKey: messageKey,
        theme: appTheme,
        initialRoute: SplashPage.routeName,
        onGenerateRoute: PageClassGenerator.getNamedScreen,
      );
    });
  }
}
