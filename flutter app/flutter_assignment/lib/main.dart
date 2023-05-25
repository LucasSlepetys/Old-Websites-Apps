import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var x = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercise',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Exercise'),
        ),
        body: Row(children: [Text('Hello World'), Text('Test123')]),
      ),
    );
  }
}
