import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:smartcity/helpermap.dart';
import 'package:smartcity/mapmodel.dart';
class usermarker extends StatefulWidget {
  @override
  _usermarkerState createState() => _usermarkerState();
}

class _usermarkerState extends State<usermarker> {
  List<Marker>allmarker=[];
  var _init = true;
  bool _isLoading=false;
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
  GoogleMapController mapController;
  void initState() {

      FirebaseFirestore.instance
          .collection('locations')
          .get()
          .then((QuerySnapshot querySnapshot) => {
        querySnapshot.docs.forEach((doc) {



          allmarker.add(Marker(
              markerId:MarkerId(doc.id),
              position:LatLng(doc.data()['position'].latitude,doc.data()['position'].longitude)
          ));


        }
        )});


    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<Userlocation>(context);


    return  Scaffold(
      body: SizedBox(child: _isLoading ? Center(child:CircularProgressIndicator(backgroundColor: Colors.deepPurpleAccent,))
          :GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(userLocation.latitude,userLocation.longitude),zoom: 14),
        markers:Set.from(allmarker) ,
      onMapCreated: (GoogleMapController controller)
        {
          mapController=controller;
        },
      )),
    );

  }

}
