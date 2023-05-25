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
  final myControllerEmail = TextEditingController();
  final myControllerPassword = TextEditingController();
  final myControllerPasswordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle_rounded),
        title: Text("Sign In"),
        centerTitle: true,
        actions: [Icon(Icons.more_vert)],
        backgroundColor: Colors.deepPurple[200],
        elevation: 100,
        shadowColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[Colors.deepPurple, Colors.white],
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            width: 320,
            height: 420,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  buildEmail(),
                  const SizedBox(
                    height: 18.0,
                  ),
                  buildPassword(),
                  const SizedBox(
                    height: 18.0,
                  ),
                  buildConfirmPassword(),
                  const SizedBox(
                    height: 55.0,
                  ),
                  submitButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        checkPassword();
      },
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      padding: EdgeInsets.fromLTRB(60.0, 15.0, 60.0, 15.0),
      color: Colors.blueAccent.withOpacity(0.9),
    );
  }

  Widget buildEmail() {
    return TextField(
      controller: myControllerEmail,
      decoration: InputDecoration(
        hintText: 'name@gmail.com',
        labelText: "Email",
        prefixIcon: Icon(Icons.mail),
        // border: OutlineInputBorder()
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }

  Widget buildPassword() {
    return TextField(
      controller: myControllerPassword,
      decoration: InputDecoration(
          hintText: "password123",
          labelText: "Password",
          prefixIcon: Icon(Icons.password)),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }

  Widget buildConfirmPassword() {
    return TextField(
      controller: myControllerPasswordConfirm,
      decoration: InputDecoration(
          hintText: "password123",
          labelText: "Confirm Password",
          prefixIcon: Icon(Icons.password)),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }

  void checkPassword() {
    if (myControllerEmail.text == "lucas.slepetys@hotmail.com") {
      if (myControllerPassword.text == myControllerPasswordConfirm.text &&
          myControllerPassword.text != "") {
        myControllerEmail.clear();
        myControllerPassword.clear();
        myControllerPasswordConfirm.clear();

        _openCustomDialog();
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Password doesn't match! Try again!"),
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                  "'" + myControllerEmail.text + "'" + " is a wrong email!"),
            );
          });
    }
  }

  //Copy dialog box:
  void _openCustomDialog() {
    showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              title: Text(
                'Confirmed!',
                style: TextStyle(color: Colors.blue, fontSize: 18.0),
              ),
              content: Text(
                'You are now signed in!',
                style: TextStyle(color: Colors.blueAccent, fontSize: 14.0),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Text("Worked!");
      },
    );
  }
}
