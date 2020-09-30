const YOUR_API_KEY = "AIzaSyDDJEmZw6lWMEaz3Qa90N8qPs_h2pzv9Zk";

class locationhelper {
  static String generateImage({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=AIzaSyDDJEmZw6lWMEaz3Qa90N8qPs_h2pzv9Zk';
  }
}
