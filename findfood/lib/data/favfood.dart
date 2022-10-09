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
  FavFood(
    title: 'Chicken Ramen', 
    imageUrl: 'https://www.kindpng.com/picc/m/64-644207_transparent-chinese-food-box-png-chicken-ramen-wagamama.png',
    ),
    FavFood(
      title: 'Veg Pizza', 
      imageUrl: 'https://www.kindpng.com/picc/m/152-1520465_veg-pizza-images-png-transparent-png.png',
    ),
    FavFood(
      title: 'Salad', 
      imageUrl: 'https://www.kindpng.com/picc/m/334-3340215_salad-plate-with-food-hd-png-download.png',
    ),
    FavFood(
      title: 'Fried-fish with rice', 
      imageUrl: 'https://www.kindpng.com/picc/m/242-2422786_transparent-food-plate-png-fried-fish-png-download.png',
    ),
    FavFood(
      title: 'Pescado Soup', 
      imageUrl: 'https://www.kindpng.com/picc/m/428-4284941_transparent-pescado-png-pescado-zarandeado-dibujo-png-download.png',
    ),
    FavFood(
      title: 'Indian Omelette', 
      imageUrl: 'https://www.kindpng.com/picc/m/428-4285277_indian-omelette-hd-png-download.png',
    ),
    FavFood(
      title: 'Yello Curry', 
      imageUrl: 'https://www.kindpng.com/picc/m/428-4285683_yellow-curry-hd-png-download.png',
    ),
    FavFood(
      title: 'Chicken fire rice', 
      imageUrl: 'https://www.kindpng.com/picc/m/119-1192360_chicken-fried-rice-transparent-hd-png-download.png',
    ),
    FavFood(
      title: 'Kimchi fried rice', 
      imageUrl: 'https://www.kindpng.com/picc/m/121-1215014_kimchi-fried-rice-kimchi-fried-rice-no-background.png',
    ),
    FavFood(
      title: 'Green Curry', 
      imageUrl: 'https://www.kindpng.com/picc/m/7-77130_asian-soups-hd-png-download.png',
    ),
];
  


