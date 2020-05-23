import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:pethouse/Animation/FadeAnimation.dart';
import '../widgets/bottomnavigationbar.dart';
import '../widgets/appbar.dart';

class Veterinary extends StatefulWidget {
  @override
  _VeterinaryState createState() => _VeterinaryState();
}

class _VeterinaryState extends State<Veterinary> {
  String image;
  String name;
  String address;
  String distance;
  String distancetime;

  _VeterinaryState({
    this.image = '',
    this.name = '',
    this.address = '',
    this.distance = '',
    this.distancetime = '',
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    Widget widget;

    if (screenSize.size.width <= 600) {
      widget = buildListView(vetList, context, screenSize.size.width, this);
    } else {
      widget = buildDualPanel(vetList, context, screenSize.size.width, this);
    }

    return Scaffold(
      appBar: ApplicationBar.generateAppBar('Veterinaries', true),
      body: widget,
      // Text(screenSize.size.toString()),
      bottomNavigationBar:
          AppBottomNavigationBar.buildBottomNavigationBar(context, 0),
    );
  }
}

// Widgets -Portrait

// Widget buildCard(var veterinary, context) {
//   return InkWell(
//     onTap: () => {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (BuildContext context) => DetailVeterinary(veterinary)))
//     },
//     child: Card(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//               flex: 1,
//               child: Image.asset(
//                 veterinary["image"],
//                 // fit: BoxFit.cover,
//               )),
//           Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(veterinary["name"]),
//                     Text('Address: ${veterinary["address"]}'),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Row(
//                       children: <Widget>[
//                         Icon(Icons.pin_drop),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Text(veterinary["distance"]),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Icon(Icons.timer),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Text(veterinary["distancetime"])
//                       ],
//                     )
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     ),
//   );
// }

Widget portraitView(context) {
  return Stack(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.fill)),
        child: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.3),
            ])),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                 FadeAnimation(2, Container(
                    height: 300,
                    child: ListView.builder(
                        itemCount: vetList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          print(vetList[index]['image']);
                          return makeItem(
                              image: vetList[index]['image'],
                              name: vetList[index]['name'],
                              address: vetList[index]['address'],
                              distime: vetList[index]['distancetime'],
                              dis: vetList[index]['distance'],
                              contexto: context);
                        }),
                  ),)
                ],
              ),
            )),
      ),
      makePoint(top: 140.0, left: 30.0),
      makePoint(top: 190.0, left: 190.0),
      makePoint(top: 219.0, left: 60.0),
      makePoint(top: 300.0, left: 100.0),
      makePoint(top: 186.0, left: 75.0),
      makePoint(top: 310.0, left: 120.0),
      makePointMe(top: 200.0, left: 80.0),
    ],
  );
}

//buildcardforDual
// este no
Widget buildCardDualPanel(
    var veterinary, context, _VeterinaryState _veterinaryState) {
  return InkWell(
    onTap: () => {
      _veterinaryState.setState(() => {
            _veterinaryState.image = veterinary["image"],
            _veterinaryState.name = veterinary["name"],
            _veterinaryState.address = veterinary["address"],
            _veterinaryState.distance = veterinary["distance"],
            _veterinaryState.distancetime = veterinary["distancetime"],
          })
    },
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    veterinary["image"],
                    fit: BoxFit.fitHeight,
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(veterinary["name"]),
                        Text('Address: ${veterinary["address"]}'),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Icon(Icons.pin_drop),
              SizedBox(
                width: 5,
              ),
              Text(veterinary["distance"]),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.timer),
              SizedBox(
                width: 5,
              ),
              Text(veterinary["distancetime"])
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    ),
  );  
}

//ListView Builder

Widget buildListView(List veterinaryList, BuildContext context, double size,
    _VeterinaryState veterinary) {
  if (size <= 600) {
    // return ListView.builder(
    //     itemCount: veterinaryList.length,
    //     itemBuilder: (BuildContext context, int index) {
    return portraitView(context);
    // });
  } else {
    return ListView.builder(
        itemCount: veterinaryList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCardDualPanel(veterinaryList[index], context, veterinary);
        });
  }
}

//Build dual panel este si es en tablet

Widget buildDualPanel(List veterinaryList, BuildContext context, double size,
    _VeterinaryState veterinary) {
  return Row(children: <Widget>[
    Expanded(
        flex: 2,
        child: buildListView(veterinaryList, context, size, veterinary)),
    Expanded(
      flex: 4,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(veterinary.image)),
              ),
            ),
            Wrap(
              children: <Widget>[
                SizedBox(width: 20, height: 40),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    'Distancia: ' + veterinary.distance,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.lightBlueAccent,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Icon(Icons.store),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    'Nombre: ' + veterinary.name,
                    style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(Icons.pin_drop),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    'Direccion: ' + veterinary.address,
                    style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                Text(
                  'Tiempo en llegar: ' + veterinary.distancetime,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                Container(
                    height: 50.0,
                    width: 250.0,
                    alignment: Alignment.center,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.blueAccent,
                      color: Colors.blue,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Pedir Cita',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 22.0),
                          ),
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    ),
  ]);
}

List vetList = [
  {
    "image": "assets/images/veterinary1.jpg",
    "name": "Veterinary Animals play",
    "address": "Calle 12",
    "distance": "5 Miles",
    "distancetime": "10 Min"
  },
  {
    "image": "assets/images/veterinary2.jpg",
    "name": "Veterinary Pet Happy",
    "address": "Calle 14",
    "distance": "8 Miles",
    "distancetime": "15 Min"
  },
  {
    "image": "assets/images/veterinary3.jpg",
    "name": "Veterinary Pet life",
    "address": "Calle 15",
    "distance": "35 Miles",
    "distancetime": "25 Min"
  },

   {
    "image": "assets/images/veterinary3.jpg",
    "name": "Veterinary  Pet Family",
    "address": "Calle 16",
    "distance": "15 Miles",
    "distancetime": "25 Min"
  },

   {
    "image": "assets/images/veterinary3.jpg",
    "name": "Veterinary Pet Love",
    "address": "Calle 18",
    "distance": "15 Miles",
    "distancetime": "25 Min"
  },

   {
    "image": "assets/images/veterinary3.jpg",
    "name": "Veterinary Dogs & Cats",
    "address": "Calle 160",
    "distance": "15 Miles",
    "distancetime": "25 Min"
  },
];

Widget makePoint({top, left}) {
  return Positioned(
    top: top,
    left: left,
    child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.blue.withOpacity(0.3)),
        child: Animator<double>(
          duration: Duration(seconds: 1),
          tween: Tween<double>(begin: 4.0, end: 6.0),
          cycles: 0,
          builder: (anim) => Center(
            child: Container(
              margin: EdgeInsets.all(anim.value),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            ),
          ),
        )),
  );
}

Widget makePointMe({top, left}) {
  return Positioned(
    top: top,
    left: left,
    child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.red.withOpacity(0.3)),
        child: Animator<double>(
          duration: Duration(seconds: 1),
          tween: Tween<double>(begin: 4.0, end: 6.0),
          cycles: 0,
          builder: (anim) => Center(
            child: Container(
              margin: EdgeInsets.all(anim.value),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            ),
          ),
        )),
  );
}

Widget makeItem({image, dis, name, address, distime, contexto}) {
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
            borderRadius: BorderRadius.circular(20), color: Colors.white),
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
                Icon(Icons.directions_bus),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200]),
                    child: Text(
                      distime.toString(),
                      style: TextStyle(color: Colors.grey[500]),
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
                Icon(Icons.navigation),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200]),
                    child: Text(
                      address.toString(),
                      style: TextStyle(color: Colors.grey[500]),
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
                        color: Colors.grey[200]),
                    child: Text(
                      'Abierto',
                      style: TextStyle(color: Colors.grey[500]),
                    )),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name.toString(),
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.star_border,
                color: Colors.yellow[700],
                size: 30,
              ),
            )
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
        "Desea reservar un espacio en la Veterinaria: " + name + " para hoy?"),
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
