
// ignore_for_file: prefer_const_constructors

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class RecentFavouriteCard extends StatelessWidget {
  //const RecentFavouriteCard({Key? key}) :super(key:key);
  final String nameFoods;
  final String foodImagePath;

  RecentFavouriteCard({
    required this.nameFoods,
    required this.foodImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: EdgeInsets.all(12) ,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border:  Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
      ) ,
      child: Row(
        children: [
          ClipRRect(
            borderRadius:  BorderRadius.circular(8),
          child: Container(
            height: 50,
            padding:  EdgeInsets.all(12),
            child: Image.asset(foodImagePath),
          ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Text(nameFoods,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
              SizedBox(height: 4),
              Icon(Icons.delete_sweep_rounded),
            ],
          )
        ],
      ),
      )
    );
  }
}