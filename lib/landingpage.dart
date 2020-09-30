import 'package:firebase_core/firebase_core.dart';
import'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartcity/admindashboard.dart';
import 'package:smartcity/dashboard.dart';


import 'newloginui.dart';
class landingpage extends StatefulWidget {
  @override
  _landingpageState createState() => _landingpageState();
}

class _landingpageState extends State<landingpage> {
  @override
  final Future<FirebaseApp>_initialization=Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future:_initialization,
        builder:(context, snapshot)
        {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                  child: Text("error:${snapshot.error}")

              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;
                  if (user!= null) {
                    return userdashboard();
                  } else {
                    return newui();
                  }
                }
              },);
          }
          return Scaffold(body: Center(child: Text('connecting to the app..'),),
          );
        });
  }
}
