import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/components/map.dart';
import 'package:findfood/misc/colors.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:findfood/widgets/count_and_serve.dart';
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
                  text: "Fried Rice",
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
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Enter Search",
                    border: OutlineInputBorder(),
                    filled: true,
                    errorStyle: TextStyle(fontSize: 15),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a search!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RawMaterialButton(
                    onPressed: () {
                      ;
                    },
                    fillColor: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          //List View
          /*Container(
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
                            CountAndServe()
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
