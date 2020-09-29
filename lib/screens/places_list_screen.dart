import 'package:areas_app/providers/all_places_providr.dart';
import 'package:flutter/material.dart';
import 'package:areas_app/screens/add_new_place.dart';
import 'package:provider/provider.dart';

class PlaceslistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routename);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future:
              Provider.of<GreatPlaces>(context, listen: false).fetchalldata(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<GreatPlaces>(
                      child: Center(
                        child: Text(
                          "No Places Yet",
                        ),
                      ),
                      builder: (context, greatplaces, ch) =>
                          greatplaces.items.length <= 0
                              ? ch
                              : ListView.builder(
                                  itemCount: greatplaces.items.length,
                                  itemBuilder: (context, i) => ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          FileImage(greatplaces.items[i].image),
                                    ),
                                    title: Text(greatplaces.items[i].title),
                                  ),
                                ),
                    ),
        ));
  }
}
