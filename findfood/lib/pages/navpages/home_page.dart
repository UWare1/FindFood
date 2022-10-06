import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/components/menu.dart';
import 'package:findfood/misc/colors.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:findfood/widgets/menu_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

/*class MenuInfo {
  final List photoFoods;
  final List nameFoods;

  const MenuInfo(this.photoFoods, this.nameFoods);
}*/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isCollapsed = true;
  List photoFoods = [
    "fried-rice.png",
    "healthy-meat.png",
    "salad-with-meat.png"
  ];
  List nameFoods = ["Fried Rice", "Healthy Meat", "Salad With Meat"];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TabController _tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      body: Stack(children: [
        MenuSideBar(),
        AnimatedPositioned(
          top: isCollapsed ? 0 : 0.1 * SizeConfig.screenHeight,
          bottom: isCollapsed ? 0 : -0.3 * SizeConfig.screenWidth,
          left: isCollapsed ? 0 : 0.6 * SizeConfig.screenWidth,
          right: isCollapsed ? 0 : -0.4 * SizeConfig.screenWidth,
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 600),
          child: Material(
            borderRadius: isCollapsed
                ? BorderRadius.circular(0)
                : BorderRadius.circular(40),
            elevation: 8,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //menu text
              Container(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                        setState(() {
                          isCollapsed = !isCollapsed;
                        });
                      },
                      child: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              //discover text
              Container(
                margin: EdgeInsets.only(left: getProportionateScreenWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: "DISCOVER"),
                    AppText(text: "Nutritional Gathered For You")
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //tabbar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    onTap: ((value) {
                      AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                    }),
                    labelPadding: const EdgeInsets.only(left: 40, right: 40),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey.withOpacity(0.8),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                        color: AppColors.mainColor, radius: 4),
                    tabs: const [
                      Tab(
                        text: "Thai",
                      ),
                      Tab(
                        text: "Japan",
                      ),
                      Tab(
                        text: "Korea",
                      ),
                      Tab(
                        text: "Italy",
                      ),
                      Tab(
                        text: "Others",
                      ),
                    ],
                  ),
                ),
              ),
              //List PhotoFoods
              Container(
                padding: const EdgeInsets.only(left: 30),
                height: 380,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            AudioPlayer()
                                .play(AssetSource('audio/click_tone.mp3'));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MenuFood(
                                          nameFoods: "Fried Rice",
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 30, bottom: 15, right: 15),
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.redAccent,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(66, 255, 40, 40),
                                  blurRadius: 6,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                              /*image: DecorationImage(
                                    image: AssetImage("assets/images/mountain.jpeg"),
                                    fit: BoxFit.cover)*/
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //Plate of Food
                                Container(
                                  width: double.maxFinite,
                                  height: 180,
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/" +
                                              photoFoods[index]),
                                          fit: BoxFit.scaleDown)),
                                ),
                                //Food Name
                                Container(
                                  width: double.maxFinite,
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(20)),
                                  child: AppLargeText(
                                    text: nameFoods[index],
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                //Star
                                Container(
                                  width: double.maxFinite,
                                  height: 20,
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(20),
                                      vertical:
                                          getProportionateScreenWidth(10)),
                                  decoration:
                                      BoxDecoration(color: Colors.lightBlue),
                                ),
                                //Count & Serve
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 20,
                                      margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(20)),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 236, 206)),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: double.maxFinite,
                                            width: 30,
                                            margin:
                                                const EdgeInsets.only(right: 6),
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
                                      margin: EdgeInsets.only(
                                          right:
                                              getProportionateScreenWidth(20)),
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: double.maxFinite,
                                            width: 30,
                                            margin:
                                                const EdgeInsets.only(right: 6),
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
                          ),
                        );
                      },
                    ),
                    Text("There"),
                    Text("Bye"),
                    Text("There"),
                    Text("Bye"),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //Recommended & See all
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: getProportionateScreenWidth(20)),
                    child: AppLargeText(
                      text: "Recommended",
                      size: 24,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(right: getProportionateScreenWidth(20)),
                    child: AppText(
                      text: "See all",
                      size: 16,
                    ),
                  ),
                ],
              ),
              //Recommended Menu
              Container(
                width: double.maxFinite,
                height: SizeConfig.screenHeight * 0.198,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MenuFood(
                                      nameFoods: "Fried Rice",
                                    )));
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 140,
                        margin: EdgeInsets.only(
                            top: 8,
                            left: getProportionateScreenWidth(20),
                            right: getProportionateScreenWidth(20),
                            bottom: 10),
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
                                          right:
                                              getProportionateScreenWidth(10)),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 236, 206)),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: double.maxFinite,
                                            width: 30,
                                            margin:
                                                const EdgeInsets.only(right: 6),
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
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: double.maxFinite,
                                            width: 30,
                                            margin:
                                                const EdgeInsets.only(right: 6),
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
              //search
              /*Container(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10)),
                            width: SizeConfig.screenWidth,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black54.withOpacity(0.2)),
                            child: TextField(
                              maxLines: 1,
                              onChanged: (value) {
                                //search value
                              },
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Search Food",
                                  hintStyle: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                  prefixIcon: const Icon(Icons.search),
                                  prefixIconColor: Colors.black54,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(20),
                                    vertical: getProportionateScreenWidth(12),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                          ))*/
            ]),
          ),
        ),
      ]),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - (radius / 2),
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

/*Widget menu(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 16),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Dashboard",
              style: TextStyle(color: Colors.black54, fontSize: 22)),
          SizedBox(
            height: 10,
          ),
          Text("Messages",
              style: TextStyle(color: Colors.black54, fontSize: 22)),
          SizedBox(
            height: 10,
          ),
          Text("Utility Bills",
              style: TextStyle(color: Colors.black54, fontSize: 22)),
          SizedBox(
            height: 10,
          ),
          Text("Funds Transfer",
              style: TextStyle(color: Colors.black54, fontSize: 22)),
          SizedBox(
            height: 10,
          ),
          Text("Branches",
              style: TextStyle(color: Colors.black54, fontSize: 22)),
        ],
      ),
    ),
  );
}*/
