import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smartcity/complaingoogle.dart';
class complainitem extends StatelessWidget {
  String address;
  String complain;
  String name;
  String mappic;
  String id;
  GeoPoint coordinate;

  complainitem({this.name, this.complain, this.address, this.mappic,this.id,this.coordinate});
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center,

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,

            children: <Widget>[
              GestureDetector(onTap: (){Navigator
                  .of(context)
                  .push(new MaterialPageRoute(builder: (BuildContext context) {

                return complaingoogle(latitude: coordinate.latitude,longitude: coordinate.longitude,);
              }));},
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,),
                  child: Image.network(mappic,
                      alignment:Alignment.topCenter,
                      height:200,
                      fit:BoxFit.cover,
                      width:double.maxFinite),),
              ),
              SizedBox(height:8),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8.0),
                child: Row(
                  children: <Widget>[
                    RichText(maxLines: 3,
                      text: new TextSpan(

                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: 'Name : ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                          new TextSpan(text:  name, style: new TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),

                      onPressed: () {
                            deleteUser(id);
                      },
                    ),],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(maxLines: 3,
                  text: new TextSpan(

                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: 'Address : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      new TextSpan(text: address, style: new TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(maxLines: 3,
                  text: new TextSpan(

                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: 'Complain : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      new TextSpan(text: complain, style: new TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),


            ],)

      ),
    );
  }
}
