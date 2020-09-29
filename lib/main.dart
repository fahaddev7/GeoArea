import 'package:flutter/material.dart';
import 'package:areas_app/providers/all_places_providr.dart';
import 'package:areas_app/screens/add_new_place.dart';
import 'package:areas_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
          child: MaterialApp(
        title: 'EnviroPlaces',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PlaceslistScreen(),
        routes: {
          AddPlaceScreen.routename:(context)=> AddPlaceScreen(),
        },
      ),
      
    );
  }
}
