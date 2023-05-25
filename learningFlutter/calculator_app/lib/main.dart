import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int inicialNum = 0;
  late String operationSign;
  late int finalNum;
  String finalMessage = "";

  void upDate() {
    if (inicialNum != 0) {
      setState(() {
        finalMessage = "$inicialNum";
      });
    }
    print("work");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.wb_sunny,
              color: Colors.blueGrey[500],
            ),
            SizedBox(
              width: 6.0,
            ),
            Icon(Icons.nightlight_round_outlined)
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "${finalMessage}",
                    style: TextStyle(color: Colors.grey[400], fontSize: 25.0),
                  ),
                  Text(
                    "${inicialNum}",
                    style: TextStyle(color: Colors.white, fontSize: 55.0),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey[800],
                  boxShadow: [
                    BoxShadow(color: Colors.blueGrey, spreadRadius: 1),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inicialNum = 0;
                            });
                          },
                          child: Text(
                            "AC",
                            style: TextStyle(
                                color: Colors.teal[500], fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "+/-",
                            style: TextStyle(
                                color: Colors.teal[500], fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "%",
                            style: TextStyle(
                                color: Colors.teal[500], fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "÷",
                            style: TextStyle(
                                color: Colors.red[500], fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inicialNum = 7;
                            });
                            upDate();
                          },
                          child: Text(
                            "7",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "8",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inicialNum = 9;
                            });
                            upDate();
                          },
                          child: Text(
                            "9",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "x",
                            style: TextStyle(
                                color: Colors.red[500], fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inicialNum = 4;
                            });
                            upDate();
                          },
                          child: Text(
                            "4",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inicialNum = 5;
                            });
                            upDate();
                          },
                          child: Text(
                            "5",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inicialNum = 6;
                            });
                            upDate();
                          },
                          child: Text(
                            "6",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "-",
                            style: TextStyle(
                                color: Colors.red[500], fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inicialNum = 1;
                            });
                            upDate();
                          },
                          child: Text(
                            "1",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inicialNum = 2;
                            });
                            upDate();
                          },
                          child: Text(
                            "2",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inicialNum = 3;
                            });
                            upDate();
                          },
                          child: Text(
                            "3",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "+",
                            style: TextStyle(
                                color: Colors.red[500], fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "@",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inicialNum = 0;
                            });
                            upDate();
                          },
                          child: Text(
                            "0",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            ".",
                            style: TextStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "=",
                            style: TextStyle(
                                color: Colors.red[500], fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey[800], // background
                            onPrimary: Colors.white, // foreground
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
