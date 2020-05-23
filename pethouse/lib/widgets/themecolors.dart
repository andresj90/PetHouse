import 'package:flutter/material.dart';


enum AppTheme {
 White, Dark, LightGreen, DarkGreen, Ligth
}

/// Returns enum value name without enum class name.
String enumName(AppTheme anyEnum) {
 return anyEnum.toString().split('.')[1];
}

final appThemeData = {
 AppTheme.White : ThemeData(
   brightness: Brightness.light,
   primaryColor: Colors.white,
   buttonColor: Colors.pink
 ),
 AppTheme.Dark : ThemeData(
   brightness: Brightness.dark,
   primaryColor: Colors.black
 ),
 AppTheme.LightGreen: ThemeData(
   brightness: Brightness.light,
   primaryColor: Colors.lightGreen,
    buttonColor: Colors.pink
 ),
 AppTheme.DarkGreen: ThemeData(
   brightness: Brightness.dark,
   primaryColor: Colors.green
 ),
  AppTheme.Ligth: ThemeData(
   brightness: Brightness.light,
   primaryColor: Color(0xff00bfa5),
   dialogBackgroundColor: Color(0xff00bfa5),   
   textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6:  TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
 )
};