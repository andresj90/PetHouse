import 'package:flutter/cupertino.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:pethouse/Animation/FadeAnimation.dart';
import '../widgets/bottomnavigationbar.dart';
import '../widgets/appbar.dart';

class StoreKeeper extends StatefulWidget {
  @override
  _StoreKeeperState createState() => _StoreKeeperState();
}

class _StoreKeeperState extends State<StoreKeeper> {
  String image;
  String name;
  String address;
  String distance;
  String distancetime;

  _StoreKeeperState({
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
      widget = buildListView(guardlist, context, screenSize.size.width, this);
    } else {
      widget = buildDualPanel(guardlist, context, screenSize.size.width, this);
    }

    return Scaffold(
      appBar: ApplicationBar.generateAppBar('Guarderias', true),
      body: widget,
      // Text(screenSize.size.toString()),
      bottomNavigationBar:
          AppBottomNavigationBar.buildBottomNavigationBar(context, 0),
    );
  }
}

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
                        itemCount: guardlist.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return makeItem(
                              image: guardlist[index]['image'],
                              name: guardlist[index]['name'],
                              address: guardlist[index]['address'],
                              distime: guardlist[index]['distancetime'],
                              dis: guardlist[index]['distance'],
                              contexto: context
                              );
                        }),
                  ),),
                ],
              ),
            )),
      ),
      makePoint(top: 250.0, left: 100.0),
      makePoint(top: 125.0, left: 86.0),
      makePoint(top: 180.0, left: 80.0),
      makePoint(top: 220.0, left: 199.0),
      makePoint(top: 230.0, left: 150.0),
      makePoint(top: 300.0, left: 100.0),
      makePointMe(top: 125.0, left: 150.0),
    ],
  );
}

//buildcardforDual
// este no
Widget buildCardDualPanel(
    var guard, context, _StoreKeeperState _storeKeeperState) {
  return InkWell(
    onTap: () => {
      _storeKeeperState.setState(() => {
            _storeKeeperState.image = guard["image"],
            _storeKeeperState.name = guard["name"],
            _storeKeeperState.address = guard["address"],
            _storeKeeperState.distance = guard["distance"],
            _storeKeeperState.distancetime = guard["distancetime"],
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
                    guard["image"],
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
                        Text(guard["name"]),
                        Text('Address: ${guard["address"]}'),
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
              Text(guard["distance"]),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.timer),
              SizedBox(
                width: 5,
              ),
              Text(guard["distancetime"])
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

Widget buildListView(List guardList, BuildContext context, double size,
    _StoreKeeperState guard) {
  if (size <= 600) {
    return portraitView(context);
  } else {
    return ListView.builder(
        itemCount: guardList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCardDualPanel(guardList[index], context, guard);
        });
  }
}

//Build dual panel este si es en tablet

Widget buildDualPanel(List guardList, BuildContext context, double size,
    _StoreKeeperState guard) {
  return Row(children: <Widget>[
    Expanded(flex: 2, child: buildListView(guardList, context, size, guard)),
    Expanded(
      flex: 4,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(guard.image)),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(width: 20, height: 40),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    'Distancia: ' + guard.distance,
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
                    'Nombre: ' + guard.name,
                    style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(Icons.pin_drop),
                Container(                  
                  // margin: EdgeInsets.only(right: 20),
                  child: Text(
                    'Direccion: ' + guard.address,
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
                  'Tiempo en llegar: ' + guard.distancetime,
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

List guardlist = [
  {
    "image": "assets/images/guar1.png",
    "name": "Pet love ",
    "address": "Calle 1",
    "distance": "5 Miles",
    "distancetime": "10 Min"
  },
  {
    "image": "assets/images/guar2.png",
    "name": "Pet Family",
    "address": "Calle 23",
    "distance": "8 Miles",
    "distancetime": "22 Min"
  },
  {
    "image": "assets/images/guar3.png",
    "name": "Animal Rescue",
    "address": "Calle 25",
    "distance": "30 Miles",
    "distancetime": "50 Min"
  },
   {
    "image": "assets/images/guar1.png",
    "name": " Reino Animal ",
    "address": "Calle 14",
    "distance": "4 Miles",
    "distancetime": "10 Min"
  },
   {
    "image": "assets/images/guar3.png",
    "name": "Sucursal Canina",
    "address": "Calle 40",
    "distance": "15 Miles",
    "distancetime": "25 Min"
  },
   {
    "image": "assets/images/guar2.png",
    "name": "Pijama Doc",
    "address": "Calle 50",
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

Widget makeItem({image, dis, name, address, distime,contexto}) {
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


showAlertDialog(BuildContext context,name) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancelar"),
    onPressed:  () {
      Navigator.of(context).pop(); // dismiss 
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Reservar"),
    onPressed:  () {
      Navigator.of(context).pop(); // dismiss 
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirmar"),
    content: Text("Desea reservar un espacio en la guarderia: " +  name + " para hoy?"),
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