import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class admintruck {
  final String uid;
  admintruck({this.uid});

  final CollectionReference truckcollection =
  Firestore.instance.collection('truck');
  Future updatetruck(
      String name2, String truckno, String date,String area,String time) async {
    return await truckcollection.doc(uid).set({
      'name': name2,
      'truckno': truckno,
      'date':date,
      'area':area,
      'time':time,

    });
  }
}
