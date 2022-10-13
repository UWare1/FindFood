import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/base_client.dart';
import 'package:findfood/components/menu.dart';
import 'package:findfood/foods.dart';
import 'package:findfood/misc/colors.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final selected = BehaviorSubject<int>();

  Future<List<Foods>> GetAPI() async {
    var response = await BaseClient().get('/').catchError((err) {});
    if (response != null) {
      var dataAPI = foodsFromJson(response);
      return dataAPI;
    } else {
      print("Failed to get API in SpinnerPage");
      return [];
    }
  }

  List<String> items = [
    "fried-rice.png",
    "healthy-meat.png",
    "salad-with-meat.png",
    "fried-rice.png",
    "healthy-meat.png",
    "fried-rice.png",
    "healthy-meat.png",
    /*"healthy-meat.png",
    "salad-with-meat.png",
    "fried-rice.png",
    "healthy-meat.png",
    "salad-with-meat.png",*/
  ];
  @override
  void initState() {
    GetAPI();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _animationController.forward();
    return FadeTransition(
      opacity: _animation,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_2.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.brown, BlendMode.screen))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "SPINNER",
                        size: 42,
                      ),
                      Text("Rotate your food in the bottom of this page."),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Stack(
                  children: [
                    FractionalTranslation(
                      translation: Offset(0, 0.36),
                      child: Transform.scale(
                        scale: 2.25,
                        child: Container(
                          height: SizeConfig.screenHeight * 0.56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(800),
                              color: Color.fromARGB(255, 245, 162, 54)),
                        ),
                      ),
                    ),
                    FutureBuilder<List<Foods>>(
                        future: GetAPI(),
                        builder: (context, snapshot) {
                          var anAPI = snapshot.data;

                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return CircularProgressIndicator();
                            default:
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text("Some error occurred!"));
                              } else {
                                return buildRandomSpin(anAPI!);
                              }
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRandomSpin(List<Foods> foodAPI) {
    var itemRandom = Random();
    int numRandom;
    List<int> item = [];
    numRandom = itemRandom.nextInt(foodAPI.length);
    for (int i = 0; i <= 6; i++) {
      item.add(i);
      numRandom = itemRandom.nextInt(foodAPI.length);
      for (int j = 0; j <= i; j++) {
        if (item[j] == numRandom) {
          numRandom = itemRandom.nextInt(foodAPI.length);
          j = 0;
        }
      }

      item[i] = numRandom;
      print(item[i]);
    }

    return FractionalTranslation(
      translation: Offset(0, 0.575),
      child: Transform.scale(
        scale: 2.25,
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.56,
          child: FortuneWheel(
            selected: selected.stream,
            animateFirst: false,
            physics: CircularPanPhysics(
                duration: Duration(seconds: 1), curve: Curves.decelerate),
            onFling: () {
              AudioPlayer().play(
                AssetSource('audio/spinner_tone.mp3'),
              );
              setState(() {
                selected.add(Fortune.randomInt(0, 7));
              });
            },
            indicators: const <FortuneIndicator>[
              FortuneIndicator(
                  alignment: Alignment.centerRight,
                  child: TriangleIndicator(
                    color: Colors.transparent,
                  ))
            ],
            items: [
              for (int i = 0; i <= 6; i++) ...<FortuneItem>{
                FortuneItem(
                  child: Container(
                    height: 120,
                    width: 120,
                    margin: EdgeInsets.only(left: 60),
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage('assets/images/' + items[i]),
                    //         fit: BoxFit.cover)),
                    child: Image.network(
                      foodAPI[item[i]].image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  style: const FortuneItemStyle(
                      color: Colors.orangeAccent,
                      borderColor: Colors.orangeAccent,
                      borderWidth: 3),
                  onTap: () {
                    AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MenuFood(foodItem: foodAPI[item[i]])));
                  },
                )
              }
            ],
            onAnimationEnd: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MenuFood(foodItem: foodAPI[item[selected.value]])));
            },
          ),
        ),
      ),
    );
  }
}
