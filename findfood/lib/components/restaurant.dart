import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/components/map.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:like_button/like_button.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
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
                //Expanded(child: Container()),
                /*Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey.withOpacity(0.5)),
                ),*/
                AppLargeText(
                  text: "Fried Rice",
                  color: Colors.black87,
                ),
                GestureDetector(
                  onTap: () {
                    AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                  },
                  child: Icon(
                    Icons.filter_list_rounded,
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
          Container(
            width: double.maxFinite,
            height: SizeConfig.screenHeight * 0.86,
            child: ListView.builder(
              itemCount: 6,
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
                    width: double.maxFinite,
                    height: 140,
                    margin: EdgeInsets.only(
                        top: 0,
                        left: getProportionateScreenWidth(20),
                        right: getProportionateScreenWidth(20),
                        bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.orangeAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(31, 255, 164, 84),
                          blurRadius: 20,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/healthy-meat.png"))),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: "Healthy Meat",
                              size: 20,
                              color: Colors.white,
                            ),
                            //Star in Recommended
                            Container(
                              width: 200,
                              height: 20,
                              margin: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenWidth(4)),
                              color: Colors.redAccent,
                            ),
                            //Count & Serve in Recommended
                            Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 20,
                                  margin: EdgeInsets.only(
                                      right: getProportionateScreenWidth(10)),
                                  decoration: BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 255, 236, 206)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: double.maxFinite,
                                        width: 30,
                                        margin: const EdgeInsets.only(right: 6),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/mountain.jpeg"),
                                                fit: BoxFit.cover)),
                                      ),
                                      Text("30 min")
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 90,
                                  height: 20,
                                  decoration:
                                      BoxDecoration(color: Colors.lightGreen),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: double.maxFinite,
                                        width: 30,
                                        margin: const EdgeInsets.only(right: 6),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/mountain.jpeg"),
                                                fit: BoxFit.cover)),
                                      ),
                                      Text("2 serve")
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
