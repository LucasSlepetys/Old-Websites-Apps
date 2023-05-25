import 'package:flutter/material.dart';
import 'color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color currentColor = Colors.red.shade100;
  String selectedColor = "Red";

  List<ColorToUse> colorsList = [
    ColorToUse(color: Colors.blue, text: "blue"),
    ColorToUse(color: Colors.red, text: "red"),
    ColorToUse(color: Colors.yellow, text: "yellow"),
    ColorToUse(color: Colors.orange, text: "orange"),
    ColorToUse(color: Colors.pink, text: "pink"),
    ColorToUse(color: Colors.grey, text: "grey"),
    ColorToUse(color: Colors.green, text: "green"),
    ColorToUse(color: Colors.black, text: "black"),
    ColorToUse(color: Colors.deepPurple, text: "deepPurple"),
    ColorToUse(color: Colors.lime, text: "lime"),
    ColorToUse(color: Colors.tealAccent, text: "tealAccent"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Selected color is ${selectedColor}",
          style: TextStyle(fontSize: 28.0, color: Colors.black),
        ),
        backgroundColor: currentColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Row(
            children: <Widget>[
              for (var i in colorsList)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    height: 100,
                    color: i.color,
                    child: Center(
                        child: GestureDetector(
                      onTap: () {
                        changeColor(i.color, i.text);
                      },
                      child: Text(
                        i.text,
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    )),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  changeColor(color, text) {
    Color colorToChange = color;
    String textToChange = text;

    setState(() {
      currentColor = colorToChange;
      selectedColor = textToChange;
    });
  }
}
