import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/components/restaurant.dart';
import 'package:findfood/foods.dart';
import 'package:findfood/misc/colors.dart';
import 'package:findfood/pages/empty_page.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:like_button/like_button.dart';

import '../size_config.dart';

class MenuFood extends StatefulWidget {
  //final String nameFoods;
  final Foods foodItem;
  const MenuFood({super.key, required this.foodItem});

  @override
  State<MenuFood> createState() => _MenuFood(foodItem);
}

class _MenuFood extends State<MenuFood> {
  //String nameFoods;
  Foods foodItem;
  _MenuFood(this.foodItem);

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
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
                Expanded(child: Container()),
                LikeButton(
                  onTap: onLikeButtonTapped,
                  isLiked: isLiked,
                )
              ],
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 240,
                    child: SingleChildScrollView(
                      child: Text(
                        foodItem.name!,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  AppText(text: "${foodItem.country} Category"),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 280,
                    height: 280,
                    child: Image.network(foodItem.image!),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(12)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(31, 35, 35, 35),
                          blurRadius: 12,
                          offset: Offset(2, 2), // Shadow position
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(8)),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/calories.png"),
                                        fit: BoxFit.scaleDown)),
                              ),
                              AppText(
                                  text: "${foodItem.nutrients?.calories} kcals")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(16)),
                          child: Icon(
                            Icons.more_vert_rounded,
                            size: 26,
                            color: Colors.black38,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(8)),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/rice.png"),
                                        fit: BoxFit.scaleDown)),
                              ),
                              AppText(
                                  text:
                                      "${foodItem.nutrients?.carbohydrates} g")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(16)),
                          child: Icon(
                            Icons.more_vert_rounded,
                            size: 26,
                            color: Colors.black38,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(8)),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/fish.png"),
                                        fit: BoxFit.scaleDown)),
                              ),
                              AppText(text: "${foodItem.nutrients?.protein} g")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    child: SingleChildScrollView(
                      child: Text(
                        //foodItem.description!
                        foodItem.description!,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        strutStyle: StrutStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    width: double.maxFinite,
                    height: 150,
                    child: ListView.builder(
                      itemCount: foodItem.ingredients?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 80,
                          margin: EdgeInsets.only(
                              top: 8,
                              right: getProportionateScreenWidth(13),
                              bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.redAccent,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 255, 171, 171),
                                blurRadius: 12,
                                offset: Offset(2, 4), // Shadow position
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                width: 50,
                                height: 50,
                                child: Image.network(
                                    foodItem.ingredients![index].image!),
                              ),
                              Container(
                                height: 28,
                                width: double.maxFinite,
                                child: SingleChildScrollView(
                                  child: Text(
                                    foodItem.ingredients![index].name!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RestaurantPage(foodItem: foodItem)));
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      width: double.maxFinite,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.mainColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppLargeText(
                            text: "FIND THEM!",
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> onLikeButtonTapped(bool isLiked) async {
  /// send your request here
  // final bool success= await sendRequest();

  /// if failed, you can do nothing
  // return success? !isLiked:isLiked;
  AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
  return !isLiked;
}
