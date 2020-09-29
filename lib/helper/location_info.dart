const GOOGLE_API_KEY = 'AIzaSyBurQbMDlnHyIOTcoev96HleS0jswat4Ik';


class LocationHelper {
  static String locationprreview({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
