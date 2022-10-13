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
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_2.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.screen))),
        child: Column(
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
                    size: 22,
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
                              builder: (context) => MapRestaurant(
                                    restItem: foodItem.restaurants![index],
                                  )));
                    },
                    onLongPress: () {
                      showCupertinoModalBottomSheet(
                          expand: false,
                          context: context,
                          topRadius: Radius.circular(30),
                          elevation: 30,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Container(
                                height: SizeConfig.screenHeight * 0.625,
                                color: Colors.white,
                                padding: EdgeInsets.all(30),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Material(
                                        type: MaterialType.transparency,
                                        child: SizedBox(
                                          height: SizeConfig.screenWidth * 0.4,
                                          width: SizeConfig.screenWidth * 0.4,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              foodItem
                                                  .restaurants![index].image!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 36,
                                        width: 180,
                                        child: SingleChildScrollView(
                                          child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            child: Text(
                                              foodItem
                                                  .restaurants![index].name!,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 34,
                                        width: 240,
                                        child: SingleChildScrollView(
                                          child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontSize: 26,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600),
                                            child: Text(
                                              foodItem.restaurants![index]
                                                  .description!,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(8),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          DefaultTextStyle(
                                            style: TextStyle(),
                                            child: AppLargeText(
                                              text:
                                                  "${foodItem.restaurants![index].rating}",
                                              size: 20,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          RatingBarIndicator(
                                            rating: foodItem
                                                .restaurants![index].rating!,
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 24,
                                            direction: Axis.horizontal,
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 1,
                                        color: Colors.black26,
                                        margin: EdgeInsets.symmetric(
                                            vertical:
                                                getProportionateScreenHeight(
                                                    20),
                                            horizontal:
                                                getProportionateScreenWidth(
                                                    12)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 4),
                                            child: Icon(
                                              Icons.place_rounded,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          Container(
                                            width: SizeConfig.screenWidth * 0.6,
                                            height: 26,
                                            child: SingleChildScrollView(
                                              child: DefaultTextStyle(
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                child: Text(
                                                  foodItem.restaurants![index]
                                                      .address!,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(4),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 4),
                                            child: Icon(
                                              Icons.phone_iphone_rounded,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          Container(
                                            width: SizeConfig.screenWidth * 0.3,
                                            height: 26,
                                            margin: EdgeInsets.only(top: 2),
                                            child: SingleChildScrollView(
                                              child: DefaultTextStyle(
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                child: Text(
                                                  foodItem.restaurants![index]
                                                      .telephone!,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      Container(
                                        height: 120,
                                        width: 300,
                                        margin: EdgeInsets.only(
                                            bottom:
                                                getProportionateScreenHeight(
                                                    6)),
                                        child: ListView.separated(
                                            itemBuilder: (context, indexdate) =>
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    DefaultTextStyle(
                                                      style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      child: Text(
                                                        foodItem
                                                            .restaurants![index]
                                                            .datetime![
                                                                indexdate]
                                                            .date!,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    DefaultTextStyle(
                                                      style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      child: Text(
                                                        foodItem
                                                            .restaurants![index]
                                                            .datetime![
                                                                indexdate]
                                                            .time!,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                            itemCount: foodItem
                                                .restaurants![index]
                                                .datetime!
                                                .length),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: getProportionateScreenHeight(20)),
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
                                decoration: ShapeDecoration(
                                    color: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(12)),
                                        side: BorderSide(
                                            width: 3,
                                            color: AppColors.mainColor))),
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 3),
                                        child: AppLargeText(
                                          text: foodItem
                                              .restaurants![index].name!,
                                          size: 22,
                                          color: Colors.white,
                                        ),
                                      ),
                                      //Star in Recommended
                                      Container(
                                        width: 200,
                                        height: 26,
                                        margin: EdgeInsets.only(
                                            top:
                                                getProportionateScreenHeight(1),
                                            bottom:
                                                getProportionateScreenHeight(
                                                    4)),
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
                                                margin:
                                                    EdgeInsets.only(right: 4),
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
                                                        .address!,
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
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      offset: Offset(3, 6), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Container(
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                              width: 3,
                                              color: AppColors.mainColor))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      foodItem.restaurants![index].image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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
      ),
    );
  }
}
