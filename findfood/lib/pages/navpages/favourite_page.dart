// ignore_for_file: unused_label, prefer_const_constructors
import 'package:findfood/data/favfood.dart';
import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePage();
}

class _FavouritePage extends State<FavouritePage> {
  final itemList = [
    {
      'image': 'assets/images/favfood/pizza.png',
      'title': 'Pizza',
    },
    {
      'image': 'assets/images/favfood/Salad.png',
      'title': 'Salad',
    },
    {
      'image': 'assets/images/favfood/Ramen.png',
      'title': 'Ramen',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          elevation: 0,
          leading: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black54,
          ),
          title: Text('FavouriteFood'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearch());
                })
          ],
        ),
        body: ListView.builder(
            itemCount: favfoodlist.length,
            itemBuilder: (context, index) {
              FavFood favfood = favfoodlist[index];
              return Slidable(
                key: Key('$favfood'),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(), 
                  children: [
                    SlidableAction(onPressed: (context){
                      setState(() {
                        favfoodlist.removeAt(index); 
                      });
                    },
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                    ),
                  ]),
                child: Card(
                  child: ListTile(
                    title: Text(favfood.title),
                    leading: Image.network(favfood.imageUrl),
                    //trailing: Icon(Icons.delete),
                  ),
                ),
              );
            }));
  }
}

/*class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePage();
}

class _FavouritePage extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent[700],
          elevation: 0,
           leading:Icon(
                Icons.menu,
                size: 30,
                color: Colors.black54,
              ),
          title: Text('FavouriteFood'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearch());
                })
          ],
        ),
        body: ListView.builder(
            itemCount: favfoodlist.length,
            itemBuilder: (context, index) {
              FavFood favfood = favfoodlist[index];
              return Card(
                child: ListTile(
                  title: Text(favfood.title),
                  leading: Image.network(favfood.imageUrl),
                  trailing: Icon(Icons.delete),
                ),
              );
            }
            )
          );       
  }
}*/
/*body: Co(crossAxisAlignment: CrossAxisAlignment.start,children: [
         //menu text
        Container(
          padding: const EdgeInsets.only(top: 70, left: 20),
          child: Row(
            children: [
              Icon(
                Icons.menu,
                size: 30,
                color: Colors.black54,
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
                          hintText: "Search Favourite",
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
      ],),*/

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
