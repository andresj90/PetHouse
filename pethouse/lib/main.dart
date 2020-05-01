import 'package:flutter/material.dart';
import 'home.dart';



void main() => runApp(MyApp());





/* CLASSES FOR THE VIEWS ON THE  APP  */



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetHouse',
      theme: ThemeData(
          hintColor: Color(0xFFC0F0E8),
          primaryColor: Color(0xFF80E1D1),
          fontFamily: "Montserrat",
          canvasColor: Colors.transparent),
          home: Home(),
    );
  }
}


class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuidadores"),
      ),
      body: new ListView.builder
              (
                itemCount: 8,
                itemBuilder: (BuildContext ctxt, int index) {
                  return listCuidadores('cuidador ${index}', 'Ubicación ${index}');
                }
            )
        
    );
  }
}


Widget listCuidadores (String name, String location, ) => Card(
      child: ListTile(
        leading: ClipOval(
                    child:Image.asset(
                      'assets/images/user1.jpg',
                      width: 60,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
        ),
        title: Text(name),
        subtitle: Text(location),
        trailing: Icon(Icons.more_vert),
      ),
);





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

Widget GenerateCardList(int cardNumber, Card card) => GridView.count(
  crossAxisCount:2, 
  scrollDirection: Axis.vertical,
  children: List.generate(cardNumber, (index) {
         
  }) 

// );



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
  child: Container(
    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
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
      Expanded(
        child: Container(
        margin: EdgeInsets.only(top: 35.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        
         InkWell(
           child: Text(readMore),
           onTap: () {
            print('hello');
          },
         ),
         IconButton(
          icon: Icon(icon), 
          onPressed: () {
            print('hello');
          },
          ) 
        ,
      ],)
      ))  
    ],
  ),
  )
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


// NEWS SCREEN 

Widget postInfo(String img, String user, DateTime datePosted, IconData options) => ListTile(
              leading: CircleAvatar(
              child: Image.asset(img),
              ),
              title: Text(user),
              subtitle: Text(datePosted.toString()),
              trailing: Icon(options),  
);
 

Widget postDetails(IconData icon1, String info1, IconData icon2, String info2, String info3, IconData icon3) => Row(
  children: <Widget>[
    Expanded(
      child: 
       Row(
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
         Icon(
           icon1
         ), 
         Text(info1), 
         Icon(
           icon2
         ), 
         Text(info2), 
       ],)
      ), 
    Expanded(
      child: Row(
         children: <Widget>[
           Text(info3), 
           Icon(
           icon3
         ),
         ], 
      ) 
      )  
  ]
  ,
); 


Widget buildNewsPost(String newsimg, String headline, String content, String img, String user, DateTime datePosted, IconData options,
 IconData icon1, String info1, IconData icon2, String info2, String info3, IconData icon3) => Container(
     padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
     child: ListView(
       children: <Widget>[
         Column(
           children: <Widget>[
              Container(
                 margin: new EdgeInsets.only(
                 bottom: 20
           ),       
              child:postInfo(img, user, datePosted, options)
              ), 
                Container(
                 margin: new EdgeInsets.only(
                 bottom: 20
           ),       
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      newsimg
                    )
                    ),
                  Text(headline),
                  Text(content)  
                ],
              )
              ),
               Container(
                 margin: new EdgeInsets.only(
                 bottom: 20
                        ),
                child: postDetails(icon1, info1, icon2, info2, info3, icon3)       
               )          
           ],
         )  

       ],
     ),
 ); 
   
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

// void openNewView() {
//      final pageRoute = new MaterialPageRoute(builder: (context) {
//           return HomeScreen(); 
//      });

//      Navigator.of(context).push(pageRoute); 
// }



/* STYLES */

var cardText =  TextStyle(
  color: Colors.white,
  //  BoxShadow(color: Colors.white,offset: Offset.zero, blurRadius: 0.0,spreadRadius: 0.0),
  fontWeight: FontWeight.w700,
  letterSpacing: 1.0,

);





Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Laure Wright',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      CircleAvatar(
        radius: 18,
        child: ClipOval(
        child: Image.asset('assets/images/womananddog.jpg'),
    ),
),
      
    ],
  ),
);


Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'La norma dice que los animales son seres sintientes no son cosas, recibirán especial protección contra el sufrimiento y el dolor, en especial, el causado directa o indirectamente por los humanos.',
    softWrap: true,
  ),
);