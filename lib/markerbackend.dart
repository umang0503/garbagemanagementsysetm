import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:random_string/random_string.dart';

class adminmapmarker {
  final String uid;
  adminmapmarker({this.uid});

  final CollectionReference markercollection =
  Firestore.instance.collection('marker');
  Future updatemarker(
      GeoPoint latpoint) async {
    return await markercollection.document(uid).setData({
      'position': GeoPoint(latpoint.latitude,latpoint.longitude),


    });
  }
}
