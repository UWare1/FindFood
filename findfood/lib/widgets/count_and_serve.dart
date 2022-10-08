import 'package:findfood/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountAndServe extends StatelessWidget {
  const CountAndServe({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 80,
          height: 30,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time_filled_rounded,
                size: 26,
                color: Colors.white,
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "30 Min",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
          width: 90,
          height: 30,
          margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 26,
                color: Colors.white,
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "26 Likes",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
