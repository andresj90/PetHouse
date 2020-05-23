import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:pethouse/screens/settings.dart';
// import '../screens/settings.dart';

class AppBottomNavigationBar {

  static Widget buildBottomNavigationBar(BuildContext context, int index ) {    
    return   CurvedNavigationBar(                    
            // buttonBackgroundColor: Colors.white,                
            backgroundColor: Colors.white,            
            color:  Color(0xff00bfa5),
            index: index,            
            height: 50,
            items: <Widget>[
              Icon(Icons.home),
              Icon(Icons.message),
              Icon(Icons.settings),
              Icon(Icons.forum),
              Icon(Icons.person)
            ],
            animationCurve: Curves.bounceInOut,
            animationDuration: Duration(milliseconds: 250),
            onTap: (int index) {                
                switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/home');
                  break;

                case 1:
                  Navigator.pushNamed(context, '/messenger');                  
                  break;

                case 2:
                  Navigator.pushNamed(context, '/profile');
                  print(index);

                  break;
                case 3:
                  Navigator.pushNamed(context, '/settings');
                  break;
                case 4:                
                    Navigator.pushNamed(context, '/userprofile');
                  break;             
                }
            },      
          );
  }
}
