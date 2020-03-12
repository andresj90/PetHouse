import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetHouse',
      theme: ThemeData(
       
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: appNavigationBar('PetHouse'),
        body: ListView(
          children: <Widget>[
             Column(
               children: <Widget>[
                 headerSlider,
               ],
             ),
             Container(
               padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
               child: Text("Servicios"),
             ), 
             generateCardList(homePageCards.length),
          ],
        )
      ),
    );
  }
}



/* Generic Components */

/* APP BAR */

Widget appNavigationBar(String title) => AppBar(
  title: Text(title),
  centerTitle:true,
); 

/* */

/* Header */

Widget servicesCard(String tittle, String img, Color color)=> Card(
  
    color: color,
    child: Stack(
      children: <Widget>[
        Image.asset(img),
        Container(
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
          child: Text(
            tittle,
            style: cardText,
          ),
        )
      ],
    )
   
);


// ROWS FOR CARDS 

Widget generateCardList(int cardNumber) => GridView.count(
  crossAxisCount:2, 
  physics: NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  scrollDirection: Axis.vertical,
  children: List.generate(cardNumber, (index) {
      return servicesCard(homePageCards[index].cardCategory(), homePageCards[index].cardImage(),homePageCards[index].cardColor()); 
  }) 

);

/* */

/* slider */
Widget headerSlider = CarouselSlider(
  height: 200.0,
  autoPlayInterval: Duration(seconds: 4),
  autoPlay: true,
  scrollDirection: Axis.horizontal,
  items: const [1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        );
      },
    );
  }).toList(),
);


// VARIABLES and classes


 class CardCreator {
   String category; 
   String img; 
   Color color; 
   CardCreator(String category, String img ,Color color){
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

}


List homePageCards = [
  new CardCreator('Guardería', 'assets/images/dogcard1.png', Colors.purple[300]),
  new CardCreator('Paseador', 'assets/images/dogcard2.png', Colors.green[300]),
  new CardCreator('Veterinaría', 'assets/images/dogwithleash.jpg', Colors.orange[300]),
  new CardCreator('Salón de belleza', 'assets/images/dogwithleash.jpg', Colors.blue[300]),
  new CardCreator('Salón de belleza', 'assets/images/dogwithleash.jpg', Colors.blue[300]),
  new CardCreator('Salón de belleza', 'assets/images/dogwithleash.jpg', Colors.blue[300]),
  ]; 



/* STYLES */

var cardText =  TextStyle(
  color: Colors.white,
  //  BoxShadow(color: Colors.white,offset: Offset.zero, blurRadius: 0.0,spreadRadius: 0.0),
  fontWeight: FontWeight.w700,
  letterSpacing: 1.0,

);

