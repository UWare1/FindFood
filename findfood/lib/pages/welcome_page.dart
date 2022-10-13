import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/pages/navpages/main_page.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:findfood/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../misc/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  PageController pageController = PageController(initialPage: 0);
  bool isCheckedFirst = false;

  Future<bool> getDataInMobile() async {
    final prefs = await SharedPreferences.getInstance();
    final firsttime = prefs.getBool('firsttime') ?? false;
    debugPrint("ShaPreferences is Get: ${firsttime}");
    return firsttime;
  }

  Future<void> saveDataInMobile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firsttime', true);
    debugPrint("ShaPreferences is Save Success FirstTime Application!");
  }

  @override
  void initState() {
    getDataInMobile().then((value) {
      setState(() {
        isCheckedFirst = value;
      });
    });
    super.initState();
  }

  List lotties = ["what-to-eat.json", "spinner_1.json", "compound-food.json"];
  List bigtext = [
    "Don't Know",
    "Spinner",
    "Given",
  ];
  List normaltext = [
    "What to Eat",
    "Around the World",
    "Best Result for You",
  ];
  List smalltext = [
    "Often when it's time to eat you and your friends don't know what to eat",
    "Just by spinning, you can randomize the food from all over the world",
    "Results from all over the world Just a few seconds will be delivered to you",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: isCheckedFirst
          ? const MainPage()
          : PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: lotties.length,
              itemBuilder: (_, index) {
                return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.7,
                          height: SizeConfig.screenHeight * 0.3,
                          margin: EdgeInsets.only(
                              bottom: getProportionateScreenHeight(30)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Lottie.asset('assets/lottie/' + lotties[index],
                              fit: BoxFit.contain),
                        ),
                        AppLargeText(text: bigtext[index]),
                        AppText(text: normaltext[index], size: 26),
                        SizedBox(height: 20),
                        Container(
                          width: 250,
                          child: Text(
                            smalltext[index],
                            style: TextStyle(
                              color: AppColors.textColor2,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (indexDots) {
                            return Container(
                              margin: const EdgeInsets.only(right: 2),
                              width: index == indexDots ? 25 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexDots
                                      ? AppColors.mainColor
                                      : AppColors.mainColor.withOpacity(0.3)),
                            );
                          }),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                        ),
                        GestureDetector(
                          onTap: () {
                            AudioPlayer()
                                .play(AssetSource('audio/click_tone.mp3'));
                            pageController.animateToPage(index + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                            if (index == 2) {
                              saveDataInMobile();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                            }
                          },
                          child: ResponsiveButton(
                            width: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
