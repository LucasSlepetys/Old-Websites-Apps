import 'package:flutter/material.dart';
import 'package:recipe_app/widgets.dart';
import 'list_recipes.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  Color color = Colors.grey.shade200;

  List<String> types = [];

  bool show = true;

  bool showBreakfast = false;
  bool showLunch = false;
  bool showDinner = false;

  IconData iconButton = Icons.favorite_outline;

  changeFavorite(i) {
    var isFavorite = i.isFavorite;
    print(isFavorite);

    if (isFavorite == true) {
      isFavorite = true;
    } else if (isFavorite == false) {
      isFavorite = true;
    }

    if (isFavorite == true) {
      setState(() {
        iconButton = Icons.favorite;
      });
    } else {
      setState(() {
        iconButton = Icons.favorite_outline;
      });
    }
    print(isFavorite);
    return isFavorite;
  }

  bool isPresent(String type) {
    return types.contains(type);
  }

  buttonClicked(String type) {
    if (isPresent(type) == true) {
      types.remove(type);
      setState(() {
        if (type == "breakfast") {
          showBreakfast = false;
        } else if (type == "lunch") {
          showLunch = false;
        } else {
          showDinner = false;
        }
      });
    } else {
      types.add(type);
      setState(() {
        if (type == "breakfast") {
          showBreakfast = true;
        } else if (type == "lunch") {
          showLunch = true;
        } else {
          showDinner = true;
        }
      });
    }
  }

  containsOrNot(type) {
    if (types.contains(type)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: drawer(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 42,
                    ),
                    onPressed: () {
                      _scaffoldState.currentState!.openDrawer();
                    },
                  ),
                  Icon(Icons.info_outline, size: 42)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Our Recipes",
                        style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Health and nutritious food recipes",
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.grey[500]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {
                          buttonClicked("breakfast");
                        },
                        icon: Icon(
                          Icons.breakfast_dining,
                          color: Colors.black,
                        ),
                        label: Text(
                          "BreakFast",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        style: ButtonStyle(
                            backgroundColor: showBreakfast
                                ? MaterialStateProperty.all(
                                    Colors.green.shade400)
                                : MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.transparent)))),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          buttonClicked("lunch");
                        },
                        icon: Icon(
                          Icons.lunch_dining,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Lunch",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        style: ButtonStyle(
                            backgroundColor: showLunch
                                ? MaterialStateProperty.all(
                                    Colors.green.shade400)
                                : MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.transparent)))),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          buttonClicked("dinner");
                        },
                        icon: Icon(
                          Icons.dinner_dining,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Dinner",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        style: ButtonStyle(
                            backgroundColor: showDinner
                                ? MaterialStateProperty.all(
                                    Colors.green.shade400)
                                : MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.transparent)))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          for (var i in listFood)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, 12.0, 12.0, 12.0),
                              child: types.contains(i.type)
                                  ? Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade100,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          )
                                        ],
                                      ),
                                      width: 200.0,
                                      height: 380.0,
                                      // color: Colors.white,
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Container(
                                                width: 160,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.contain,
                                                        alignment:
                                                            Alignment.center,
                                                        image: AssetImage(
                                                            i.image)),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8.0)),
                                                    color:
                                                        Colors.grey.shade200),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 0, 15),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      i.title,
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      i.description,
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors
                                                              .grey.shade600),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "${i.kcal} Kcal",
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        IconButton(
                                                          icon: Icon(
                                                            iconButton,
                                                            size: 30,
                                                            color: Colors.red,
                                                          ),
                                                          onPressed: () {
                                                            changeFavorite(i);
                                                          },
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          )
                                        ],
                                      ))
                                  : null,
                            )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Popular",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Food",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 32.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        for (var i in popularFood)
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 12.0, 12.0, 12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade100,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  )
                                ],
                              ),
                              width: 350.0,
                              height: 150.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: AssetImage(i.image)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            color: color),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            i.title,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            i.description,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.grey.shade600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${i.kcal} Kcal",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  iconButton,
                                                  size: 30,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  changeFavorite(i);
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
