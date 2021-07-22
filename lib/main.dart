import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/homePage.dart';
import 'package:flutter_tutorial/pages/login.dart';

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
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(brightness: Brightness.dark),

      // Routing
      initialRoute: "/home",
      routes: {
        "/": (context) => Login(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
