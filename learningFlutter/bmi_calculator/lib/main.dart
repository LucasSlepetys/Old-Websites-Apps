import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String calcBIM = "23.4";
  String gender = "male";

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 16.0, color: Colors.white, letterSpacing: 2.0),
        ),
        actions: [Icon(Icons.circle_notifications)],
        backgroundColor: Colors.blueGrey[700],
        shadowColor: Colors.indigoAccent[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey[900],
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = "female";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[800],
                              border: Border.all(
                                  width: 5.0,
                                  color: isMaleOrFemale()
                                      ? Colors.white.withOpacity(0)
                                      : Colors.blueAccent)),
                          child: Image.asset(
                            "assets/femaleIcon.png",
                          ),
                          width: 158.0,
                          height: 158.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = "male";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[800],
                              border: Border.all(
                                  width: 5.0,
                                  color: isMaleOrFemale()
                                      ? Colors.blueAccent
                                      : Colors.white.withOpacity(0))),
                          child: Image.asset("assets/maleIcon.png"),
                          width: 158.0,
                          height: 158.0,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    color: Colors.blueGrey[800],
                    width: 360,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 2),
                            child: Text(
                              "Your height in Cm",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          TextFieldHeight()
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: 360,
                    color: Colors.blueGrey[800],
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 2),
                            child: Text(
                              "Your weight in Kg",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          TextFieldWeight()
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Your BMI",
                          style: TextStyle(fontSize: 50.0, color: Colors.white),
                        ),
                        Text("$calcBIM",
                            style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.white.withOpacity(0.75)))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: buttonBuild(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TextFieldHeight() {
    return TextField(
      controller: heightController,
      decoration: InputDecoration(
          hintText: "178",
          border: InputBorder.none,
          hintStyle:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 38.0)),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      style: TextStyle(color: Colors.white, fontSize: 38.0),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TextFieldWeight() {
    return TextField(
      controller: weightController,
      decoration: InputDecoration(
          hintText: "74",
          border: InputBorder.none,
          hintStyle:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 38.0)),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      style: TextStyle(color: Colors.white, fontSize: 38.0),
    );
  }

  Widget buttonBuild() {
    return ButtonTheme(
        minWidth: 300.0,
        height: 50.0,
        child: RaisedButton(
          onPressed: () {
            setState(() {
              calculateBMI();
            });
          },
          child: Text(
            "Calculate",
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
          color: Colors.blue[900],
        ));
  }

  isMaleOrFemale() {
    if (gender == "male") {
      return true;
    } else if (gender == "female") {
      return false;
    }
  }

  calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);

    // ignore: non_constant_identifier_names
    double BMI = (weight / ((height / 100) * (height / 100)));
    calcBIM = BMI.toStringAsFixed(2).toString();
  }
}
