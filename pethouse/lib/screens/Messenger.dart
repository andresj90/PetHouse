import 'package:flutter/material.dart';
import 'package:pethouse/screens/emaildetails.dart';
import '../widgets/bottomnavigationbar.dart';
import '../widgets/appbar.dart';

 class Messenger extends StatefulWidget {
   @override
   _MessengerState createState() => _MessengerState();
 }
 
 class _MessengerState extends State<Messenger> {
  
   String image;
   String name;
   String date;
   String subject;
   String emailBody;
    

   _MessengerState({
     this.image = '',
     this.name = '',
     this.date= '',
     this.subject = '',
     this.emailBody = '',
   }); 

   @override
   Widget build(BuildContext context) {
       
    var screenSize = MediaQuery.of(context);
    Widget widget;  

    if (screenSize.size.width<= 600) {
       widget = buildListView(emailList, context,screenSize.size.width, this); 
    } else {
       widget = buildDualPanel(emailList, context,screenSize.size.width, this);
    }

     return Scaffold(
       appBar: ApplicationBar.generateAppBar('Messanger', true),
       body: widget,
       bottomNavigationBar: AppBottomNavigationBar.buildBottomNavigationBar(context),
     );
   }
 }


 

//build single portrait widget

 Widget buildSingleElementInbox(var email, BuildContext context) { 
   return  
      Container(
           margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
           child: InkWell(
           onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmailDetails(email))
              );},  
           child: Column(
             children: <Widget>[
             Row(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Expanded(
                 flex: 1,
                 child: 
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                      email["image"],    
                      // height: 150.0,
                      // width: 20.0,
                              ),
                    ) 
               ),
               Expanded(
                 flex: 1,
                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        Expanded(
                          child: Text(email["name"]),  
                        ), 
                        Expanded(
                          child:  Text(email["date"]),
                        ) 
                       ],
                     ), 
                     SizedBox(
                       height: 10,
                     ),
                     Row(
                       children: <Widget>[
                        Icon(Icons.message), 
                        Text(email["subject"])   
                         
                       ],
                     ), 
                     SizedBox(
                       height: 10,
                     ), 
                     Text(email["emailBody"]) 

                   ],
                 )
                    
                )
             ],
           ),
           Padding(
                padding:EdgeInsets.symmetric(vertical: 10.0),
                child:Container(
                height:1.0,
                width: double.infinity,
                color:Colors.grey[400],
                ),
          ),
 
           ],
           )
        ),
      ); 
 }

//buildlistview

Widget buildListView(List emailList, BuildContext maincontext, double size, _MessengerState email) {

   if (size <= 600) {
 
     return ListView.builder(
        itemCount: emailList.length,
        itemBuilder: (BuildContext context, int index) {
            return buildSingleElementInbox(emailList[index], maincontext); 
    }
  );

   } else {

      return ListView.builder(
        itemCount: emailList.length,
        itemBuilder: (BuildContext context, int index) {
            return buildCardDualPanel(emailList[index], maincontext, email); 
          }
    );
     
   }

  
}



//build dual panel view 


Widget buildCardDualPanel(var email, BuildContext context, _MessengerState emailinfo) {
   return 
   InkWell(
        onTap: () => {
          emailinfo.setState(() => {
            emailinfo.subject = email["subject"], 
            emailinfo.emailBody = email["emailBody"]
          })
        },
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
                    radius: 25,
                    // backgroundColor: Color(0xffFDCF09),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(email["image"]),
                    ),
            ),
            title: Text(email["name"]),
            subtitle: Text(email["subject"]),
            trailing: Icon(Icons.chevron_right), 
          )
            
          ),
   );
}




//Build dual panel 

Widget buildDualPanel(List emailList, BuildContext context, double size, _MessengerState messenger) {
   return Row(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisAlignment: MainAxisAlignment.start,
     children: <Widget>[
       Expanded(
         flex: 2,
         child: 
         buildListView(emailList, context, size, messenger)
         ),
       Expanded(
         flex: 4,
         child: Container(
           padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
           decoration: BoxDecoration(
            

           ),
           child: 
           //Text(messenger.name)
           buildNewsLayout(messenger),
         )
       ),
     ],
   );
}


//email when the view is landscape
Widget buildNewsLayout(var email) =>Stack(
  children: <Widget>[
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/portraitNews1.jpg'),
          fit: BoxFit.fill, 
          
        ),
      ),
    
    ),
    Positioned(
  bottom: 48.0,
  left: 10.0,
  right: 10.0,
  child: Card(
    elevation: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            email.subject,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              email.emailBody, 
              textAlign: TextAlign.center,
            ),
        ),
      ],
    ),
  ),
),
  ],
); 




 //data 

 List emailList = [
  {
    "image": "assets/images/caregiver8.jpg",
    "name" : "David Garcia", 
    "date" : "2019-03-04 12:07:41" , 
    "subject": "Cuidado de mascota",
    "emailBody":"Tengo un gatito criollo divino y una perrita también criolla, es divertido pasar tiempo con ellos."
  },
  {
    "image": "assets/images/caregiver6.jpg",
    "name" : "Alex Correa", 
    "date" : "2020-02-22 16:58:14" , 
    "subject": "Servicio de baño",
    "emailBody": "Amigos peluditos SA, trabajamos en función de las mascotas porque tenemos varias y sabemos que necesitan atención."
  },
  {
    "image": "assets/images/caregiver1.jpg",
    "name" : "Alberto Bernal", 
    "date": "2020-02-22 16:04:54",
    "subject" : "Pago de producto" , 
    "emailBody" : "Mi nombre es Alberto Bernal soy de Manizales vivo en Bogotá hace 5 años en los cuales trabaje 3 en una guardería canina." , 
  },
  {
    "image": "assets/images/caregiver3.jpg",
    "name" : "Lucy Cantor", 
    "date": "2020-02-21 09:34:57", 
    "subject" : "Calificación del servicio" , 
    "emailBody": "Tengo un gatito criollo divino y una perrita también criolla, es divertido pasar tiempo con ellos, más con Afrodita a ella."
     
  },
  {
    "image": "assets/images/caregiver7.jpg",
    "name" : "Gabriela Montana", 
    "date": "2019-05-25 16:26:16",
    "subject" : "Consulta de guardería" , 
    "emailBody": "Amigos peluditos SA, trabajamos en función de las mascotas porque tenemos varias y sabemos que necesitan atención, diversión aire libre,los mejores accesorios,comida y servicios."
  },
  {
    "image": "assets/images/caregiver5.jpeg",
    "name" : "Alexa Smith", 
    "date": "2019-05-25 16:24:09",
    "subject" : "Servicio de paseo" , 
    "emailBody" : "Me gustan toda clase de animales, sobre todo los perros, me encanta pasar tiempo con ellos, siento que tengo una conexión con los animales y se me facilita mucho la relación con ellos." , 
  },
];