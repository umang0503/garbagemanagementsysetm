import'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
class success extends StatelessWidget {
  String docid;
  success ({this.docid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body:Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Lottie.asset('assets/success.json',),),
        Text("Your Reference id is $docid"),
        SizedBox(height: 10,),
        GestureDetector(onTap: (){
          Navigator.pop(context);
        },
          child: Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.deepPurpleAccent,
                Colors.indigo[800]
              ],
            ),
          ),width:90,height:50,child: Center(child: Text("Dashboard",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),),
        ),],
      )
    )
    ;
  }
}
