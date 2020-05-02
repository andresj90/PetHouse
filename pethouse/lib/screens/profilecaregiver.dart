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
    return new Scaffold(
      appBar: ApplicationBar.generateAppBar('Profile', true),
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
                color: Colors.blue.withOpacity(0.8)
            ),
            clipper: getClipper(),
          ),
          Positioned(
              width: 350.0,
              left: 25.0,
              top: MediaQuery.of(context).size.height / 5,
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
                          borderRadius: BorderRadius.all(Radius.circular(75.0),
                          ),
                          boxShadow: [ BoxShadow(blurRadius: 15.0, color: Colors.black)])
                  ),
                  SizedBox(height: 90.0),
                  Text(
                    'hola' + data['name']  ,
                  )
                ],
              )
          )
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar.buildBottomNavigationBar(context),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 1.6);
    path.lineTo(size.width + 125 , 0.0);
    path.close();
    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}






