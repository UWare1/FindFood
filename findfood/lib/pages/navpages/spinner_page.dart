import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/components/menu.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage> {
  final selected = BehaviorSubject<int>();
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
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
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
              //decoration: BoxDecoration(color: Colors.amber),
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
                FractionalTranslation(
                  translation: Offset(0, 0.575),
                  child: Transform.scale(
                    scale: 2.25,
                    child: SizedBox(
                      height: SizeConfig.screenHeight * 0.56,
                      child: FortuneWheel(
                        selected: selected.stream,
                        animateFirst: false,
                        physics: CircularPanPhysics(
                            duration: Duration(seconds: 1),
                            curve: Curves.decelerate),
                        onFling: () {
                          AudioPlayer().play(
                            AssetSource('audio/spinner_tone.mp3'),
                          );
                          setState(() {
                            selected.add(Fortune.randomInt(0, items.length));
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
                          for (int i = 0;
                              i < items.length;
                              i++) ...<FortuneItem>{
                            FortuneItem(
                              child: Container(
                                height: 120,
                                width: 120,
                                margin: EdgeInsets.only(left: 60),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/' + items[i]),
                                        fit: BoxFit.cover)),
                              ),
                              style: const FortuneItemStyle(
                                  color: Colors.orangeAccent,
                                  borderColor: Colors.orangeAccent,
                                  borderWidth: 3),
                              onTap: () {
                                AudioPlayer()
                                    .play(AssetSource('audio/click_tone.mp3'));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MenuFood(nameFoods: items[i])));
                              },
                            )
                          }
                        ],
                        onAnimationEnd: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuFood(
                                      nameFoods: items[selected.value])));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
