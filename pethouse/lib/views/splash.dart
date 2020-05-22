import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () => Navigator.pushNamed(context, '/home'));
    return MaterialApp(home: vista(), debugShowCheckedModeBanner: false,);
  }
}

Widget vista() {
  return Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.red),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        height: 200.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/21645_2.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(180.0),
                              ),
                              boxShadow: [
                            BoxShadow(blurRadius: 1.0, color: Colors.white)
                          ])),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text('PetHouse',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Text('El sitio perfecto para todo lo que necesita tu mascota. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold))
              ],
            ))
          ],
        )
      ],
    ),
  );
}
