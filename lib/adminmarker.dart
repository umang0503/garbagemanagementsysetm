import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smartcity/helpermap.dart';
import 'package:smartcity/mapmodel.dart';
import 'package:smartcity/mapmodel.dart';
import 'helpermap.dart';
import 'package:random_string/random_string.dart';
import 'package:smartcity/markerbackend.dart';
import 'mapmodel.dart';
import 'map.dart';

class adminmarker extends StatefulWidget {
  @override
  _adminmarkerState createState() => _adminmarkerState();
}

class _adminmarkerState extends State<adminmarker> {
  @override
  bool _isLoading = true;
  var _init = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

     LocationService().location.getLocation()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }



  List<Marker>myMarker=[];
  var rand=randomAlphaNumeric(
      10);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  Future<DocumentReference> _addGeoPoint(dynamic curr) async {
    GeoFirePoint point = geo.point(latitude: curr.latitude, longitude: curr.longitude);
    return firestore.collection('locations').add({
      'position': point.geoPoint,

    });
  }

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<Userlocation>(context);
    return Scaffold(
      body: SizedBox(child: _isLoading ? Center(child:CircularProgressIndicator(backgroundColor: Colors.deepPurpleAccent,))
    :GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(userLocation.latitude,userLocation.longitude),zoom: 14),
        markers: Set.from(myMarker),
        onTap: _handleTap,

      ),
    ));
  }
  _handleTap(LatLng tappedPoint){
    print(tappedPoint);
    setState(() {

      myMarker.add(
          Marker(
              markerId:MarkerId(tappedPoint.toString()),
              position: tappedPoint,

          )

      );
      _addGeoPoint(tappedPoint);
    });
  }

}
