// import 'dart:html';
import 'dart:io';

import 'package:areas_app/helper/db_info.dart';
import 'package:flutter/material.dart';
import 'package:areas_app/models/places.model.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addplace(String ptitle, File pimage) {
    final newplace = Place(
      id: DateTime.now().toString(),
      title: ptitle,
      location: null,
      image: pimage,
    );
    _items.add(newplace);
    notifyListeners();
    Dbhelper.insert('geo_places', {
      'id': newplace.id,
      'title': newplace.title,
      'image': newplace.image.path,
    });
  }

  Future<void> fetchalldata() async {
    final datalist = await Dbhelper.fetchdata('geo_places');
    _items = datalist
        .map((e) => Place(
              id: e['id'],
              title: e['title'],
              location: null,
              image: File(e['image']),
            ))
        .toList();
        notifyListeners();
  }
}
