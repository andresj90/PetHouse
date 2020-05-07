import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:pethouse/screens/detailVeterinary.dart';
import 'package:pethouse/views/veterinaryList.dart';
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
          AppBottomNavigationBar.buildBottomNavigationBar(context),
    );
  }
}

// Widgets

Widget buildCard(var veterinary, context) {
  return InkWell(
    onTap: () => {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => DetailVeterinary(veterinary)))
    },
    child: Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Image.asset(
                veterinary["image"],
                // fit: BoxFit.cover,
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(veterinary["name"]),
                    Text('Address: ${veterinary["address"]}'),
                    SizedBox(
                      height: 10.0,
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
                    )
                  ],
                ),
              ))
        ],
      ),
    ),
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
    return ListView.builder(
        itemCount: veterinaryList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCard(veterinaryList[index], context);
        });
  } else {
    return ListView.builder(
        itemCount: veterinaryList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCardDualPanel(veterinaryList[index], context, veterinary);
        });
  }
}

//Build dual panel

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
              margin: EdgeInsets.only(top: 20, bottom: 20, right: 10),
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(veterinary.image)),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Divider(
              thickness: 4,
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 20,
                  height: 30,
                ),
                Icon(Icons.store),
                Text(
                  'Nombre: ' + veterinary.name,
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
                SizedBox(width: 20, height: 40),
                Icon(Icons.pin_drop),
                Text(
                  'Direccion: ' + veterinary.address,
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
                SizedBox(width: 20, height: 40),
                Icon(Icons.transfer_within_a_station),
                Text(
                  'Distancia: ' + veterinary.distance,
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
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                Text(
                  'Tiempo en llegar: ' + veterinary.distancetime,
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
    "name": "Veterinary 1",
    "address": "Address 1",
    "distance": "5 Miles",
    "distancetime": "10 Min"
  },
  {
    "image": "assets/images/veterinary2.jpg",
    "name": "Veterinary 2",
    "address": "Address 2",
    "distance": "8 Miles",
    "distancetime": "15 Min"
  },
  {
    "image": "assets/images/veterinary3.jpg",
    "name": "Veterinary 3",
    "address": "Address 33",
    "distance": "15 Miles",
    "distancetime": "25 Min"
  },
];
