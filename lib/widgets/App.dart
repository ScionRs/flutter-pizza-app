

import 'package:flutter/material.dart';
import 'package:pizza_app/router_screen/router_screen.dart';
import 'package:pizza_app/theme/colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: AppColors.mainColor,
        ),
      ),
      routes: {
        '/': (context) =>  RouterScreenWidget(),
      },
      initialRoute: '/',
    );
  }
}
