import'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartcity/admin_complain.dart';

class complainBuilder extends StatelessWidget {

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
              Colors.indigo[900]
            ],
          ),
        ),
      )),
      body:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Complain").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document){
                return complainitem(
                  mappic: document.data()['mapsnap'],
                  address: document.data()['address'],
                  complain: document.data()['complain'],
                  name: document.data()['name'],
                    coordinate: document.data()['coordinate'],
                  id:document.id
                );} ).toList()

          );
        },
      ),
    );

  }

}
