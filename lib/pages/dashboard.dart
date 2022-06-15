/// Created by nghinv on Wed Jun 15 2022

import 'package:flutter/material.dart';
import 'package:web_support/pages/widgets/app_bar.dart';
import 'package:web_support/pages/widgets/main_menu.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> keyNavigation = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(keyNavigation),
      body: WillPopScope(
        onWillPop: () async => await keyNavigation.currentState!.maybePop(),
        child: Navigator(
          key: keyNavigation,
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => const MainMenu(),
            );
          },
        ),
      ),
    );
  }
}
