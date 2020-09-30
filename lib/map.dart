import 'dart:convert';
import 'package:http/http.dart' as http;

class Address {
  static Future<String> getlocation(double lat, double long) async {
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=AIzaSyDDJEmZw6lWMEaz3Qa90N8qPs_h2pzv9Zk";
    try {
      final response = await http.get(url);
      return jsonDecode(response.body)['results'][0]['formatted_address'];
    } catch (e) {
      print("error");
    }
  }
}
