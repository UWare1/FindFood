import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/components/map.dart';
import 'package:findfood/foods.dart';
import 'package:findfood/misc/colors.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:findfood/widgets/count_and_serve.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';

class RestaurantPage extends StatefulWidget {
  final Foods foodItem;
  const RestaurantPage({super.key, required this.foodItem});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState(foodItem);
}

class _RestaurantPageState extends State<RestaurantPage> {
  Foods foodItem;
  _RestaurantPageState(this.foodItem);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                AppLargeText(
                  text: foodItem.name!,
                  size: 24,
                  color: Colors.black87,
                ),
                GestureDetector(
                  onTap: () {
                    AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                  },
                  child: Icon(
                    Icons.filter_alt_rounded,
                    size: 30,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodItem.restaurants?.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapRestaurant()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              width: SizeConfig.screenWidth * 0.6,
                              height: SizeConfig.screenWidth * 0.25,
                              margin: EdgeInsets.only(
                                  left: (SizeConfig.screenWidth * 0.3) - 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Colors.redAccent,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 221, 221, 221),
                                    blurRadius: 6,
                                    offset: Offset(3, 6), // Shadow position
                                  ),
                                ],
                              ),
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 3),
                                      child: AppLargeText(
                                        text:
                                            foodItem.restaurants![index].name!,
                                        size: 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                    //Star in Recommended
                                    Container(
                                      width: 200,
                                      height: 26,
                                      margin: EdgeInsets.only(
                                          top: getProportionateScreenHeight(1),
                                          bottom:
                                              getProportionateScreenHeight(4)),
                                      child: RatingBarIndicator(
                                        rating: foodItem
                                            .restaurants![index].rating!,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 26,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
                                    //Count & Serve in Recommended
                                    Container(
                                        width: SizeConfig.screenWidth * 0.5,
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 4),
                                              child: Icon(
                                                Icons.place_rounded,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              height: 24,
                                              width: 150,
                                              margin: EdgeInsets.only(top: 2),
                                              child: SingleChildScrollView(
                                                child: Text(
                                                  foodItem.restaurants![index]
                                                          .address! +
                                                      "101/98 NEWYORK CITY NAJA DEKD AJARN BOON",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow: TextOverflow.fade,
                                                ),
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: SizeConfig.screenWidth * 0.3,
                              height: SizeConfig.screenWidth * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/mountain.jpeg'),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(3, 6), // Shadow position
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
