import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/homePage.dart';
import 'package:flutter_tutorial/pages/login.dart';
import 'package:flutter_tutorial/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      // light theme
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),

      routes: {
        "/": (context) => Login(),
        AppRoutes.loginRoute: (context) => Login(),
        AppRoutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}
