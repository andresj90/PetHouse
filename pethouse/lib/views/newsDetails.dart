import 'package:flutter/material.dart';



class NewsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildNewsLayout()
    );  
  }

}

Widget buildNewsLayout() =>Stack(
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
            "Vacunación antirrábica para caninos y felinos",
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
            "La rabia es una enfermedad zoonótica, fatal y transmisible, producida por el virus rábico que afecta a los animales de sangre caliente incluyendo al hombre. La transmisión al hombre se produce por la mordedura, arañazo o lamedura de heridas superficiales en la piel (abiertas o recientes) de un animal rabioso."  
            , textAlign: TextAlign.center,
            ),
        ),
      ],
    ),
  ),
),
  ],
); 

