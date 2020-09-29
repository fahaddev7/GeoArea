// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path; 
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function onselectimg;

  ImageInput(this.onselectimg);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _imagefile;

  Future<void> takepicture() async {
    final selectedimg =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _imagefile = File(selectedimg.path);
    });
    final appdir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(selectedimg.path);
    final savedimg = await File(selectedimg.path).copy('${appdir.path}/$filename');
    widget.onselectimg(savedimg);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          child: _imagefile != null
              ? Image.file(
                  _imagefile,
                  fit: BoxFit.cover,
                )
              : Text(
                  "No Photos Selected",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: FlatButton.icon(
                onPressed: takepicture,
                icon: Icon(Icons.camera),
                label: Text("Take Picture")))
      ],
    );
  }
}
