import 'package:flutter/material.dart';

class Food {
  final String image, name;
  Food ({
    required this.image,
    required this.name,
  });
}

List<Food> Foods = [
  Food(
    image: "assets/images/Chicken Rice.png", 
    name: "Chicken Rice")
];