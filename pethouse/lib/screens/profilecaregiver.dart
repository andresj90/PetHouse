import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomnavigationbar.dart';

class ProfileCareGiver extends StatelessWidget {
  var data;

  ProfileCareGiver(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.generateAppBar('Perfil  Cuidador', true),
      body: _layoudDetails(context, data),
      bottomNavigationBar:
          AppBottomNavigationBar.buildBottomNavigationBar(context),
    );
  }
}

Widget portraitDetail(context, data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Divider(
        thickness: 4,
        height: 10,
      ),
      SizedBox(
        height: 10,
        width: double.infinity,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 25,
          ),
          Text(
            'Nombre: ' + data['name'],
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 20, height: 35),
          Text(
            'Direccion: ' + data['address'],
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 20, height: 50),
          Expanded(
            child: Text(
              'Descripcion: ' + data['about'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
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
          SizedBox(height: 100),
          Container(
              height: 50.0,
              width: 250,
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
                      'Solicitar',
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 20, height: 20),
            Text(
              'Direccion: ' + data['address'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 20, height: 20),
            Expanded(
              child: Text(
                'Descripcion: ' + data['about'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
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
                            fontFamily: 'Montserrat',
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                )),
          ],
        )
      ],
    ),
  );
}

Widget _picture(context, data) => Container(
      width: 500,
      height: 300,
      margin: EdgeInsets.only(top: 20, bottom: 40),
      decoration: BoxDecoration(
          image: new DecorationImage(
              fit: BoxFit.cover, image: AssetImage(data['image'])),
          borderRadius: BorderRadius.circular(20)),
    );

Widget _layoudDetails(context, data) {
  return SingleChildScrollView(
      child: Column(
    children: <Widget>[
      _picture(context, data),
      portraitDetail(context, data),
    ],
  ));
}

 