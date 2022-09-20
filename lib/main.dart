import 'package:flutter/material.dart';
import 'package:movies/provid/my_provider.dart';
import 'package:provider/provider.dart';
import 'home/home_screen.dart';
import 'modules/tabs_navBar/browser/Screen/movies_filtred.dart';
import 'package:firebase_core/firebase_core.dart';
import 'modules/tabs_navBar/details/movies_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future <void> main()async{


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(ChangeNotifierProvider(
      create: (context){
        return MyProviderApp();
      },
     
      child: MyApp()));
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.yellow
          )
      ),
      routes: {
        HomePage.routename : (context) => HomePage(),
        MoviesFiltred.routeName: (context) => MoviesFiltred(),
        MoviesDetails.routeName:(context)=>MoviesDetails()
      },
      initialRoute: HomePage.routename,
      debugShowCheckedModeBanner: false,
    );
  }
}
