import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
   buttonColor: Colors.pink,
   textTheme: themeFonts
 ),
 AppTheme.Dark : ThemeData(
   brightness: Brightness.dark,
   primaryColor: Colors.black,
   textTheme: themeFontsdark
 ),
 AppTheme.LightGreen: ThemeData(
   brightness: Brightness.light,
   primaryColor: Colors.lightGreen,
    buttonColor: Colors.pink,
    textTheme: themeFonts
 ),
 AppTheme.DarkGreen: ThemeData(
   brightness: Brightness.dark,
   primaryColor: Colors.green,
   textTheme: themeFonts
 ),
  AppTheme.Ligth: ThemeData(
   brightness: Brightness.light,
   primaryColor: Color(0xff00bfa5),
   dialogBackgroundColor: Color(0xff00bfa5),   
   textTheme: themeFonts
 )
};

TextTheme themeFonts = TextTheme(
     headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
     headline5: GoogleFonts.notoSans(color: Colors.black, fontSize: 13) ,
     headline6:  GoogleFonts.notoSans(color: Colors.black),
     bodyText1: GoogleFonts.novaFlat(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
     bodyText2: GoogleFonts.novaFlat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
); 


TextTheme themeFontsdark = TextTheme(
     headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
     headline5: GoogleFonts.notoSans( fontSize: 13) ,
     headline6:  GoogleFonts.notoSans(),
     bodyText1: GoogleFonts.novaFlat( fontSize: 20, fontWeight: FontWeight.w500),
     bodyText2: GoogleFonts.novaFlat( fontSize: 18, fontWeight: FontWeight.w500),
); 