import 'package:flutter/material.dart';
import '../widgets/bottomnavigationbar.dart';
import '../widgets/appbar.dart';


class CareGiver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
     var screenSize = MediaQuery.of(context);
    Widget widget;  

    if (screenSize.size.width<= 600) {
       widget = buildListView(vetList, context,screenSize.size.width); 
    } else {
       widget = buildDualPanel(vetList, context,screenSize.size.width);
    }

    return Scaffold(
       appBar: ApplicationBar.generateAppBar('Caregivers', true),
       body: widget,
       bottomNavigationBar: AppBottomNavigationBar.buildBottomNavigationBar(context),
    );
  }
}



// Widgets 

Widget buildCard(var veterinary, BuildContext context) {
   return 
   InkWell(
        onTap: () => {
          Navigator.pushNamed(context, '/profilecaregiver'),
        },
        child: Card(
          child: 
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: 
                  CircleAvatar(
                    radius: 40,
                    // backgroundColor: Color(0xffFDCF09),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(veterinary["image"]),
                    ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: 
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),    
                      child: ListTile(
                        title: Text(veterinary["name"]),
                        subtitle: Text(veterinary["address"]),
                        trailing: Icon(Icons.chevron_right),
                      )
                  ) 
                  
                  )
              ],
            ),
          ),
   );
}


//buildcardforDual 

Widget buildCardDualPanel(var veterinary) {
   return Card(
     child: 
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
            flex: 4,
            child: 
            Image.asset(veterinary["image"],
            fit: BoxFit.fitHeight,
            )
          ),
          Expanded(
            flex: 1,
            child: 
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),    
                child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              Text(veterinary["name"]),
                              Text('Address: ${veterinary["address"]}'),
                              SizedBox(
                                height: 10.0,
                              ),
                          ],
                        ),
             ) 
            
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

Widget buildListView(List veterinaryList, BuildContext maincontext, double size) {

   if (size <= 600) {
 
     return ListView.builder(
        itemCount: veterinaryList.length,
        itemBuilder: (BuildContext context, int index) {
            return buildCard(veterinaryList[index], maincontext); 
    }
  );

   } else {

      return ListView.builder(
        itemCount: veterinaryList.length,
        itemBuilder: (BuildContext context, int index) {
            return buildCardDualPanel(veterinaryList[index]); 
          }
    );
     
   }

  
}


//Build dual panel 

Widget buildDualPanel(List veterinaryList, BuildContext context, double size) {
   return Row(
     children: <Widget>[
       Expanded(
         child: 
         buildListView(veterinaryList, context, size)
         ),
       Expanded(
         flex: 3,
         child: Container(
           decoration: BoxDecoration(
             color: Colors.amber
           ),
         )
       ),
     ],
   );
}



List vetList = [
  {
    "image": "assets/images/caregiver1.jpeg",
    "name" : "Veterinary 1", 
    "address" : "Address 1" , 
    "distance" : "5 Miles", 
    "distancetime" : "10 Min"
  },
  {
    "image": "assets/images/caregiver1.jpg",
    "name" : "Veterinary 1", 
    "address" : "Address 1" , 
    "distance" : "5 Miles", 
    "distancetime" : "10 Min"
  },
  {
    "image": "assets/images/caregiver1.jpg",
    "name" : "Veterinary 1", 
    "address" : "Address 1" , 
    "distance" : "5 Miles", 
    "distancetime" : "10 Min"
  },
];