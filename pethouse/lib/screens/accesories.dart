import 'package:flutter/cupertino.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:pethouse/Animation/FadeAnimation.dart';
import '../widgets/bottomnavigationbar.dart';
import '../widgets/appbar.dart';

class Accessories extends StatefulWidget {
  @override
  _AccessoriesState createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.generateAppBar('Accesorios', true),
      body: portraitView(context),      
      bottomNavigationBar:
          AppBottomNavigationBar.buildBottomNavigationBar(context, 0),
    );
  }
}

Widget portraitView(context) {
  return Stack(
    children: <Widget>[
      Column(
        children: <Widget>[
          FadeAnimation(2, Container(
            width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height / 2.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/accesories.jpg'),
                    fit: BoxFit.fill)),
          ),),
          //  Container(
          //   width: 350,
          //   height: 200,
          //    child: ListView.builder(
          //                 itemCount: listaccesories.length,
          //                 scrollDirection: Axis.horizontal,
          //                 itemBuilder: (context, index) {
          //                   print(listaccesories[index]['image']);
          //                   return makeItem(
          //                       image: listaccesories[index]['image'],
          //                       valoracion: listaccesories[index]['valoracion'],
          //                       name: listaccesories[index]['name'],        
          //                       price: listaccesories[index]['price'],        
          //                       contexto: context);
          //                 }),),
           Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                 FadeAnimation(2, Container(
                    height: 220,
                    child: ListView.builder(
                         itemCount: listaccesories.length,
                          scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          print(listaccesories[index]['image']);
                          return makeItem(
                              image: listaccesories[index]['image'],
                                valoracion: listaccesories[index]['valoracion'],
                                name: listaccesories[index]['name'],        
                                price: listaccesories[index]['price'],        
                                contexto: context);
                        }),
                  ),)
                ],
              ),
            ),
        ],        
      ),
         
    ],
  );
}

 
List listaccesories = [
  {
    "image": "assets/images/hueso.jpg",
    "name": "Hueso",
    "valoracion": "4.0",
    "price": "10.000",    
  },   
    {
    "image": "assets/images/collar.jpg",
    "name": "Collar",
    "valoracion": "4.0",
    "price": "7.000",    
  },
    {
    "image": "assets/images/pelota.jpg",
    "name": "Pelota",
    "valoracion": "4.0",
    "price": "15.000",    
  },
];



Widget makeItem({image, valoracion, name, price,  contexto}) {
  return AspectRatio(
    aspectRatio: 1.7 / 2,
    child: GestureDetector(
      onTap: () {
        showAlertDialog(contexto, name);
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),         
                Icon(Icons.star),      
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        ),
                    child: Text(
                      valoracion.toString(),                      
                    )),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.monetization_on),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    child: Text( 
                      price.toString(),                      
                    )),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_box),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      'Disponible'
                      ),
                    ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name.toString(),
              style: TextStyle(             
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
                        
          ],
        ),
      ),
    ),
  );
}

showAlertDialog(BuildContext context, name) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Reservar"),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirmar"),
    content: Text(
        "Desea reservar un espacio en la guarderia: " + name + " para hoy?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
