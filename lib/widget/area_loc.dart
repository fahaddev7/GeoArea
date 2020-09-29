import 'package:areas_app/helper/location_info.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewimgurl;

  Future<void> _getlocation() async {
    final loc = await Location().getLocation();
    final mapurl = LocationHelper.locationprreview(
        latitude: loc.latitude, longitude: loc.longitude);
        setState(() {
          _previewimgurl= mapurl;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          alignment: Alignment.center,
          height: 150,
          width: double.infinity,
          child: _previewimgurl == null
              ? Text('No Location Selected')
              : Image.network(_previewimgurl),
        ),
        Wrap(
          children: <Widget>[
            FlatButton.icon(
              onPressed: _getlocation,
              icon: Icon(Icons.location_on),
              label: Text("Current Location"),
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text("Choose Location"),
            )
          ],
        )
      ],
    );
  }
}
