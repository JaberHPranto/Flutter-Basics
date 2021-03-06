import 'package:flutter/material.dart';
import 'package:flutter_tutorial/core/store.dart';
import 'package:flutter_tutorial/pages/cartPage.dart';
import 'package:flutter_tutorial/pages/homePage.dart';
import 'package:flutter_tutorial/pages/login.dart';
import 'package:flutter_tutorial/utils/routes.dart';
import 'package:flutter_tutorial/widgets/theme.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      // light theme
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRoute,
      routes: {
        "/": (context) => Login(),
        AppRoutes.loginRoute: (context) => Login(),
        AppRoutes.homeRoute: (context) => HomePage(),
        AppRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
