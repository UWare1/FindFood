import 'package:flutter/material.dart';

class FavFood{
  String title;
  String imageUrl;

  FavFood(
  {required this.title,
    required this.imageUrl,
  });
}

List<FavFood> favfoodlist = [
  FavFood(
    title: 'Grilled Chicken Steak with Tomato',
    imageUrl:'https://www.kindpng.com/picc/m/242-2422753_transparent-food-plate-png-food-on-plate-top.png',
  ),
];
  


