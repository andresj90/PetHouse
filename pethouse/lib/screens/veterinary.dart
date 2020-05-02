import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:pethouse/views/veterinaryList.dart';
import '../widgets/bottomnavigationbar.dart';
import '../widgets/appbar.dart';

class Veterinary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    Widget widget;

    if (screenSize.size.width <= 600) {
      widget = buildListView(vetList, context, screenSize.size.width);
    } else {
      widget = buildDualPanel(vetList, context, screenSize.size.width);
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

Widget buildCard(var veterinary) {
  return Card(
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
  );
}

//buildcardforDual

Widget buildCardDualPanel(var veterinary) {
  return Card(
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
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
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
  );
}

//ListView Builder

Widget buildListView(List veterinaryList, BuildContext context, double size) {
  if (size <= 600) {
    return ListView.builder(
        itemCount: veterinaryList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCard(veterinaryList[index]);
        });
  } else {
    return ListView.builder(
        itemCount: veterinaryList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCardDualPanel(veterinaryList[index]);
        });
  }
}

//Build dual panel

Widget buildDualPanel(List veterinaryList, BuildContext context, double size) {
  return Row(
    children: <Widget>[
      Expanded(child: buildListView(veterinaryList, context, size)),
      Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(color: Colors.amber),
          )),
    ],
  );
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
    "image": "assets/images/veterinary1.jpg",
    "name": "Veterinary 1",
    "address": "Address 1",
    "distance": "5 Miles",
    "distancetime": "10 Min"
  },
  {
    "image": "assets/images/veterinary1.jpg",
    "name": "Veterinary 1",
    "address": "Address 1",
    "distance": "5 Miles",
    "distancetime": "10 Min"
  },
];
