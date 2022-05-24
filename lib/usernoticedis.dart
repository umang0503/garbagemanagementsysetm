import 'package:flutter/material.dart';
import'package:google_fonts/google_fonts.dart';

class noticeitem extends StatelessWidget {
  String name;
  String location;
  String subject;
  String message;

  noticeitem({this.name, this.location, this.subject, this.message});


  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
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
            mainAxisAlignment: MainAxisAlignment.center,

            crossAxisAlignment: CrossAxisAlignment.start,




            children: <Widget>[
            Text(name,style: GoogleFonts.robotoSlab(textStyle: TextStyle(fontWeight:FontWeight.bold,fontSize: 17)))
              ,SizedBox(height:4),Text(location,style:GoogleFonts.robotoSlab( textStyle:TextStyle(fontWeight:FontWeight.bold,fontSize: 17)))
              ,SizedBox(height:2),SizedBox(height:4),RichText(maxLines: 3,
                text: new TextSpan(

                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(text: 'Subject :  ',style:GoogleFonts.robotoSlab(textStyle:TextStyle(color:Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 17))),
                    new TextSpan(text: subject, style:GoogleFonts.robotoSlab(textStyle:TextStyle(fontWeight:FontWeight.bold,fontSize: 16))),
                  ],
                ),
              ),SizedBox(height: 4,),Text(message,style:GoogleFonts.robotoSlab(textStyle:TextStyle(fontWeight:FontWeight.bold,fontSize: 17))) ],),
        )

    );
  }
}
