import 'package:findfood/pages/navpages/main_page.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuSideBar extends StatelessWidget {
  const MenuSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.grey.withOpacity(0.5)),
                ),
                AppLargeText(
                  text: "Yutthana",
                  size: 24,
                ),
                AppText(text: "Kasetsart University")
              ],
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                ;
              },
              child: Row(
                children: [
                  Icon(
                    Icons.home_rounded,
                    size: 26,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 10),
                  Text("Home",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 22,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.auto_graph_rounded,
                  size: 26,
                ),
                SizedBox(width: 10),
                Text("Statistics",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 22,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.nature),
                SizedBox(width: 10),
                Text("Nutritional",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 22,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.bento_rounded,
                  size: 26,
                ),
                SizedBox(width: 10),
                Text("Ingredients",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 22,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.bookmark_add_rounded,
                  size: 26,
                ),
                SizedBox(width: 10),
                Text("Blacklists",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 22,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
