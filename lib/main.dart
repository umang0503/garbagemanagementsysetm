import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcity/admin_panel.dart';
import 'package:smartcity/admindashboard.dart';
import 'package:smartcity/adminmarker.dart';

import 'package:smartcity/complain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartcity/create_truck.dart';
import 'package:smartcity/dashboard.dart';
import 'package:smartcity/helpermap.dart';
import 'package:smartcity/landingpage.dart';
import 'package:smartcity/mapmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smartcity/newloginui.dart';
import 'package:smartcity/newsignupui.dart';
import 'package:smartcity/signup.dart';
import 'package:smartcity/usermarker.dart';
import 'package:smartcity/usernoticefirebase.dart';
import 'package:smartcity/usertruckback.dart';
import 'homepage.dart';
import 'signinui.dart';



bool USE_FIRESTORE_EMULATOR = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings = Settings(
        host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  }
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userlocation>(
        create: (context) => LocationService().locationStream,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

          home: newui(),
        ));
  }
}
