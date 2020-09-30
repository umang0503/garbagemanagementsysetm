import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class adminnotice {
  final String uid;
  adminnotice({this.uid});

  final CollectionReference noticecollection =
  FirebaseFirestore.instance.collection('notice');
  Future updatenotice(
      String name1, String subject, String location1, String message) async {
    return await noticecollection.doc(uid).set({
      'name': name1,
      'subject': subject,
      'location':location1,
      'message': message,
      
    });
  }
}
