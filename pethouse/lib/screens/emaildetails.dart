import 'package:flutter/material.dart';



class EmailDetails extends StatelessWidget {

   var email; 

  EmailDetails(
     this.email
  ); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: 
       
      //  Text(this.email.toString()) 
       
      buildNewsLayout(this.email)
    );  
  }

}

Widget buildNewsLayout(var email) =>Stack(
  children: <Widget>[
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/portraitNews1.jpg'),
          fit: BoxFit.fitWidth, 
        ),
      ),
    
    ),
    Positioned(
  bottom: 48.0,
  left: 10.0,
  right: 10.0,
  child: Card(
    elevation: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            email["subject"],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              email["emailBody"]
            , textAlign: TextAlign.center,
            ),
        ),
      ],
    ),
  ),
),
  ],
); 

