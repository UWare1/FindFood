import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/foods.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MapRestaurant extends StatefulWidget {
  final Restaurant restItem;
  const MapRestaurant({super.key, required this.restItem});

  @override
  State<MapRestaurant> createState() => _MapRestaurantState(restItem);
}

class _MapRestaurantState extends State<MapRestaurant> {
  Restaurant restItem;
  _MapRestaurantState(this.restItem);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/photo_map.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.black54,
                      ),
                    ),
                    //Expanded(child: Container()),
                    /*Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey.withOpacity(0.5)),
                ),*/
                    AppLargeText(
                      text: restItem.name!,
                      color: Colors.black87,
                      size: 22,
                    ),
                    Icon(
                      Icons.line_weight_rounded,
                      size: 30,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
