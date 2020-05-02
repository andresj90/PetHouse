import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomnavigationbar.dart';

class DetailVeterinary extends StatelessWidget {
  var data;

  DetailVeterinary(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoudDetails(context, data),
      appBar: ApplicationBar.generateAppBar('Detalle Veterinaria', true),
      bottomNavigationBar: AppBottomNavigationBar.buildBottomNavigationBar(context),
    );
  }

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
          portraitDetail(context, data),
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
}
