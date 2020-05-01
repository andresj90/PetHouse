import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildUserProfile()
    );
  }

}

Widget buildUserProfile() => Stack(
  children: <Widget>[
    Container(
      color: Colors.blue[700],
      constraints: BoxConstraints.expand(),
      child: Image.asset('assets/images/caregiver1.png'),
      alignment: Alignment.topCenter,
    ), 
   Positioned(
     bottom: 0,
     child:  Card(
      elevation: 5,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Icon(Icons.book)
              )
            ],
          )
        ],
      ) 
       
    ),  
   )
  ],
); 