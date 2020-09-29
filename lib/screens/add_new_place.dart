// import 'dart:html';
import 'dart:io';
import 'package:areas_app/providers/all_places_providr.dart';
import 'package:areas_app/widget/area_loc.dart';
import 'package:flutter/material.dart';
import 'package:areas_app/widget/image_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routename = '/Addplace';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titlecontroller = TextEditingController();
  File _pickedimg;
  void _selectedimage(File image) {
    _pickedimg = image;
  }

  void _addplace() {
    if (_titlecontroller.text.isEmpty || _pickedimg == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addplace(_titlecontroller.text, _pickedimg);
        Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Places"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: _titlecontroller,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(_selectedimage),
                  SizedBox(
                    height: 10,
                  ),
                  LocationInput(),
                ],
              ),
            ),
          )),
          RaisedButton.icon(
            onPressed: _addplace,
            icon: Icon(Icons.add),
            label: Text("Add Places"),
            elevation: 0,
            color: Theme.of(context).accentColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
