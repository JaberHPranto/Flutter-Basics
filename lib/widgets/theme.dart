import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creemColor,
        buttonColor: bluishColor,
        accentColor: bluishColor,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: Theme.of(context).textTheme,
            elevation: 0.0),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreemColor,
        buttonColor: lightBluishColor,
        accentColor: lightBluishColor,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: Theme.of(context).textTheme.copyWith(
                headline6:
                    context.textTheme.headline6!.copyWith(color: Colors.white)),
            elevation: 0.0),
      );

  // Colors
  static Color creemColor = Color(0xfff5f5f5);
  static Color darkCreemColor = Vx.gray900;
  static Color bluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
