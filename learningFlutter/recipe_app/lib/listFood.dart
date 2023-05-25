import 'package:flutter/material.dart';

// ignore: camel_case_types
class foodList {
  String image;
  String title;
  String description;
  String kcal;
  String type;
  bool isFavorite;

  foodList(
      {required this.image,
      required this.title,
      required this.description,
      required this.kcal,
      required this.type,
      required this.isFavorite});
}
