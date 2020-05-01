import 'dart:ui';

import 'package:flutter/material.dart';


class CareGiverList extends StatelessWidget {
   
   

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context).size;

    // if (mediaQuery.width > 600.0) {
    //    return Text('BIGGER THAN 450'); 
    // } else {

    //   return Text('SMALLER THAN 450'); 
    // } 

    // ListView(
    //     //  children: getVetListFromDB(list),
    //     children: <Widget>[
        
    //     ],
    //    ),

    return Scaffold(
       appBar: AppBar(
         title: Text('PetHouse'),
       ),
       bottomNavigationBar: BottomNavigationBar(items: null),
    );
  }
}


//methods


//read the list of objects to be rendered 
List<Widget>  getVetListFromDB(List vetList) {
   List <Widget> list = new List();
   Color color; 
   for (var vet in vetList) {
     switch (vet["position"]) {
       case "Experto":
             color = Colors.red[300];   
         break;
       case "Intermedio":
             color = Colors.blue[300];   
         break;
        case "Entusiasta":
             color = Colors.green[300];   
         break; 
       default:
     }
     Card card = buildCard(vet["picture"], vet["name"], vet["position"], vet["ranking"], color); 
     list.add(card);
   }

   return list; 
}

//function card 

Widget buildCard(String imgLocation, String name, String position, String ranking, Color color) => Card (
  color:Colors.red[300],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
  ),
  child: Container(
    padding: EdgeInsets.fromLTRB(6, 6, 6, 0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Image.asset(
            imgLocation
          )
        ), 
        Expanded(
          child:  Column(
            children: <Widget>[
              Text(name, 
              style: title,
              ), 
              Text(position), 
              Text(ranking)
            ],
          )
        )
      ],
    ),
  ),
); 


// Variables 

//list of objects 
List <dynamic> list =  [
  {"picture" : 'assets/images/caregiver1.png', "name": "Little Creatures", "position": "1.3 Km", "ranking": "Experto"}, 
  {"picture" : 'assets/images/caregiver1.png', "name": "Little Creatures", "position": "1.3 Km", "ranking": "Intermedio"}, 
  {"picture" : 'assets/images/caregiver1.png', "name": "Little Creatures", "position": "1.3 Km", "ranking": "Entusiasta"}, 
  {"picture" : 'assets/images/caregiver1.png', "name": "Little Creatures", "position": "1.3 Km", "ranking": "Experto"}, 
  {"picture" : 'assets/images/caregiver1.png', "name": "Little Creatures", "position": "1.3 Km", "ranking": "Intermedio"}, 
  {"picture" : 'assets/images/caregiver1.png', "name": "Little Creatures", "position": "1.3 Km", "ranking": "Entusiasta"} 
]; 


var title = TextStyle(
  fontSize: 25, 
  fontWeight: FontWeight.w500, 
  color: Colors.white
);