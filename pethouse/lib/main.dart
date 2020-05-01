import 'package:flutter/material.dart';
import 'package:pethouse/screens/profilecaregiver.dart';
import 'package:pethouse/screens/veterinary.dart';
import 'package:pethouse/screens/caregiver.dart';
import 'views/homescreen.dart';
import 'screens/settings.dart';

void main() =>  runApp(MaterialApp(   
    title: 'Pet House',
    theme: Setting.tema,
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/veterinary': (context) => Veterinary(),
      '/settings':(context) => Setting(),
      '/home':(context) => HomeScreen(),
      '/':(context) => CareGiver(),
      '/profilecaregiver':(context) => ProfileCareGiver(),
    },
  ));


void main() => runApp(MyApp());











