import 'package:findfood/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
   SizeConfig().init(context);
    return  Scaffold(
      body: SingleChildScrollView(
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
                            hintText: "Search FavouriteFood",
                            hintStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: Colors.black54,
                            suffixIcon: const Icon(Icons.mic),
                            suffixIconColor: Colors.black54,
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
      ),
      
    );
  }
}