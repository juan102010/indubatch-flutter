import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indubatch_movil/core/routes/navigators_observers.dart';
import 'package:indubatch_movil/features/auth/presentation/pages/login_page.dart';
import 'package:indubatch_movil/features/menu/presentation/bloc/menu_bloc.dart';
import 'package:indubatch_movil/features/pending_documents/presentation/pages/pending_documents_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/routes/navigators.dart';
import '../../../../core/routes/page_generator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../injection_container.dart.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../widgets/custom_bottom_tab_bar.dart';
import '../widgets/custom_tab_scaffold.dart';
import '../widgets/icon_tab_builder.dart';

class MenuStructPage extends StatefulWidget {
  const MenuStructPage({super.key});

  static const routeName = '/menu';

  @override
  State<MenuStructPage> createState() => _MenuStructPageState();
}

class _MenuStructPageState extends State<MenuStructPage> {
  int _selectBottomTabIndex = 0;
  AuthBloc authBLoc = getIt<AuthBloc>();
  MenuBloc menuBloc = getIt<MenuBloc>();

  final pageBuilder = {
    0: PageClassGenerator().buildPendingDocumentsTabPage,
    1: PageClassGenerator().buildSynchronizationTabPage,
    2: PageClassGenerator().buildCheckListTabPage,
    3: PageClassGenerator().buildNoveltiesTabPage,
  };

  final navigators = {
    0: pendingDocumentsTabNavigator,
    1: synchronizationTabNavigar,
    2: checkListTabNavigator,
    3: noveltiesTabNavigator,
  };

  final navigatorsObservers = {
    0: pendingDocumentsTabNavigatorObserver,
    1: synchronizationTabNavigatorObserver,
    2: checkListTabNavigatorObserver,
    3: noveltiesTabNavigatorObserver,
  };

  Future<void> _restartLogin({
    required String typePage,
    required BuildContext parentContext,
  }) async {
    Navigator.popUntil(
        context, (route) => route.settings.name == MenuStructPage.routeName);

    if (typePage == 'login') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MenuBloc>(create: (_) {
            return menuBloc;
          }),
          BlocProvider<AuthBloc>(create: (_) {
            return authBLoc;
          }),
        ],
        child: BlocConsumer<MenuBloc, MenuState>(builder: (context, state) {
          return CustomCupertinoTabScaffold(
            tabBuilder: _tab,
            tabBar: _bottomNavBar(),
          );
        }, listener: (context, state) async {
          if (state.closeSession) {
            authBLoc.add(LogOutUserEvent());
            await _restartLogin(
              typePage: 'login',
              parentContext: context,
            );
          }
        }),
      ),
    );
  }

  CustomCupertinoTabBar _bottomNavBar() {
    return CustomCupertinoTabBar(
      currentIndex: _selectBottomTabIndex,
      onTap: _tabIconPressed,
      activeColor: Theme.of(context).colorScheme.primary,
      inactiveColor: Theme.of(context).colorScheme.surface,
      backgroundColor: colorWhite,
      border: Border(
        top: BorderSide(
          color: mainGrey,
          width: 0.1.w,
        ),
      ),
      height: 8.h,
      items: [
        BottomNavigationBarItem(
          icon: IconTabView(
            index: 0,
            imageIcon: Icons.home_rounded,
            isActiveColor: _selectBottomTabIndex == 0,
          ),
        ),
        BottomNavigationBarItem(
          icon: IconTabView(
            index: 1,
            imageIcon: Icons.home_rounded,
            isActiveColor: _selectBottomTabIndex == 1,
          ),
        ),
        BottomNavigationBarItem(
          icon: IconTabView(
            index: 2,
            imageIcon: Icons.home_rounded,
            isActiveColor: _selectBottomTabIndex == 2,
          ),
        ),
        BottomNavigationBarItem(
          icon: IconTabView(
            index: 3,
            imageIcon: Icons.home_rounded,
            isActiveColor: _selectBottomTabIndex == 3,
          ),
        ),
      ],
    );
  }

  void _tabIconPressed(int index) {
    if (_selectBottomTabIndex != index) {
      //reload home board
      if (index == 0) {
        navigators[index]
            ?.currentState
            ?.pushReplacementNamed(PendingDocumentsScreen.routeName);
      }

      setState(() {
        _selectBottomTabIndex = index;
      });
    } else {
      while (navigators[index]!.currentState!.canPop()) {
        navigators[index]?.currentState?.pop();
      }
    }
  }

  Widget _tab(BuildContext context, int tabIndex) {
    if (pageBuilder.containsKey(tabIndex)) {
      return CupertinoTabView(
        onGenerateRoute: pageBuilder[tabIndex],
        navigatorKey: navigators[tabIndex],
        navigatorObservers: [
          if (navigatorsObservers.containsKey(tabIndex))
            navigatorsObservers[tabIndex] as NavigatorObserver
        ],
      );
    } else {
      return const Material(
        child: Center(
          child: Text("Todavia no se ha aplicado"),
        ),
      );
    }
  }
}
