import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.5,
            height: SizeConfig.screenWidth * 0.5,
            margin: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/icons/archive_1.png'),
              fit: BoxFit.cover,
            )),
          ),
          Center(
            child: Text(
              "Don't have any favourite!\nPlease select your favourite menu",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
