import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() =>  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => HomeScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => HomeScreen(),
    },
  ));





/* CLASSES FOR THE VIEWS ON THE  APP  */



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Column(
          children: <Widget>[
            Container(
              child: headerSlider
            ),
            Container(
               padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
               child: Text("Servicios"),
             ),
          
            Expanded(
              child: generateCardLists(homePageCards.length)
              )  
           
          ],
        )
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

Widget generateCardLists(int cardNumber) => GridView.count(
  crossAxisCount:2, 
  // // physics: NeverScrollableScrollPhysics(),
  // shrinkWrap: false,
  scrollDirection: Axis.vertical,
  children: List.generate(cardNumber, (index) {
      return servicesCard(homePageCards[index].cardCategory(), homePageCards[index].cardImage(),homePageCards[index].cardColor()); 
  }) 

);



Widget headerSlider = CarouselSlider.builder(
   autoPlay: true,
   autoPlayInterval: Duration(seconds: 3),
   itemCount: detailsNewsCard.length,
   itemBuilder: (BuildContext context, int i) =>
       
      buildNewsCardHome(detailsNewsCard[i]['tag'], detailsNewsCard[i]['title'],  detailsNewsCard[i]['author'], 
         detailsNewsCard[i]['more'],  detailsNewsCard[i]['icon'],  detailsNewsCard[i]['color']),
      
   );

// NEWS CARD HEADER


Widget buildNewsCardHome(String tag, String headline, String writtenby, String readMore, IconData icon, Color color) => Card(
  color: color,
  elevation: 1.0,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    textDirection: TextDirection.ltr,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
        decoration: new BoxDecoration(
          color: Colors.orange[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(tag),
      ),
      Container(
         margin: EdgeInsets.only(top: 30.0),
         child: Text(
           headline, 
           style: TextStyle(
             fontSize: 30.0, 
             color: Colors.grey[700],
             fontWeight: FontWeight.w500
           ),
         ),
      ), 
      Container(
         margin: EdgeInsets.only(top: 2.0),
         child: Text(
           writtenby, 
           style: TextStyle(
             fontSize: 14.0,  
             color: Colors.blueGrey,
             fontWeight: FontWeight.w300
           ),
         ),
      ),
      Container(
        margin: EdgeInsets.only(top: 35.0),
        child: Row(children: <Widget>[
        IconButton(
          icon: Icon(icon), 
          onPressed: null) 
        ,
        Text(readMore)
      ],)
      )  
    ],
  ),
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


//lists

List detailsNewsCard  = [
   {'tag':"news", 'title':"Nueva Ley Contra el maltrato animal", 'author' : 'Lauren Wright', 'more' : 'read more', 'icon' :Icons.arrow_right, 'color': Colors.grey[100]}, 
   {'tag': 'fashion' ,'title':'Colección de verano para tu mascota', 'author' : 'Camile Hamp','more' : 'read more', 'icon' :Icons.arrow_right, 'color': Colors.grey[100]},
   {'tag': 'evento' ,'title':'Nueva Jornada de Vacunación', 'author' : 'Ramón Rivers','more' : 'read more', 'icon' :Icons.arrow_right, 'color': Colors.grey[100]},
   {'tag': 'evento','title':'Petatlón, Caminata con mascota', 'author' : 'Alex Rivera','more' : 'read more', 'icon' :Icons.arrow_right, 'color': Colors.grey[100]},
];

List homePageCards = [
  new CardCreator('Guardería', 'assets/images/dogcard1.png', Colors.purple[300]),
  new CardCreator('Paseador', 'assets/images/dogcard5.png', Colors.green[300]),
  new CardCreator('Veterinaría', 'assets/images/dogcard4.png', Colors.orange[300]),
  new CardCreator('Higiene', 'assets/images/dogcard1.png', Colors.yellow[300]),
  new CardCreator('Eventos', 'assets/images/dogcard5.png', Colors.red[300]),
  new CardCreator('Accesorios', 'assets/images/dogcard4.png', Colors.blue[300]),
  ]; 



/* STYLES */

var cardText =  TextStyle(
  color: Colors.white,
  //  BoxShadow(color: Colors.white,offset: Offset.zero, blurRadius: 0.0,spreadRadius: 0.0),
  fontWeight: FontWeight.w700,
  letterSpacing: 1.0,

);

