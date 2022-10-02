import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../size_config.dart';

class MenuFood extends StatefulWidget {
  final String nameFoods;
  const MenuFood({super.key, required this.nameFoods});

  @override
  State<MenuFood> createState() => _MenuFood(nameFoods);
}

class _MenuFood extends State<MenuFood> {
  String nameFoods;
  _MenuFood(this.nameFoods);

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
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black54,
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0,
          ),
          AppLargeText(
            text: nameFoods,
            color: Colors.black87,
          ),
          AppText(text: "Thai Category"),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: AssetImage("assets/images/fried-rice.png"),
                  fit: BoxFit.scaleDown),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
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
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/fried-rice.png"),
                                fit: BoxFit.scaleDown)),
                      ),
                      AppText(text: "181 Cals")
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage("assets/images/button-one.png"),
                          fit: BoxFit.scaleDown)),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/fried-rice.png"),
                                fit: BoxFit.scaleDown)),
                      ),
                      AppText(text: "191 Cals")
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage("assets/images/button-one.png"),
                          fit: BoxFit.scaleDown)),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/fried-rice.png"),
                                fit: BoxFit.scaleDown)),
                      ),
                      AppText(text: "201 Cals")
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
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
              itemCount: 10,
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
                        margin: const EdgeInsets.only(bottom: 12),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/fried-rice.png"),
                                fit: BoxFit.scaleDown)),
                      ),
                      AppText(text: "Data")
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.maxFinite,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.amber),
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
        ],
      ),
    );
  }
}
