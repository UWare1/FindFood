import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/constants.dart';
import 'package:findfood/misc/colors.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/menu_sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    ));

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPage();
}

class _CollectionPage extends State<CollectionPage>
    with TickerProviderStateMixin {
  bool isCollapsed = true;
  late AnimationController _animationController;
  //ListGridview
  List photoFoods = [
    "fried-rice.png",
    "healthy-meat.png",
    "salad-with-meat.png",
    "salmonsalad.png",
    "chicken-ceurry.png",
    "carbonara-spaghetti.png"
  ];
  List nameFoods = [
    "Fried Rice",
    "Healthy Meat",
    "Salad with meat",
    "Salmon Salad",
    "Chicken curry",
    "Carbonara Spaghetti"
  ];
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

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
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
              child: Column(
                children: [
              Container(
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(58),
                    left: getProportionateScreenWidth(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        menuChangeTapped();
                        AudioPlayer()
                            .play(AssetSource('audio/click_tone.mp3'));
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
                    AppLargeText(text: "Collection", size: 24, color: Colors.black87,),
                    Container(
                      margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(16)),
                      width: 50,
                      height: 50,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.grey.withOpacity(0.5)),
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),

              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: getProportionateScreenHeight(10)),
                  child: GridView.builder(
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 220,
                      ),
                      itemCount: 6,
                      itemBuilder: ((context, index) {
                        return Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.mainColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: double.maxFinite,
                                height: 120,
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/" +
                                        photoFoods[index]),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              AppLargeText(
                                text: nameFoods[index],
                                size: 18,
                                color: Colors.black87,
            
                              )
                            ],
                          ),
                        );
                      })),
                ),
              ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'Salmon Salad',
    'Chicken Ramen',
    'Veg Pizza',
    'Salad',
    'Fried-fish with rice',
    'Pescado Soup',
    'Indian Omelette',
    'Yello Curry',
    'Chicken fire rice',
    'Kimchi fried rice',
    'Green Curry'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
