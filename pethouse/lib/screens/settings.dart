import 'package:flutter/material.dart';


class Setting extends StatefulWidget {
  static var tema = ThemeData.dark();
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  static var tema = ThemeData.light();
  bool flag = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Center(
        child: Switch(
          value: false, 
          onChanged: (value) {
            if(value) {
               setState(() {
                 MaterialApp(
                   theme: ThemeData.light(),
                 );
               
               });
            }
          } ,
      ),
    )
    ),
    );
  }
}