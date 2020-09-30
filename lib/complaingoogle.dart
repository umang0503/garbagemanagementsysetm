import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:smartcity/mapmodel.dart';
class complaingoogle extends StatefulWidget {
  double latitude;
  double longitude;
  complaingoogle({this.latitude,this.longitude});
  @override
  _complaingoogleState createState() => _complaingoogleState();
}

class _complaingoogleState extends State<complaingoogle> {

  List<Marker>allmarker=[];

  GoogleMapController mapController;

   @override
  void initState() {
     allmarker.add(Marker(
         markerId:MarkerId("map"),
         position:LatLng(widget.latitude,widget.longitude)
     ));

     super.initState();
  }



  @override
  Widget build(BuildContext context) {


    print(allmarker);
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(widget.latitude,widget.longitude),zoom: 14),
      markers:Set.from(allmarker) ,
      onMapCreated: (GoogleMapController controller)
      {
        mapController=controller;
      },
    );

  }

}