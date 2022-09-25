import 'package:findfood/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.screenWidth,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('assets/image/profile.jpg'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
