import'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartcity/admin_complain.dart';
import 'usernoticedis.dart';

class noticeBuilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.deepPurpleAccent,
              Colors.indigo[800]
            ],
          ),
        ),
      )),
      body:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("notice").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView(
    children: snapshot.data.docs.map((DocumentSnapshot document){
    return noticeitem(

                name: document.data()['name'],
                location: document.data()['location'],
                subject: document.data()['subject'],
                message: document.data()['message'],
    );} ).toList()

          );
        },
      ),
    );

  }

}
