import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:findfood/base_client.dart';
import 'package:findfood/components/menu.dart';
import 'package:findfood/foods.dart';
import 'package:findfood/misc/colors.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:findfood/widgets/count_and_serve.dart';
import 'package:findfood/widgets/menu_sidebar.dart';
import 'package:findfood/widgets/type_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isCollapsed = true;
  late AnimationController _animationController;

  Future<List<Foods>> GetAPI() async {
    var response = await BaseClient().get('/').catchError((err) {});
    if (response != null) {
      var dataAPI = foodsFromJson(response);
      return dataAPI;
    } else {
      print("Failed to get API in HomePage");
      return [];
    }
  }

  @override
  void initState() {
    super.initState();

    GetAPI();
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
                      FutureBuilder<List<Foods>>(
                          future: GetAPI(),
                          builder: (context, snapshot) {
                            var anAPI = snapshot.data;

                            if (isCollapsed) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Container(
                                    height: 380,
                                    width: double.maxFinite,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 2,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: 0,
                                      ),
                                      itemBuilder: (context, index) =>
                                          Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  getProportionateScreenWidth(
                                                      24),
                                                  30,
                                                  15,
                                                  15),
                                              child: Skelton(
                                                height: 335,
                                                width: 230,
                                              )),
                                    ),
                                  );
                                default:
                                  if (snapshot.hasError) {
                                    return Center(
                                        child: Text("Some error occurred!"));
                                  } else {
                                    return buildListFood(
                                        anAPI!, _tabController);
                                  }
                              }
                            } else {
                              return buildListFood(anAPI!, _tabController);
                            }
                          }),
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
                      FutureBuilder<List<Foods>>(
                          future: GetAPI(),
                          builder: (context, snapshot) {
                            var anAPI = snapshot.data;

                            if (isCollapsed) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Container(
                                    width: double.maxFinite,
                                    height: SizeConfig.screenHeight * 0.3,
                                    child: ListView.separated(
                                      scrollDirection: Axis.vertical,
                                      itemCount: 2,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        height: 0,
                                      ),
                                      itemBuilder: (context, index) =>
                                          Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  getProportionateScreenWidth(
                                                      20),
                                                  getProportionateScreenHeight(
                                                      20),
                                                  getProportionateScreenWidth(
                                                      20),
                                                  0),
                                              child: Skelton(
                                                height: 130,
                                                width: double.maxFinite,
                                              )),
                                    ),
                                  );
                                default:
                                  if (snapshot.hasError) {
                                    return Center(
                                        child: Text("Some error occurred!"));
                                  } else {
                                    return buildListFoodRecommeded(anAPI!);
                                  }
                              }
                            } else {
                              return buildListFoodRecommeded(anAPI!);
                            }
                          }),
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

  Widget buildListFood(List<Foods> foodAPI, TabController _tabController) {
    return Container(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(24)),
      height: 380, //SizeConfig.screenHeight * 0.387
      width: double.maxFinite,
      child: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: foodAPI.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenuFood(
                                foodItem: foodAPI[index],
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
                            height: SizeConfig.screenHeight * 0.425,
                            color: Colors.white,
                            padding: EdgeInsets.all(30),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Material(
                                    type: MaterialType.transparency,
                                    child: Container(
                                      height: SizeConfig.screenHeight * 0.2,
                                      child:
                                          Image.network(foodAPI[index].image!),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DefaultTextStyle(
                                    style: TextStyle(),
                                    child: AppLargeText(
                                      text: foodAPI[index].name!,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TypeInBottomSheet(
                                          name: foodAPI[index].country),
                                      TypeInBottomSheet(
                                          name: foodAPI[index].type),
                                      TypeInBottomSheet(
                                          name:
                                              "${foodAPI[index].nutrients?.calories} kcals"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DefaultTextStyle(
                                        style: TextStyle(),
                                        child: AppLargeText(
                                          text: "${foodAPI[index].rating}",
                                          size: 20,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      RatingBarIndicator(
                                        rating: foodAPI[index].rating!,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 24,
                                        direction: Axis.horizontal,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: 26,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left:
                                                getProportionateScreenWidth(6)),
                                        child: DefaultTextStyle(
                                            style: TextStyle(),
                                            child: AppText(
                                                text:
                                                    "${foodAPI[index].times?.total} Min")),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.favorite_outline_outlined,
                                        size: 26,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left:
                                                getProportionateScreenWidth(6)),
                                        child: DefaultTextStyle(
                                            style: TextStyle(),
                                            child: AppText(
                                                text:
                                                    "${foodAPI[index].likes} Likes")),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 15, right: 15),
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
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Plate of Food
                      Container(
                        width: double.maxFinite,
                        height: 180,
                        margin: const EdgeInsets.all(20),
                        child: Image.network(foodAPI[index].image!),
                      ),
                      //Food Name
                      Container(
                        width: double.maxFinite,
                        height: 30,
                        margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: SingleChildScrollView(
                          child: AppLargeText(
                            text: foodAPI[index].name!,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      //Star
                      Container(
                          width: double.maxFinite,
                          height: 26,
                          margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(17),
                              vertical: getProportionateScreenWidth(5)),
                          child: RatingBarIndicator(
                            rating: foodAPI[index].rating!,
                            itemBuilder: (context, index) => Icon(
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
                              left: getProportionateScreenWidth(18)),
                          child: CountAndServe(
                              times: foodAPI[index].times?.total,
                              likes: foodAPI[index].likes))
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
    );
  }

  Widget buildListFoodRecommeded(List<Foods> foodAPI) {
    return Container(
      width: double.maxFinite,
      height: SizeConfig.screenHeight * 0.3,
      child: ListView.builder(
        itemCount: foodAPI.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MenuFood(
                            foodItem: foodAPI[index],
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
                        height: SizeConfig.screenHeight * 0.425,
                        color: Colors.white,
                        padding: EdgeInsets.all(30),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Material(
                                type: MaterialType.transparency,
                                child: Container(
                                  height: SizeConfig.screenHeight * 0.2,
                                  child: Image.network(foodAPI[index].image!),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DefaultTextStyle(
                                style: TextStyle(),
                                child: AppLargeText(
                                  text: foodAPI[index].name!,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TypeInBottomSheet(
                                      name: foodAPI[index].country),
                                  TypeInBottomSheet(name: foodAPI[index].type),
                                  TypeInBottomSheet(
                                      name:
                                          "${foodAPI[index].nutrients?.calories} kcals"),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DefaultTextStyle(
                                    style: TextStyle(),
                                    child: AppLargeText(
                                      text: "${foodAPI[index].rating}",
                                      size: 20,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RatingBarIndicator(
                                    rating: foodAPI[index].rating!,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 24,
                                    direction: Axis.horizontal,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    size: 26,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: getProportionateScreenWidth(6)),
                                    child: DefaultTextStyle(
                                        style: TextStyle(),
                                        child: AppText(
                                            text:
                                                "${foodAPI[index].times?.total} Min")),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.favorite_outline_outlined,
                                    size: 26,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: getProportionateScreenWidth(6)),
                                    child: DefaultTextStyle(
                                        style: TextStyle(),
                                        child: AppText(
                                            text:
                                                "${foodAPI[index].likes} Likes")),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
            },
            child: Container(
              width: double.maxFinite,
              height: 130,
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(20),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
              ),
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
                    child: Image.network(foodAPI[index].image!),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        margin: EdgeInsets.only(left: 3),
                        child: SingleChildScrollView(
                          child: AppLargeText(
                            text: foodAPI[index].name!,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      //Star in Recommended
                      Container(
                        width: 200,
                        height: 26,
                        margin: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(4)),
                        child: RatingBarIndicator(
                          rating: foodAPI[index].rating!,
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
                      CountAndServe(
                          times: foodAPI[index].times?.total,
                          likes: foodAPI[index].likes)
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(16)),
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
