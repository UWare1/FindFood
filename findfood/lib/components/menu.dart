import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuFood extends StatefulWidget {
  const MenuFood({super.key});

  @override
  State<MenuFood> createState() => _MenuFood();
}

class _MenuFood extends State<MenuFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black54,
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.heart_broken,
                  size: 30,
                  color: Colors.black54,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
