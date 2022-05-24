import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class truckitem extends StatelessWidget {
  String name;
  String trucknumber;
  String date;
  String time;
  String area;
  String id;

  truckitem({this.name, this.date, this.time, this.area,this.id,this.trucknumber});
  CollectionReference users = FirebaseFirestore.instance.collection('Complain');

  Future<void> deleteUser(String ids) {
    return users
        .doc('$ids')
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:5,left:8,right:8),
      child: Container(margin: EdgeInsets.symmetric(vertical: 1, horizontal: 0),
          decoration: new BoxDecoration(
            //new Color.fromRGBO(255, 0, 0, 0.0),
            border: Border.all(
                width: 2.0,
                color: Colors.black12
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(5.0)),
            color: Colors.white,

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,

              children: <Widget>[
              RichText(maxLines: 3,
              text: new TextSpan(

                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(text: 'Driver name  :  ',style: GoogleFonts.robotoSlab(textStyle:TextStyle(color:Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 17))),
                  new TextSpan(text: name, style: GoogleFonts.robotoSlab(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
                ],
              ),
            ),SizedBox(height:4),RichText(maxLines: 1,
                  text: new TextSpan(

                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: 'Truck Number  :  ',style: GoogleFonts.robotoSlab(textStyle:TextStyle(color:Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 17))),
                      new TextSpan(text: trucknumber, style: GoogleFonts.robotoSlab(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
                    ],
                  ),
                ),SizedBox(height:2),RichText(maxLines: 1,
            text: new TextSpan(

              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(text: 'Arrival Time  :  ',style: GoogleFonts.robotoSlab(textStyle:TextStyle(color:Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 17))),
                new TextSpan(text: time, style: GoogleFonts.robotoSlab(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
              ],
            ),
          ),SizedBox(height:4),RichText(maxLines: 3,
          text: new TextSpan(

            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              new TextSpan(text: 'Date :  ',style:GoogleFonts.robotoSlab(textStyle:TextStyle(color:Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 17))),
              new TextSpan(text: date, style:GoogleFonts.robotoSlab(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
            ],
          ),
        ),SizedBox(height: 2,),RichText(maxLines: 3,
      text: new TextSpan(

        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          new TextSpan(text: 'Area :  ',style: GoogleFonts.robotoSlab(textStyle:TextStyle(color:Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 17))),
          new TextSpan(text: area, style: GoogleFonts.robotoSlab(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
        ],
      ),
    ),
              ],),
          )

      ),
    );
  }
}
