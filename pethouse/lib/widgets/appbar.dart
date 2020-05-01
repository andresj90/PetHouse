import 'package:flutter/material.dart';

class ApplicationBar {
     
   String title; 
   bool isCenter; 

   ApplicationBar();

   
   static Widget generateAppBar(String title, bool isCenter) {
     return AppBar(
       title: Text(
         title, 
       ),
       centerTitle: isCenter, 
      //  actions: <Widget>[
      //   IconButton(icon: Icon(Icons.forum), onPressed: null)
      //  ],   

     ); 
   }

}