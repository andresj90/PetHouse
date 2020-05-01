import 'package:flutter/material.dart';
// import 'package:pethouse/screens/settings.dart';
// import '../screens/settings.dart';

class AppBottomNavigationBar {
  State bottomNavState; 
  static Widget buildBottomNavigationBar(BuildContext context){
       return BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
        //  backgroundColor: Colors.blue,
         items:  <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              title: Text('Home')
              ),
             BottomNavigationBarItem(
              icon: Icon(Icons.message), 
              title: Text('Inbox')
              ), 
               BottomNavigationBarItem(
              icon: Icon(Icons.settings), 
              title: Text('Settings'),
              
              ), 
               BottomNavigationBarItem(
              icon: Icon(Icons.forum), 
              title: Text('Forum')
              ), 
              BottomNavigationBarItem(
              icon: Icon(Icons.person), 
              title: Text('Profile')
              
              ), 
         ],
         onTap: (int index){
           switch(index) {
             case 0:
               Navigator.pushNamed(context, '/home');  
              // MaterialPageRoute(builder: (_) => Setting()) ;
               break;
             case 2:
            
               Navigator.pushNamed(context, '/settings');  
              // MaterialPageRoute(builder: (_) => Setting()) ;
               break;
             default:
             print('option invalid');
           }
         },
      );
  }
}