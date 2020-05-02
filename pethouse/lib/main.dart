import 'package:flutter/material.dart';
import 'package:pethouse/screens/Messenger.dart';
import 'package:pethouse/screens/emaildetails.dart';
import 'package:pethouse/screens/profilecaregiver.dart';
import 'package:pethouse/screens/veterinary.dart';
import 'package:pethouse/screens/caregiver.dart';
import 'views/homescreen.dart';
import 'screens/settings.dart';


void main() =>  runApp(EntryPoint());

class EntryPoint extends StatefulWidget {
  static void  changeTheme(bool flag) {
       _EntryPointState.changeTheme(flag);
   }
  //  static ThemeData changeTheme;
  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  
  static ThemeData tema = ThemeData.light();
  static State estado; 
  
   _EntryPointState(); 

   static void changeTheme(bool flag) {
     
         if (flag) {
            tema = ThemeData.dark();
         } else {
            tema = ThemeData.light();
         }

    
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Pet House',
    theme: tema,
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/home',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/veterinary': (context) => Veterinary(),
      '/settings':(context) => Setting(),
      '/home':(context) => HomeScreen(),
      '/caregiver':(context) => CareGiver(),
      '/messenger':(context) => Messenger(),
      // '/profilecaregiver':(context) => ProfileCareGiver(''),
      // '/emaildetail':(context) => EmailDetails(),
    }
    
  );
}
}