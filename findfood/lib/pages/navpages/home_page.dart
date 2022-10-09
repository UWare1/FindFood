import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:findfood/components/menu.dart';
import 'package:findfood/misc/colors.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:findfood/widgets/count_and_serve.dart';
import 'package:findfood/widgets/menu_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  late AnimationController _animationController;
  List photoFoods = [
    "fried-rice.png",
    "healthy-meat.png",
    "salad-with-meat.png"
  ];
  List nameFoods = ["Fried Rice", "Healthy Meat", "Salad With Meat"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  void menuChangeTapped() {
    if (isCollapsed == true) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

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
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(58),
                    left: getProportionateScreenWidth(16)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        menuChangeTapped();
                        AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                        setState(() {
                          isCollapsed = !isCollapsed;
                        });
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationController,
                        size: 36,
                        color: Colors.black54,
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(16)),
                      width: 50,
                      height: 50,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.grey.withOpacity(0.5)),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/iconprofile.png"),
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              //discover text
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: getProportionateScreenHeight(16),
                            left: getProportionateScreenWidth(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(text: "DISCOVER"),
                            AppText(text: "Nutritional Gathered For You")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(24),
                      ),
                      //tabbar
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            onTap: ((value) {
                              AudioPlayer()
                                  .play(AssetSource('audio/click_tone.mp3'));
                            }),
                            labelPadding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(32)),
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
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(24)),
                        height: 380, //SizeConfig.screenHeight * 0.387
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
                                    AudioPlayer().play(
                                        AssetSource('audio/click_tone.mp3'));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MenuFood(
                                                  nameFoods: nameFoods[index],
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
                                          color:
                                              Color.fromARGB(66, 255, 40, 40),
                                          blurRadius: 6,
                                          offset:
                                              Offset(4, 8), // Shadow position
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //Plate of Food
                                        Container(
                                          width: double.maxFinite,
                                          height: 180,
                                          margin: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/" +
                                                          photoFoods[index]),
                                                  fit: BoxFit.scaleDown)),
                                        ),
                                        //Food Name
                                        Container(
                                          width: double.maxFinite,
                                          margin: EdgeInsets.symmetric(
                                              horizontal:
                                                  getProportionateScreenWidth(
                                                      20)),
                                          child: AppLargeText(
                                            text: nameFoods[index],
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        //Star
                                        Container(
                                            width: double.maxFinite,
                                            height: 26,
                                            margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    getProportionateScreenWidth(
                                                        17),
                                                vertical:
                                                    getProportionateScreenWidth(
                                                        5)),
                                            child: RatingBarIndicator(
                                              rating: 3.7,
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 26,
                                              direction: Axis.horizontal,
                                            )),
                                        //Count & Serve
                                        Container(
                                            margin: EdgeInsets.only(
                                                left:
                                                    getProportionateScreenWidth(
                                                        18)),
                                            child: CountAndServe())
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
                            margin: EdgeInsets.only(
                                left: getProportionateScreenWidth(20)),
                            child: AppLargeText(
                              text: "Recommended",
                              size: 24,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                right: getProportionateScreenWidth(20)),
                            child: GestureDetector(
                              onTap: () {
                                AudioPlayer()
                                    .play(AssetSource('audio/click_tone.mp3'));
                                var snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'Coming Soon!',
                                    message:
                                        'This feature is not yet available, please be patient!',
                                    contentType: ContentType.warning,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: AppText(
                                text: "See all",
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Recommended Menu
                      Container(
                        width: double.maxFinite,
                        height: SizeConfig.screenHeight * 0.18,
                        padding: EdgeInsets.only(bottom: 0),
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                AudioPlayer()
                                    .play(AssetSource('audio/click_tone.mp3'));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MenuFood(
                                              nameFoods: nameFoods[index],
                                            )));
                              },
                              child: Container(
                                width: double.maxFinite,
                                height: 130,
                                margin: EdgeInsets.only(
                                    left: getProportionateScreenWidth(20),
                                    right: getProportionateScreenWidth(20),
                                    bottom: getProportionateScreenHeight(20)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.purpleAccent,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 240, 158, 255),
                                      blurRadius: 10,
                                      offset: Offset(4, 6), // Shadow position
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/" +
                                                      photoFoods[index]))),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 3),
                                          child: AppLargeText(
                                            text: nameFoods[index],
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        //Star in Recommended
                                        Container(
                                          width: 200,
                                          height: 26,
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  getProportionateScreenWidth(
                                                      4)),
                                          child: RatingBarIndicator(
                                            rating: 4.32,
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 26,
                                            direction: Axis.horizontal,
                                          ),
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
                      ),
                    ],
                  ),
                ),
              ),
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
