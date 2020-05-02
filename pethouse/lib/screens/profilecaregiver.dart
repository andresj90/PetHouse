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
      body: portraitVista(context, data),
      bottomNavigationBar:  AppBottomNavigationBar.buildBottomNavigationBar(context),
    );
  }
}

Widget portraitVista(context,data) {
  return new Scaffold(
    appBar: ApplicationBar.generateAppBar('Profile', true),
    body:  new Stack(
      children: <Widget>[
        Positioned(
            width: 350.0,
            left: 25.0,
            top: MediaQuery.of(context).size.height / 30,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(data['image']),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(75.0),
                        ),
                        boxShadow: [
                          BoxShadow(blurRadius: 15.0, color: Colors.black)
                        ])),
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  height: 1,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Nombre: ' + data['name'],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Dirección: ' + data['address'],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Descripcion: ' + data['about'],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                    height: 50.0,
                    width: 125.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Solicitar',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat', fontSize: 18.0),
                          ),
                        ),
                      ),
                    ))
              ],
            ))
      ],
    ),

  );
}


