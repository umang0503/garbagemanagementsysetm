import 'package:flutter/material.dart';
import'package:random_string/random_string.dart';
import 'package:smartcity/truckbackend.dart';
import 'noticebackend.dart';
import 'package:intl/intl.dart';
import 'signinui.dart';
class truckdetail extends StatefulWidget {
  @override
  _truckdetailState createState() => _truckdetailState();
}

class _truckdetailState extends State<truckdetail> {
  final _formKey = GlobalKey<FormState>();
  final maxLines = 5;
  DateTime _selectedDate;
 String timeing;
 String date;
 bool _isloading=false;
  TimeOfDay _currentTime = new TimeOfDay.now();
  final name= TextEditingController();
  final number = TextEditingController();
  final area = TextEditingController();
  final message= TextEditingController();
  var rand=randomAlphaNumeric(
      10);
  Future<void>truckbackend(String name, String number, String area,String date,String timeing)async
  { setState(() {
    _isloading=true;
  });
    await admintruck(uid: rand).updatetruck(name, number, date,area,timeing);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => success(docid: rand,)),
  );
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        date=DateFormat.yMd().format(_selectedDate);

      });
    });
    print('...');
  }
  void _presentTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _currentTime
    ).then((pickedtime) {
      if (pickedtime == null) {
        return;
      }
      setState(() {
        _currentTime = pickedtime;
        timeing=_currentTime.format(context);
      });
    });
    print('...');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor:Colors.white,appBar: AppBar(flexibleSpace: Container(
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
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:16.0,right:16),
          child: Column(

            children: <Widget>[
              SizedBox(height: 30,),
              Center(child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 9.0,
                    colors: <Color>[Colors.deepPurpleAccent, Colors.indigo[800]],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child:  Text('TRUCK SCHEDULE',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 19)),
              )),
              SizedBox(height: 40,),

              Container(width:320,
                child: TextField(controller:name ,
                  decoration: InputDecoration(
                    filled: true,

                    fillColor: Colors.white70,

                    labelText: "Enter name",
                    border: OutlineInputBorder(

                      borderSide: BorderSide(
                      color: Colors.black
                       //this has no effect
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "name",
                  ),
                ),
              ),SizedBox(height: 30,),
              Container(width:320,
                child: TextField(
                  controller: number,
                  decoration: InputDecoration(

                    filled: true,

                    fillColor: Colors.white70,
                    labelText: "Vehicle number",
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "vehicle number",
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(width:320,
                child: TextField(
                  controller:area ,
                  decoration: InputDecoration(

                    filled: true,

                    fillColor: Colors.white70,
                    labelText: "Location",
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Area",
                  ),
                ),
              ),
              SizedBox(height: 30,),
             Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[Row(
               children: <Widget>[
                 Container(decoration: BoxDecoration(border: Border.all(color:Colors.indigo[800],width: 2),borderRadius: BorderRadius.circular(5),
                 ),child:Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     _selectedDate == null
                         ? 'No Date Chosen!'
                         : '${DateFormat.yMd().format(_selectedDate)}',
                   ),
                 ),),
        IconButton(
          icon: Icon(Icons.calendar_today,color: Colors.indigo[800],),
          onPressed: () {
            _presentDatePicker() ;
          },
        )],
             ),
               Row(
                 children: <Widget>[
                   Container(decoration: BoxDecoration(border: Border.all(color:Colors.indigo[800],width: 2),borderRadius: BorderRadius.circular(5),
                   ),child:Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(
                       _currentTime == null
                           ? 'No time Chosen!'
                           : '${_currentTime.format(context)}',
                     ),
                   ),),
                   IconButton(
                     icon: Icon(Icons.access_time,color:Colors.indigo[800]),
                     onPressed: () {
                       _presentTimePicker() ;
                     },
                   )],
               ),
              ],),

               SizedBox(height: 50,),InkWell(onTap: (){
                truckbackend(name.text, number.text,  area.text,date,timeing);
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
              ),height:45,width:100,child: Center(child: Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
               ),SizedBox(height: 20,),
              if(_isloading==true)
                CircularProgressIndicator(backgroundColor: Colors.deepPurpleAccent,),
                 SizedBox(height: 10,)],),
        ),
      ),

    );
  }
}
