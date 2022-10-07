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
    name: "Chicken Rice"),
  Food(
    image: "beef-with-backpepper.png", 
    name: "Rice with beef & black pepper"),
  Food(
    image: "chicken-ceurry.png", 
    name: "Chicken Curry"),
  Food(
    image: "carbonara-spaghetti.png", 
    name: "Carbonara"),
  Food(
    image: "pngfind.com-pizza-png-605630.png", 
    name: "Pizza"),
  Food(
    image: "pngfind.com-plate-of-food-png-915652.png", 
    name: "Pork Stay"),
];