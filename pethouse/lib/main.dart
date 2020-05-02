import 'package:flutter/material.dart';
import 'package:pethouse/screens/profilecaregiver.dart';
import 'package:pethouse/screens/veterinary.dart';
import 'package:pethouse/screens/caregiver.dart';
import 'views/homescreen.dart';
import 'screens/settings.dart';

void main() =>  runApp(EntryPoint());

class EntryPoint extends StatefulWidget {
   static ThemeData changeTheme;
  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Pet House',
    theme: EntryPoint.changeTheme,
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/home',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/veterinary': (context) => Veterinary(),
      '/settings':(context) => Setting(),
      '/home':(context) => HomeScreen(),
      '/caregiver':(context) => CareGiver(),
//      '/profilecaregiver':(context) => ProfileCareGiver(),














