import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:provider/provider.dart';
import'package:random_string/random_string.dart';

import 'package:smartcity/mapsnap.dart';
import 'package:smartcity/signinui.dart';
import 'mapmodel.dart';
import 'map.dart';
import 'complainbackend.dart';

class complain extends StatefulWidget {
  @override
  _complainState createState() => _complainState();
}

class _complainState extends State<complain> {
  var rand=randomAlphaNumeric(
      10);
  String _preview;
  String _add;
  GeoFirePoint point;


  final name= TextEditingController();
  final compl = TextEditingController();
  final email = TextEditingController();
  bool isloading=false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  Future<void>backend(String name, String snap, String address, String comp,String email,GeoPoint coordinate)async
  { setState(() {
    isloading=true;
  });
    await usercomplain(uid: rand).updatecomplain(name, snap, address, comp, email,coordinate);
    setState(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => success(docid: rand,)),
      );
    });
  }

  Future<void> addplaces(double latitude, double longitude) async {
    final address = await Address.getlocation(latitude, longitude);
    setState(() {
      _add = address;
      point = geo.point(latitude: latitude, longitude: longitude);
    });
  }

  void imagee(double latitude, double longitude) {
    final staticmapurl =
        locationhelper.generateImage(latitude: latitude, longitude: longitude);

    setState(() {
      _preview = staticmapurl;
    });
    addplaces(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    final address= TextEditingController(text: _add);
    var userLocation = Provider.of<Userlocation>(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(

                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.3,

                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black26,width:2)),
                  child: _preview == null
                      ? Center(child: Text("No location chosen"))
                      : Image(
                        image: NetworkImage(
                            _preview,

                          ),
                      fit: BoxFit.cover,),),
            ),
            SizedBox(height: 10),
            Container(width: MediaQuery.of(context).size.width * 0.94,
              child: TextField(controller:address ,
                readOnly: true,
                decoration: InputDecoration(




                  hintText: "Address",
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                imagee(userLocation.latitude, userLocation.longitude);
              },
              child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.deepPurpleAccent,
                          Colors.indigo[800]
                        ],
                      )
                  ),
                  child: Center(
                      child: Text("GET LOCATION",
                          style: TextStyle(color: Colors.white)))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(width: MediaQuery.of(context).size.width * 0.94,
              child: TextField(controller:name ,

                decoration: InputDecoration(
                  filled: true,

                  fillColor: Colors.white70,

                  labelText: "Enter name",
                  border: OutlineInputBorder(

                    borderSide: BorderSide(
                        color: Colors.black
                      //this has no effect
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "name",
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),
            Container(width: MediaQuery.of(context).size.width * 0.94,
              child: TextField(controller:email ,
                decoration: InputDecoration(
                  filled: true,

                  fillColor: Colors.white70,

                  labelText: "email address",
                  border: OutlineInputBorder(

                    borderSide: BorderSide(
                        color: Colors.black
                      //this has no effect
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "email address",
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),
            Container(width: MediaQuery.of(context).size.width * 0.94,
              child: TextField(controller:compl ,
                decoration: InputDecoration(
                  filled: true,

                  fillColor: Colors.white70,

                  labelText: "Enter Complain",
                  border: OutlineInputBorder(

                    borderSide: BorderSide(
                        color: Colors.black
                      //this has no effect
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Enter Complain",
                ),
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(onTap: (){backend(name.text,_preview,_add,compl.text,email.text,point.geoPoint);},
              child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.deepPurpleAccent,
                          Colors.indigo[800]
                        ],
                      )
                  ),
                  child: Center(
                      child:
                          Text("SUBMIT", style: TextStyle(color: Colors.white)))),
            ),
          SizedBox(height: 8,),
            if(isloading==true)
              CircularProgressIndicator(backgroundColor: Colors.deepPurpleAccent,),SizedBox(height: 3,)],
        ),
      )),
    );
  }
}
