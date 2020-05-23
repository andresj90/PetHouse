import 'package:flutter/material.dart';
import 'package:pethouse/Animation/FadeAnimation.dart';
import 'package:pethouse/screens/accesories.dart';
import 'package:pethouse/screens/caregiver.dart';
import 'package:pethouse/screens/storekeeper.dart';
import 'package:pethouse/screens/veterinary.dart';
import 'package:pethouse/widgets/bottomnavigationbar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetHouse'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
              child: Flexible(
                  child: generateCardLists(homePageCards.length, 2, context))),
        ],
      ),
      bottomNavigationBar:
          AppBottomNavigationBar.buildBottomNavigationBar(context, 0),
    );
  }
}

/* Header */

Widget servicesCard(var card, BuildContext context) => Card(
    color: card.cardColor(),
    child: new InkWell(
      onTap: () {
        card.navigateRoutes(context);
      },
      child: Stack(
        children: <Widget>[
          FadeAnimation(
            1.5,
            Container(
              child: Image.asset(card.cardImage()),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(180.0),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
            // padding: EdgeInsets.all(10 ),
            child: Text(
              card.cardCategory(),
              style: GoogleFonts.caveat(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                letterSpacing: 1.0,
              ),
            ),
          )
        ],
      ),
    ));

// ROWS FOR CARDS

Widget generateCardLists(int cardNumber, int columns, BuildContext context) =>
    GridView.count(
        crossAxisCount: columns,
        scrollDirection: Axis.vertical,
        children: List.generate(cardNumber, (index) {
          return servicesCard(homePageCards[index], context);
        }));

// NEWS CARD HEADER

// VARIABLES and classes

class CardCreator {
  String category;
  String img;
  Color color;
  CardCreator(String category, String img, Color color) {
    this.category = category;
    this.img = img;
    this.color = color;
  }

  String cardCategory() {
    return this.category;
  }

  String cardImage() {
    return this.img;
  }

  Color cardColor() {
    return this.color;
  }

  void navigateRoutes(BuildContext context) {
    switch (this.category) {
      case 'Veterinaría':
        // Navigator.pushNamed(context, '/veterinary');
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(seconds: 1),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secAnimation,
                  Widget child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.easeInOutBack);
                return ScaleTransition(
                    scale: animation,
                    child: child,
                    alignment: Alignment.center);
              },
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secAnimation) {
                return Veterinary();
              },
            ));
        break;
      case 'Guardería':
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(seconds: 1),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secAnimation,
                  Widget child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.easeInOutBack);
                return ScaleTransition(
                    scale: animation,
                    child: child,
                    alignment: Alignment.center);
              },
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secAnimation) {
                return StoreKeeper();
              },
            ));
        break;
      case 'Paseador':
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(seconds: 1),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secAnimation,
                  Widget child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.easeInOutBack);
                return ScaleTransition(
                    scale: animation,
                    child: child,
                    alignment: Alignment.center);
              },
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secAnimation) {
                return CareGiver();
              },
            ));
        break;
         case 'Accesorios':
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(seconds: 1),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secAnimation,
                  Widget child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.easeInOutBack);
                return ScaleTransition(
                    scale: animation,
                    child: child,
                    alignment: Alignment.center);
              },
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secAnimation) {
                return Accessories();
              },
            ));
        break;
      default:
    }
  }
}

List homePageCards = [
  new CardCreator(
      'Guardería', 'assets/images/dogcard1.png', Colors.purple[300]),
  new CardCreator('Paseador', 'assets/images/dogcard6.png', Colors.green[300]),
  new CardCreator(
      'Veterinaría', 'assets/images/dogcard4.png', Colors.orange[300]),
  new CardCreator(
      'Higiene', 'assets/images/dogcard1.png', Colors.deepOrange[300]),
  new CardCreator('Eventos', 'assets/images/dogcard5.png', Colors.red[300]),
  new CardCreator('Accesorios', 'assets/images/dogcard4.png', Colors.blue[300]),
];

/* STYLES */

var cardText = TextStyle(
  color: Colors.white,

  //  BoxShadow(color: Colors.white,offset: Offset.zero, blurRadius: 0.0,spreadRadius: 0.0),
  fontWeight: FontWeight.w700,
  letterSpacing: 1.0,
);
