import 'package:findfood/constants.dart';
import 'package:findfood/data/food.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
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

class _CollectionPage extends State<CollectionPage> {
  //ListGridview
  List photoFoods = [
    "fried-rice.png",
    "healthy-meat.png",
    "chicken-ceurry.png",
    "carbonara-spaghetti.png",
    "salad-with-meat.png",
    "salmonsalad.png"
  ];
  List nameFoods = ["Fried Rice", "Healthy Meat", "Chicken curry","Carbonara Spaghetti","Salad with meat","Salmon Salad"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black54,
        ),
        title: const Text(
          'Collection Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.search_rounded),
              color: Colors.black54,
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              })
        ],
      ),
      body: SafeArea(
        /*child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("assets/images/salad-with-meat.png"),
                    fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.4),
                  Colors.black.withOpacity(.2),
                ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Collection Food",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            "Bookmark Now!",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),*/
          child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 225,
                  ),
                  itemCount: 6,
                  itemBuilder: ((context, index) {
                    return Container(
                      //width: ,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/" + photoFoods[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: AppLargeText(
                        text: nameFoods[index],
                        size: 20,
                        color: Colors.white,
                      ),
                    );
                  })))),
    );
  }
}

//เกือบโอเคสุด
/*class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPage();
}

class _CollectionPage extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black54,
          ),
          title: const Text(
            'Collection Food',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        //body
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.black54.withOpacity(0.32),
                  ),
                ),
                child: TextField(
                  maxLines: 1,
                  onChanged: (value) {
                    //search value
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                    hintText: "Search Food",
                    hintStyle:
                        TextStyle(color: Colors.black54.withOpacity(0.32)),
                  ),
                ),
              ),
              Container(
                //padding: EdgeInsets.all(kDefaultPaddin),
                height: 180,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(Foods[0].image),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/ 4),
                child: Text(
                  Foods[0].name,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                //padding: EdgeInsets.all(kDefaultPaddin),
                height: 180,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(Foods[0].image),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/ 4),
                child: Text(
                  Foods[0].name,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]
          )
        );
  }
}*/

//เกือบดี
/*class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black54,
        ),
        title: const Text(
          'Collection Food',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.black54.withOpacity(0.32),
              ),
            ),
            child: TextField(
              maxLines: 1,
              onChanged: (value) {
                //search value
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: "Search Food",
                hintStyle: TextStyle(color: Colors.black54.withOpacity(0.32)),
              ),
            ),
          ),
          Container(
            //padding: EdgeInsets.all(kDefaultPaddin),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.amber[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(Foods[0].image),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0/4),
            child: Text(
              Foods[0].name,
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ), 
    );
  }*/

/*class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> with TickerProviderStateMixin {
  List photoFoods = [
    "fried-rice.png",
    "healthy-meat.png",
    "salad-with-meat.png"
  ];
  List nameFoods = ["fried-rice","healthy-meat","Salad With Meat"];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: Scaffold(    
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: <Widget>[
            //menu text
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  AppLargeText(text: "CollectionFood"),
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
            //Search
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    width: 320,
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
                          hintText: "Search Collection",
                          hintStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.black54,
                          suffixIcon: const Icon(Icons.mic),
                          suffixIconColor: Colors.black54,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(5),
                            vertical: getProportionateScreenWidth(12),
                          )),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[Container(
                margin: EdgeInsets.symmetric(vertical:  16.0, horizontal: 16.0),
                padding: const EdgeInsets.only(left: (30)),
                height: 250,
                width: 900/3,
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 6),
                      blurRadius: 20,
                      color: Color(0xFFB0CCE1).withOpacity(0.32),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(0),
                         decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              //color: Colors.amber,
                              image: DecorationImage(
                                 image: AssetImage(
                                   "assests/images/fried-rice.png"),
                                   scale: 0.2
                
                              )
                            )
                      )    
                  ],
                ), 
              )],
              )
          ],
        )),
      ),
      ),
    );
  }*/
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
