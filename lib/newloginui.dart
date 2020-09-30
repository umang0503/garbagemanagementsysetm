import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartcity/adminlogin.dart';
import 'package:smartcity/newsignupui.dart';
import 'package:smartcity/signup.dart';
import 'dashboard.dart';

class newui extends StatefulWidget {
  @override
  _newuiState createState() => _newuiState();
}

class _newuiState extends State<newui> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String email;
  String password;
  Future<void>signuser()async {

    try {
      setState(() {
        isLoading=true;
      });
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(userCredential!=null)
        {
          Navigator
              .of(context)
              .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
            return new userdashboard();
          }));
        }


    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading=false;
      });
      if (e.code == 'user-not-found') {

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Stack(children: <Widget>[Column(
        children: <Widget>[
          Container(decoration:BoxDecoration( gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.deepPurpleAccent, Colors.indigo[800]])),
            height: MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width*1 ,),
          Container(decoration:BoxDecoration( gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.yellow[400], Colors.yellow[500]])),height: MediaQuery.of(context).size.height*0.3,width:MediaQuery.of(context).size.width*1 ,),
          Container(decoration:BoxDecoration( gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ Colors.indigo[800],Colors.deepPurpleAccent])),height: MediaQuery.of(context).size.height*0.3,width:MediaQuery.of(context).size.width*1 ,)],
      ),
        Positioned(top:MediaQuery.of(context).size.height*0.28 ,left: 10,right: 10,
          child: Container(width:MediaQuery.of(context).size.width*0.9,
            child: Card(color:Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(key: _formKey,
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text("Email",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Container(
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Enter Email" : null;
                          },
                          decoration: InputDecoration(
                            hintText: "Email", ),
                          onChanged: (val) {
                            email = val;
                          },
                        ),),SizedBox(height: 20,),Text("Password",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Container(width: MediaQuery.of(context).size.width * 0.94,
                          child: TextFormField(
                            obscureText: true,
                            validator: (val) {
                              return val.isEmpty ? "Enter password" : null;
                            },
                            decoration: InputDecoration(
                              hintText: "Password",),
                            onChanged: (val) {
                              password = val;
                            },
                          )),SizedBox(height: 10,),GestureDetector(onTap: (){signuser();},
                        child: Container(decoration:BoxDecoration(color:Colors.indigo[800], borderRadius: BorderRadius.all(
                            Radius.circular(5.0) //                 <--- border radius here
                        ),),width: MediaQuery.of(context).size.width * 0.94,height: MediaQuery.of(context).size.height*0.07,child:Center(child:Text("LOGIN",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ))),
                      ),],),
                ),
              ),),
          ),
        ),Positioned(top:MediaQuery.of(context).size.height*0.67 ,left: 10,right: 10,child: GestureDetector(onTap: (){Navigator
            .of(context)
            .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
          return new newsignupui();
        }));},
          child: Container(decoration:BoxDecoration(color: Colors.greenAccent[400],borderRadius: BorderRadius.all(
              Radius.circular(5.0))),width: MediaQuery.of(context).size.width * 0.94,height: MediaQuery.of(context).size.height*0.07,
            child: Center(child:Text("SIGN UP",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),)),),
        ),),Positioned(top:MediaQuery.of(context).size.height*0.76 ,left: 10,right: 10,child: GestureDetector(onTap: (){Navigator
            .of(context)
            .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
          return new adminui();
        }));},
          child: Container(decoration:BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.all(
              Radius.circular(5.0))),width: MediaQuery.of(context).size.width * 0.94,height: 50,
            child: Center(child:Text("ADMIN LOGIN",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),)),),
        ),),
        if(isLoading==true)
         Positioned(top: MediaQuery.of(context).size.height * 0.86,left:MediaQuery.of(context).size.width * 0.46,child: CircularProgressIndicator(backgroundColor: Colors.red,),)],),
    ));
  }
}
