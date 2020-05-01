import 'package:flutter/material.dart';

// Write the code for the view, display veterinary list 

// void main() => runApp(VeterinaryList()); 



class VeterinaryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView(
         children: getVetListFromDB(list)
       )
    ); 
    
  }
}

//methods


//read the list of objects to be rendered 
List<Widget>  getVetListFromDB(List vetList) {
   List <Widget> list = new List();
   for (var vet in vetList) {
     Card card = buildCard(vet["picture"], vet["name"], vet["distance"], vet["address"], vet["rating"], vet["votes"]); 
     list.add(card); 
   }

   return list; 
}

//function card 

Widget buildCard(String imgLocation, String name, String distance, String address, double rating, int votes) => Card (
  child: Container(
    padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
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
              ListTile(
                leading: Text(name),
                trailing: Text(distance),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_city
                ),
                title: Text(address),
              ), 
              ListTile(
                leading: Icon(
                  Icons.rate_review
                ),
                subtitle: Text(rating.toString() + "($votes)"),
              ), 
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
  {"picture" : 'assets/images/petsathome.png', "name": "Little Creatures", "distance": "1.3 Km", "address": "852 Avenue", "rating" : 4.7 , "votes": 254 }, 
  {"picture" : 'assets/images/petsathome.png', "name": "Pet Lovers", "distance": "2.5 Km", "address": "MilkWakee Av 128 St", "rating" : 4.6 , "votes": 188 }, 
  {"picture" : 'assets/images/petsathome.png', "name": "Animal Planet", "distance": "2.8 Km", "address": "128th Jump Street", "rating" : 4.9 , "votes": 89 }, 
  {"picture" : 'assets/images/petsathome.png', "name": "Animal's Time", "distance": "2.25 Km", "address": "Robinson Street 128th", "rating" : 4.6 , "votes": 220 }, 
  {"picture" : 'assets/images/petsathome.png', "name": "We love Pets", "distance": "5.6 Km", "address": "125th Levano Street", "rating" : 4.6 , "votes": 745 }, 
  {"picture" : 'assets/images/petsathome.png', "name": "Peludos Gang", "distance": "5.4 Km", "address": "54th Avenue River", "rating" : 4.2 , "votes": 55 }, 
  {"picture" : 'assets/images/petsathome.png', "name": "The animal Farm", "distance": "4.1 Km", "address": "Evergreen av 125", "rating" : 4.7 , "votes": 301 }, 
  {"picture" : 'assets/images/petsathome.png', "name": "Animal Crew", "distance": "4.2 Km", "address": "Chandler Av 145", "rating" : 4.1, "votes": 45 }, 
  {"picture" : 'assets/images/petsathome.png', "name": "Pet Foundation", "distance": "4.6 Km", "address": "Miramar St 124", "rating" : 4.6 , "votes":  125}, 
  {"picture" : 'assets/images/petsathome.png', "name": "Ninja Pets", "distance": "3.5 Km", "address": "Venice Beach", "rating" : 4.9 , "votes": 523 }, 
]; 
