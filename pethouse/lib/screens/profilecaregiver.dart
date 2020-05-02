import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pethouse/screens/veterinary.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomnavigationbar.dart';

class ProfileCareGiver extends StatelessWidget {
  var data;

  ProfileCareGiver(this.data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: ApplicationBar.generateAppBar('Profile Caregiver', true),
      body: Text(data.toString()),
      bottomNavigationBar:  AppBottomNavigationBar.buildBottomNavigationBar(context),
    );
  }
}

//Widget portraitVista(context,data) {
//  return Container(
//    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//    child: new Stack(
//      children: <Widget>[
//       Column(
//              children: <Widget>[
//                Container(
//                    width: 150.0,
//                    height: 150.0,
//                    alignment: Alignment.center,
//                    decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image: AssetImage(data['image']),
//                          fit: BoxFit.cover,
//                        ),
//                        borderRadius: BorderRadius.all(
//                          Radius.circular(75.0),
//                        ),
//                        boxShadow: [
//                          BoxShadow(
//                              blurRadius: 15.0, color: Colors.black)
//                        ])),
//                SizedBox(height: 10.0),
//                Divider(
//                  color: Colors.black,
//                  height: 1,
//                ),
//                SizedBox(height: 20.0),
//                Text(
//                  'Nombre: ' +data['name'],
//                  style: TextStyle(
//                    fontSize: 20.0,
//                    fontStyle: FontStyle.italic,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//                SizedBox(height: 15.0),
//                Text(
//                  'Dirección: ' +  '' ,
//                  style: TextStyle(
//                    fontSize: 18.0,
//                    fontStyle: FontStyle.italic,
//                  ),
//                ),
//                SizedBox(height: 15.0),
//                Text(
//                  'Descripcion: '  '' ,
//                  style: TextStyle(
//                    fontSize: 18.0,
//                    fontStyle: FontStyle.italic,
//                  ),
//                ),
//                SizedBox(height: 10.0),
//                Container(
//                    height: 50.0,
//                    width: 125.0,
//                    child: Material(
//                      borderRadius: BorderRadius.circular(20.0),
//                      shadowColor: Colors.greenAccent,
//                      color: Colors.green,
//                      elevation: 7.0,
//                      child: GestureDetector(
//                        onTap: () {},
//                        child: Center(
//                          child: Text(
//                            'Solicitar',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontFamily: 'Montserrat',
//                                fontSize: 18.0),
//                          ),
//                        ),
//                      ),
//                    ))
//              ],
//            ),
//  ),
//      );
//}


Widget portraitDetail(context, data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        height: 10,
        width: double.infinity,
      ),
      Row(
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
          ),
          Text(
            'Nombre: ' + data['name'],
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          SizedBox(width: 20, height: 20),
          Text(
            'Direccion: ' + data['address'],
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          SizedBox(width: 20, height: 20),
          Text(
            'Distancia: ' + data['distance'],
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
          ),
          Text(
            'Tiempo en llegar: ' + data['distancetime'],
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ],
  );
}

Widget landScapeDetail(context, data) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
          width: double.infinity,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
            ),
            Text(
              'Nombre: ' + data['name'],
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 20, height: 20),
            Text(
              'Direccion: ' + data['address'],
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 20, height: 20),
            Text(
              'Distancia: ' + data['distance'],
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
            ),
            Text(
              'Tiempo en llegar: ' + data['distancetime'],
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _picture(context, data) => Container(
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height / 2,
  decoration: BoxDecoration(
    image: new DecorationImage(
        fit: BoxFit.cover, image: AssetImage(data['image'])),
  ),
);

Widget _pictureLandScape(context, data) => Container(
  width: MediaQuery.of(context).size.width / 2.5,
  height: MediaQuery.of(context).size.height,
  decoration: BoxDecoration(
    image: new DecorationImage(
        fit: BoxFit.cover, image: AssetImage(data['image'])),
  ),
);

Widget _layoudDetails(context, data) {
  Orientation orientation = MediaQuery.of(context).orientation;
  if (orientation == Orientation.portrait) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _picture(context, data),
//            portraitDetail(context, data),
          ],
        ));
  } else {
    return Row(
      children: <Widget>[
        _pictureLandScape(context, data),
        Container(
          width: MediaQuery.of(context).size.width / 1.8,
          height: MediaQuery.of(context).size.height,
          child: landScapeDetail(context, data),
        )
      ],
    );
  }
}


