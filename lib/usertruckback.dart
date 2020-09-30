import'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartcity/admin_complain.dart';
import 'package:smartcity/usertruckui.dart';

class truckbuilder extends StatelessWidget {

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
        stream: FirebaseFirestore.instance.collection("truck").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document){
                return truckitem(
                    name: document.data()['name'],
                    trucknumber: document.data()['truckno'],
                    date: document.data()['date'],
                    time: document.data()['time'],
                    area: document.data()['area'],
                    id:document.id
                );} ).toList()

          );
        },
      ),
    );

  }

}