import 'package:flutter/material.dart';
import 'package:pethouse/screens/profilecaregiver.dart';
import 'package:pethouse/screens/veterinary.dart';
import '../widgets/bottomnavigationbar.dart';
import '../widgets/appbar.dart';

class CareGiver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    Widget widget;

    if (screenSize.size.width <= 600) {
      widget = buildListView(vetList, context, screenSize.size.width);
    } else {
      widget = buildDualPanel(vetList, context, screenSize.size.width);
    }

    return Scaffold(
      appBar: ApplicationBar.generateAppBar('Caregivers', true),
      body: widget,
      bottomNavigationBar:
          AppBottomNavigationBar.buildBottomNavigationBar(context),
    );
  }
}

// Widgets

Widget buildCard(var veterinary, BuildContext context) {
  return InkWell(
    onTap: () => {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => ProfileCareGiver(veterinary)))
    },
    child: Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 40,
                // backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(veterinary["image"]),
                ),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                  child: ListTile(
                    title: Text(veterinary["name"]),
                    subtitle: Text(veterinary["address"]),
                    trailing: Icon(Icons.chevron_right),
                  )))
        ],
      ),
    ),
  );
}

//buildcardforDual

//buildcardforDual 

Widget buildCardDualPanel(var veterinary, BuildContext context) {
    return 
   InkWell(
        onTap: () => {
          Navigator.pushNamed(context, '/profilecaregiver'),
        },
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
                    radius: 25,
                    // backgroundColor: Color(0xffFDCF09),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(veterinary["image"]),
                    ),
            ),
            ],
          ),
          SizedBox(
           height: 5,
          ),
          Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.pin_drop
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    veterinary["distance"]
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                   Icon(
                                    Icons.timer
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    veterinary["distancetime"]
                                  )
                                ],
                              ),
          SizedBox(
           height: 5,
          ), 
        ],
      ),
    
     );
}

//ListView Builder

Widget buildListView(
    List veterinaryList, BuildContext maincontext, double size) {
  if (size <= 600) {
    return ListView.builder(
        itemCount: veterinaryList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCard(veterinaryList[index], maincontext);
        });
  } else {
    return ListView.builder(
        itemCount: veterinaryList.length,
        itemBuilder: (BuildContext context, int index) {
            return buildCardDualPanel(veterinaryList[index], maincontext); 
          }
    );
     
   }

  
}

//Build dual panel

Widget buildDualPanel(List veterinaryList, BuildContext context, double size) {
  return Row(
    children: <Widget>[
      Expanded(child: buildListView(veterinaryList, context, size)),
      Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(color: Colors.amber),
          )),
    ],
  );
}

List vetList = [
  {
    "image": "assets/images/caregiver1.jpeg",
    "name" : "David Garcia", 
    "address" : "Calle 1 Bogotá" , 
    "about": "Tengo un gatito criollo divino y una perrita también criolla, es divertido pasar tiempo con ellos, más con Afrodita a ella le encanta salir a el parque a jugar, le enseñé trucos para que se gane premios, es muy amorosa igual me garfio pero ya saben los gatitos son muy independientes, a el no le gusta que lo moleste tanto se la pasa durmiendo jaja, me gusta saber que tengo mucho amor de ellos.!!"
     
  },
  {
    "image": "assets/images/caregiver6.jpg",
    "name" : "Alex Correa", 
    "address" : "Calle 2 Bogotá" , 
    "about": "Amigos peluditos SA, trabajamos en función de las mascotas porque tenemos varias y sabemos que necesitan atención, diversión aire libre,los mejores accesorios,comida y servicios."
  },
  {
    "image": "assets/images/caregiver1.jpg",
    "name" : "Alberto Bernal", 
    "address" : "Calle 3 Bogotá" , 
    "about" : "Mi nombre es Alberto Bernal soy de Manizales vivo en Bogotá hace 5 años en los cuales trabaje 3 en una guardería canina en donde pude fortalecer mis conocimientos en cuidado canino, Además de amar a los animales cuento con la experiencia. soy auxiliar veterinario y cuento con diplomado básico de etología y adiestramiento canino." , 
  },
  {
    "image": "assets/images/caregiver3.jpg",
    "name" : "Lucy Cantor", 
    "address" : "Calle 4 Bogotá" , 
    "about": "Tengo un gatito criollo divino y una perrita también criolla, es divertido pasar tiempo con ellos, más con Afrodita a ella le encanta salir a el parque a jugar, le enseñé trucos para que se gane premios, es muy amorosa igual me garfio pero ya saben los gatitos son muy independientes, a el no le gusta que lo moleste tanto se la pasa durmiendo jaja, me gusta saber que tengo mucho amor de ellos.!!"
     
  },
  {
    "image": "assets/images/caregiver4.jpg",
    "name" : "Gabriela Montana", 
    "address" : "Calle 5 Bogotá " , 
    "about": "Amigos peluditos SA, trabajamos en función de las mascotas porque tenemos varias y sabemos que necesitan atención, diversión aire libre,los mejores accesorios,comida y servicios."
  },
  {
    "image": "assets/images/caregiver5.jpeg",
    "name" : "Alexa Smith", 
    "address" : "Calle 6 Bogotá" , 
    "about" : "Me gustan toda clase de animales, sobre todo los perros, me encanta pasar tiempo con ellos, siento que tengo una conexión con los animales y se me facilita mucho la relación con ellos." , 
  },
];
