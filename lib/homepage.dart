import 'package:flutter/material.dart';

class frontPage extends StatelessWidget {
  List<Color> _colors = [Colors.pink[50], Colors.blue];
  List<double> _stops = [0.0, 0.7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(236, 213, 235, 1),
            Color.fromRGBO(244, 195, 127, .6)
          ])),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Text(
                    "Hello !",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 250, left: 30, right: 30),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              child: IconButton(
                                icon: Icon(
                                  Icons.access_time,
                                ),
                              ),
                              backgroundColor: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text('pickup'),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              child: IconButton(
                                icon: Icon(
                                  Icons.receipt,
                                ),
                              ),
                              backgroundColor: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text('Complain'),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              child: IconButton(
                                icon: Icon(
                                  Icons.receipt,
                                ),
                              ),
                              backgroundColor: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text('Notice'),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: <Widget>[
                              CircleAvatar(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.access_time,
                                  ),
                                ),
                                backgroundColor: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('pickup'),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              CircleAvatar(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.receipt,
                                  ),
                                ),
                                backgroundColor: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Complain'),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              CircleAvatar(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.receipt,
                                  ),
                                ),
                                backgroundColor: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Notice'),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 200, left: 155),
          child: CircleAvatar(
            backgroundColor: Colors.pink,
            radius: 45,
          ),
        )
      ],
    ));
  }
}
