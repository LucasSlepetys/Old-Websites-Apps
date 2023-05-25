import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

const urlON = 'http://192.168.132.113/led1&2/on';
const urlOFF = 'http://192.168.132.113/led1&2/off';
void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String level = "off";
  int levelF = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Lucas ID Card",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSansTC'),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (levelF % 2 == 0) {
            _launchInBrowser(urlON);
            Timer(const Duration(milliseconds: 50), () {
              closeWebView();
              setState(() {
                level = "on";
              });
            });
          } else {
            _launchInBrowser(urlOFF);
            Timer(const Duration(milliseconds: 50), () {
              closeWebView();
              setState(() {
                level = "off";
              });
            });
          }

          setState(() {
            levelF += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[850],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 40.0, 0, 20.0),
            width: 78.0,
            child: Expanded(
              child: ClipOval(
                child: Image.asset(
                  "assets/galaxy1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              flex: 1,
            ),
          ),
          Divider(
            color: Colors.grey[600],
            height: 20,
            thickness: 2,
            indent: 50,
            endIndent: 40,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 40.0),
            child: Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20.0, 0, 5.0),
                    child: Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15.0,
                          fontFamily: 'NotoSansTC'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5.0, 0, 10.0),
                    child: Text(
                      "Lucas Slepetys",
                      style: TextStyle(
                          color: Colors.amber[700],
                          fontSize: 30.0,
                          fontFamily: 'AkayaKanadaka'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                    child: Text(
                      "Current Coding Level",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15.0,
                          fontFamily: 'NotoSansTC'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5.0, 0, 10.0),
                    child: Text(
                      "$level",
                      style: TextStyle(
                          color: Colors.amber[700],
                          fontSize: 30.0,
                          fontFamily: 'AkayaKanadaka'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          child: Text(
                            "lucas.sl@gmail.com",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'NotoSansTC',
                                letterSpacing: 2.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      headers: <String, String>{'header_key': 'header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}
