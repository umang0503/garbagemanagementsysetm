import'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:smartcity/admin_complain.dart';
import 'package:smartcity/admin_panel.dart';
import 'package:smartcity/adminnotice.dart';
import 'package:smartcity/complain.dart';
import 'package:smartcity/create_truck.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartcity/usermarker.dart';
import 'package:smartcity/usernoticefirebase.dart';
import 'package:smartcity/usertruckback.dart';
import 'newloginui.dart';
class userdashboard extends StatefulWidget {
  @override
  _userdashboardState createState() => _userdashboardState();
}

class _userdashboardState extends State<userdashboard> {
  Future<void>logout()async{
    await FirebaseAuth.instance.signOut();
    Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
      return newui();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: <Color>[
                    Colors.deepPurpleAccent,
                    Colors.indigo[800]
                  ],
                ),),
              height:MediaQuery.of(context).size.height*0.35 ,

              child: Center(child: Text('How Can I Help You',style:TextStyle(color: Colors.white,fontSize: 20)),
              ),
            ),),
          Positioned(top:MediaQuery.of(context).size.height*0.06,left:MediaQuery.of(context).size.width*0.86,child: IconButton(icon:Icon(Icons.power_settings_new,color: Colors.white,),onPressed: (){logout();},)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: <Widget>[SizedBox(height: MediaQuery.of(context).size.height*0.22,),
                GridView.count(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  primary: false,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => usermarker()),
                        );
                      },
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/schedule.png'),
                              SizedBox(
                                height: 14,
                              ),
                              Text("Dustbin Near Me",
                                  style: TextStyle(
                                      color: Colors.blue[900], fontSize: 15,fontWeight: FontWeight.bold))
                            ],
                          )),
                    ),
                    InkWell(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => complain()),
                      );
                    },
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/agenda.png'),
                              SizedBox(
                                height: 14,
                              ),
                              Text("Complain",
                                  style: TextStyle(
                                      color: Colors.blue[900], fontSize: 15,fontWeight: FontWeight.bold))
                            ],
                          )),
                    ),
                    InkWell(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => truckbuilder()),
                      );
                    },
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/truck.png'),
                              SizedBox(
                                height: 14,
                              ),
                              Text("Time Table",
                                  style: TextStyle(
                                      color: Colors.blue[900], fontSize: 15,fontWeight: FontWeight.bold))
                            ],
                          )),
                    ),
                    InkWell(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => noticeBuilder()),
                      );
                    },
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/noticeboard.png'),
                              SizedBox(
                                height: 14,
                              ),
                              Text("Notice",
                                  style: TextStyle(
                                      color: Colors.blue[900], fontSize: 15,fontWeight: FontWeight.bold))
                            ],
                          )),
                    ),
                  ],
                )
              ],),
            ),
          )],));
  }
}
