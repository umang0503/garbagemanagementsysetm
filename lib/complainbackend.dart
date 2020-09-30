import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class usercomplain {
  final String uid;
  usercomplain({this.uid});

  final CollectionReference complaincollection =
      FirebaseFirestore.instance.collection('Complain');
  Future updatecomplain(
      String name, String snap, String address, String comp,String email,GeoPoint corrdinate) async {
    return await complaincollection.doc(uid).set({
      'name': name,
      'address': address,
      'mapsnap': snap,
      'complain': comp,
      'email':email,
      'coordinate':corrdinate
    });
  }
}
