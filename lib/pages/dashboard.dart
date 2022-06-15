/// Created by nghinv on Wed Jun 15 2022

import 'package:flutter/material.dart';
import 'package:web_support/pages/widgets/app_bar.dart';
import 'package:web_support/pages/widgets/main_menu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<NavigatorState> keyNavigation = GlobalKey<NavigatorState>();

  String language = 'vi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        keyNavigation: keyNavigation,
        language: language,
        onChangeLanguage: (value) {
          setState(() {
            language = value!;
          });
        },
      ),
      body: WillPopScope(
        onWillPop: () async => await keyNavigation.currentState!.maybePop(),
        child: Navigator(
          key: keyNavigation,
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => MainMenu(language: language),
            );
          },
        ),
      ),
    );
  }
}
