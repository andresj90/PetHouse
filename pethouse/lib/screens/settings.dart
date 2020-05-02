import 'package:flutter/material.dart';
import '../main.dart';

class Setting extends StatefulWidget {
  static var tema = ThemeData.dark();
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  
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
               flag=!flag;
               setState(() {
                 print(flag);
                 if (flag) {
                  //  EntryPoint.changeTheme = ThemeData.dark();
                      MaterialApp(
                          theme: ThemeData.dark(),
                      );
                 } else {
                    // EntryPoint.changeTheme = ThemeData.light();
                           MaterialApp(
                          theme: ThemeData.light(),
                      );
                 }
               
               });
            }
          } ,
      ),
    )
    ),
    );
  }
}