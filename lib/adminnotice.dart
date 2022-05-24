import 'package:flutter/material.dart';
import'package:random_string/random_string.dart';
import 'package:smartcity/noticebackend.dart';
import 'package:smartcity/signinui.dart';
import 'noticebackend.dart';
class notice extends StatefulWidget {
  @override
  _noticeState createState() => _noticeState();
}

class _noticeState extends State<notice> {
  final _formKey = GlobalKey<FormState>();
  bool _isloading=false;
  final maxLines = 5;
  final name1= TextEditingController();
  final location1 = TextEditingController();
  final subject = TextEditingController();
  final message= TextEditingController();
  var rand=randomAlphaNumeric(
      10);
  Future<void>noticebackend(String name, String subject, String location,String message)async
  {  setState(() {
    _isloading=true;
  });
    await adminnotice(uid: rand).updatenotice(name, subject, location, message);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => success(docid: rand,)),
  );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor:Colors.white,appBar: AppBar(flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Colors.deepOrange,
            Colors.orange
          ],
        ),
      ),
    )),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30,),
            Center(child: ShaderMask(
                blendMode: BlendMode.srcATop,
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 9.0,
                  colors: <Color>[Colors.deepOrange, Colors.orange],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child:  Text('CREATE NOTICE',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 19)),
            )),
            SizedBox(height: 40,),

    Container(width:320,
        child: TextField(controller:name1 ,
        decoration: InputDecoration(

          labelText: "Enter name",
        border: OutlineInputBorder(
        borderSide: BorderSide(
        color: Colors.red,//this has no effect
        ),
        borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: "name",
        ),
        ),
    ),SizedBox(height: 20,),
            Container(width:320,
              child: TextField(
                controller: subject,
                decoration: InputDecoration(


                  labelText: "Subject",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Subject",
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(width:320,
              child: TextField(
                controller:location1 ,
                decoration: InputDecoration(


                  labelText: "Location",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Area",
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(width:320,
              height: maxLines * 24.0,
              child: TextField(controller:message,
                maxLines: maxLines,
                decoration: InputDecoration(


                  labelText: "Message",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Enter message",
                ),
              ),
            ),SizedBox(height:35),
          Center(child:  GestureDetector(
            onTap: () {noticebackend(name1.text, subject.text, location1.text, message.text);

            },
            child: Container(
                height: 45,
                width: 120,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Colors.deepOrange,
                    Colors.orange
                  ],
                ),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Align(
                    alignment: Alignment.center,
                    child: Text("Submit",
                        style: TextStyle(color: Colors.white)))),
          )),SizedBox(height: 20,),
            if(_isloading==true)
              CircularProgressIndicator(backgroundColor: Colors.deepPurpleAccent,),
            SizedBox(height: 10,)],),
      ),

    );
  }
}
