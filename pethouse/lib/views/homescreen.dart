import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomnavigationbar.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   
    var screenSize = MediaQuery.of(context);
    Widget widget;  

    // if (screenSize.size.width<= 600) {
    //    widget = buildListView(emailList, context,screenSize.size.width, this); 
    // } else {
    //    widget = buildDualPanel(emailList, context,screenSize.size.width, this);
    // }


    return Scaffold(
      appBar: ApplicationBar.generateAppBar('PetHouse', true),
      body: Column(
          children: <Widget>[
            Flexible(
              child: generateCardLists(homePageCards.length, 2, context)
            ), 
          ],
        ),

      bottomNavigationBar: AppBottomNavigationBar.buildBottomNavigationBar(context),  
      );
   
  }
}


/* Header */

Widget servicesCard(var card, BuildContext context)=> Card(
    color: card.cardColor(),
    child: new InkWell(
      onTap: () {
        card.navigateRoutes(context);
      },
      child: Stack(
      
      children: <Widget>[
        Image.asset(card.cardImage()),
        Container(
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
          child: Text(
            card.cardCategory(),
            style: cardText,
          ),
        )
      ],
    ),
    )
   
);


// ROWS FOR CARDS 

Widget generateCardLists(int cardNumber, int columns, BuildContext context) => GridView.count(
  crossAxisCount:columns, 
  scrollDirection: Axis.vertical,
  children: List.generate(cardNumber, (index) {
      return servicesCard(homePageCards[index], context); 
  }) 

);




// NEWS CARD HEADER



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


   void navigateRoutes(BuildContext context) {
     switch (this.category) {
       case 'Veterinaría':
          Navigator.pushNamed(context, '/veterinary'); 
          break;
       case 'Paseador':
          Navigator.pushNamed(context, '/caregiver'); 
          break;
       default:
     }
   }

}



   


List homePageCards = [
  new CardCreator('Guardería', 'assets/images/dogcard1.png', Colors.purple[300]),
  new CardCreator('Paseador', 'assets/images/dogcard6.png', Colors.green[300]),
  new CardCreator('Veterinaría', 'assets/images/dogcard4.png', Colors.orange[300]),
  new CardCreator('Higiene', 'assets/images/dogcard1.png', Colors.deepOrange[300]),
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