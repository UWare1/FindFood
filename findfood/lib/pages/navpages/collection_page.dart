import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class CollectionPage extends StatefulWidget {
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
  }
}
