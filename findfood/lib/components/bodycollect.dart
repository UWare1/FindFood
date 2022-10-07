import 'package:findfood/data/food.dart';
import 'package:flutter/material.dart';

class Bodycollect extends StatefulWidget {
  const Bodycollect({super.key});

  @override
  State<Bodycollect> createState() => _Bodycollect();
}

class _Bodycollect extends State<Bodycollect> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Container(
            //padding: EdgeInsets.all(kDefaultPaddin),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.amber[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(Foods[0].image),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0/4),
            child: Text(
              Foods[0].name,
              style: TextStyle(color: Colors.black),
            ),
          )

      ],
    );
  }
}