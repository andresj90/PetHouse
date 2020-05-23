import 'package:flutter/material.dart';
import 'package:pethouse/screens/Messenger.dart';
import 'package:pethouse/screens/storekeeper.dart';
import 'package:pethouse/screens/veterinary.dart';
import 'package:pethouse/screens/caregiver.dart';
import 'package:pethouse/views/providerprofile.dart';
import 'package:pethouse/views/splash.dart';
import 'package:pethouse/widgets/themecolors.dart';
import 'package:pethouse/widgets/themenotificator.dart';
import 'package:provider/provider.dart';
import 'views/homescreen.dart';
import 'screens/userprofile.dart';
import 'package:google_fonts/google_fonts.dart';



void main() =>  runApp( ChangeNotifierProvider<DynamicTheme>(  
       create: (_) => DynamicTheme(),  
       child: EntryPoint(),  
     ), 
);

class EntryPoint extends StatefulWidget {
   
  //  static ThemeData changeTheme;
  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
 
   _EntryPointState(); 
 

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);  
    return MaterialApp(
    title: 'Pet House',
    theme: themeProvider.getDarkMode() ? appThemeData[AppTheme.Dark] : appThemeData[AppTheme.Ligth],      
    debugShowCheckedModeBanner: false,
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/splash',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/veterinary': (context) => Veterinary(),
      '/splash': (context) => Splash(),
      // '/settings':(context) => Setting(),
      '/home':(context) => HomeScreen(),
      '/caregiver':(context) => CareGiver(),
      '/messenger':(context) => Messenger(),
      '/profile':(context) => Profile(),
      '/userprofile': (context) => UserProfile(),
      '/storekeeper':(context) => StoreKeeper(),
      // '/profilecaregiver':(context) => ProfileCareGiver(''),
      // '/emaildetail':(context) => EmailDetails(),
    }
    
  );
}
}



