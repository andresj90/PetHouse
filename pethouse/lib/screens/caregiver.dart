import 'package:flutter/material.dart';
import 'package:pethouse/screens/profilecaregiver.dart';
import 'package:pethouse/screens/veterinary.dart';
import '../widgets/bottomnavigationbar.dart';
import '../widgets/appbar.dart';

class CareGiver extends StatefulWidget {
  @override
  _CareGiverState createState() => _CareGiverState();
}

class _CareGiverState extends State<CareGiver> {
 
  String image;  
  String  name; 
  String  address; 
  String  about; 

  _CareGiverState({
   this.image = "", 
   this.name = "", 
   this.address = "", 
   this.about = "", 
  });  

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    Widget widget;

    if (screenSize.size.width <= 600) {
      widget = buildListView(vetList, context, screenSize.size.width, this);
    } else {
      widget = buildDualPanel(vetList, context, screenSize.size.width, this);
    }

    return Scaffold(
      appBar: ApplicationBar.generateAppBar('Caregivers', true),
      body: widget,
      bottomNavigationBar:
          AppBottomNavigationBar.buildBottomNavigationBar(context),
    );
  }
}

Widget portraitVista(context,data) {
  return new Scaffold(
    appBar: ApplicationBar.generateAppBar('Profile', true),
    body:  new Stack(
      children: <Widget>[
        Positioned(
            width: 350.0,
            left: 25.0,
            top: MediaQuery.of(context).size.height / 30,
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(75.0),
                        ),
                        boxShadow: [
                          BoxShadow(blurRadius: 15.0, color: Colors.black)
                        ])),
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  height: 1,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Nombre: ' + data['name'],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Dirección: ' + data['address'],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Descripcion: ' + data['about'],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                    height: 50.0,
                    width: 125.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Solicitar',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat', fontSize: 18.0),
                          ),
                        ),
                      ),
                    ))
              ],
            ))
      ],
    ),
  );
}
// Widgets

Widget buildCard(var veterinary, BuildContext context) {
  return InkWell(
    onTap: () => {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => portraitVista(context,veterinary)))
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

Widget buildCardDualPanel(var veterinary, BuildContext context, _CareGiverState caregiver) {  
    return InkWell(
        onTap: () => {

          caregiver.setState(() => {
            caregiver.about = veterinary["about"]
          })
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
            title: Text(veterinary["name"]),
            subtitle: Text(veterinary["address"]),
            trailing: Icon(Icons.chevron_right), 
          ),
            
        ), 

      );
   
}
//ListView Builder

Widget buildListView(List veterinaryList, BuildContext maincontext,
    double size, _CareGiverState caregiver) {
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
          return buildCardDualPanel(veterinaryList[index], maincontext, caregiver);
        }
    );
  }
}

//Build dual panel

Widget buildDualPanel(List veterinaryList, BuildContext context, double size, _CareGiverState caregiver) {
  return Row(
    children: <Widget>[
      Expanded(
        flex: 2,
        child: 
        buildListView(veterinaryList, context, size, caregiver
        )),
      Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(caregiver.about),
          )),
    ],
  );
}

List vetList = [
  {
    "image": "assets/images/caregiver1.jpeg",
    "name": "David Garcia",
    "address": "Calle 1 Bogotá",
    "about":
        "Tengo un gatito criollo divino y una perrita también criolla, es divertido pasar tiempo con ellos, más con Afrodita a ella le encanta salir a el parque a jugar, le enseñé trucos para que se gane premios, es muy amorosa igual me garfio pero ya saben los gatitos son muy independientes, a el no le gusta que lo moleste tanto se la pasa durmiendo jaja, me gusta saber que tengo mucho amor de ellos.!!"
  },
  {
    "image": "assets/images/caregiver6.jpg",
    "name": "Alex Correa",
    "address": "Calle 2 Bogotá",
    "about":
        "Amigos peluditos SA, trabajamos en función de las mascotas porque tenemos varias y sabemos que necesitan atención, diversión aire libre,los mejores accesorios,comida y servicios."
  },
  {
    "image": "assets/images/caregiver1.jpg",
    "name": "Alberto Bernal",
    "address": "Calle 3 Bogotá",
    "about":
        "Mi nombre es Alberto Bernal soy de Manizales vivo en Bogotá hace 5 años en los cuales trabaje 3 en una guardería canina en donde pude fortalecer mis conocimientos en cuidado canino, Además de amar a los animales cuento con la experiencia. soy auxiliar veterinario y cuento con diplomado básico de etología y adiestramiento canino.",
  },
  {
    "image": "assets/images/caregiver3.jpg",
    "name": "Lucy Cantor",
    "address": "Calle 4 Bogotá",
    "about":
        "Tengo un gatito criollo divino y una perrita también criolla, es divertido pasar tiempo con ellos, más con Afrodita a ella le encanta salir a el parque a jugar, le enseñé trucos para que se gane premios, es muy amorosa igual me garfio pero ya saben los gatitos son muy independientes, a el no le gusta que lo moleste tanto se la pasa durmiendo jaja, me gusta saber que tengo mucho amor de ellos.!!"
  },
  {
    "image": "assets/images/caregiver4.jpg",
    "name": "Gabriela Montana",
    "address": "Calle 5 Bogotá ",
    "about":
        "Amigos peluditos SA, trabajamos en función de las mascotas porque tenemos varias y sabemos que necesitan atención, diversión aire libre,los mejores accesorios,comida y servicios."
  },
  {
    "image": "assets/images/caregiver5.jpeg",
    "name": "Alexa Smith",
    "address": "Calle 6 Bogotá",
    "about":
        "Me gustan toda clase de animales, sobre todo los perros, me encanta pasar tiempo con ellos, siento que tengo una conexión con los animales y se me facilita mucho la relación con ellos.",
  },
];
