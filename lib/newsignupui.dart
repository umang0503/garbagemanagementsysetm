import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartcity/newloginui.dart';
import 'package:smartcity/dashboard.dart';
class newsignupui extends StatefulWidget {
  @override
  _newsignupuiState createState() => _newsignupuiState();
}

class _newsignupuiState extends State<newsignupui> {
  final _formKey2 = GlobalKey<FormState>();

  Future<void>_createuser()async{

    try{
      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    if(userCredential!=null)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) {
          return userdashboard();
        },));
      }
      
    }on FirebaseAuthException catch(e)
    {
      print("error:$e");
    }
     
  }
  String email;
  String password;

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
        Positioned(top:MediaQuery.of(context).size.height*0.3 ,left: 10,right: 10,
          child: Container(height: MediaQuery.of(context).size.height*0.34,width:MediaQuery.of(context).size.width*0.9,
            child: Card(color:Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(key: _formKey2,
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[ SizedBox(height: 6,),Text("Email",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 8,),
                      Container(width: MediaQuery.of(context).size.width * 0.94,
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Enter Email" : null;
                          },
                          decoration: InputDecoration(
                              hintText: "Email", ),
                          onChanged: (val) {
                            email = val;
                          },
                        ),),SizedBox(height:20),Text("Password",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 8,),
                      Container(width: MediaQuery.of(context).size.width * 0.94,
                          child: TextFormField(obscureText: true,
                            validator: (val) {
                              return val.isEmpty ? "Enter password" : null;
                            },
                            decoration: InputDecoration(
                                hintText: "Password",),
                            onChanged: (val) {
                              password = val;
                            },
                          )),SizedBox(height: 20,),GestureDetector(onTap: (){_createuser();},
                            child: Container(decoration:BoxDecoration(color:Colors.indigo[800], borderRadius: BorderRadius.all(
                            Radius.circular(5.0) //                 <--- border radius here
                      ),),width: MediaQuery.of(context).size.width * 0.94,height: 50,child:Center(child:Text("SIGN UP",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ))),
                          ),],),
                ),
              ),),
          ),
        ),Positioned(top:MediaQuery.of(context).size.height*0.67 ,left: 10,right: 10,child: GestureDetector(onTap: (){Navigator
            .of(context)
            .push(new MaterialPageRoute(builder: (BuildContext context) {
          return new newui();
        }));},
          child: Container(decoration:BoxDecoration(color: Colors.greenAccent[400],borderRadius: BorderRadius.all(
              Radius.circular(5.0))),width: MediaQuery.of(context).size.width * 0.94,height: 50,
            child: Center(child:Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),)),),
        ),)],),
    ));
  }
}
