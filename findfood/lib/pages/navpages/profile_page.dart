import 'package:findfood/size_config.dart';
import 'package:findfood/widgets/app_large_text.dart';
import 'package:findfood/widgets/app_text.dart';
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
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              children: [
                AppText(text: "Profile"),
              ],
            ),
          ),
              Container(
                width: 150,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('assets/images/profile.png'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black54.withOpacity(.5),
                    width: 5.0,
                  )
                ),
              ),
              const SizedBox(
                height: 10,
              ),
                SizedBox(
                  width: size.width * .3,
                  child: Row(
                    children: [
                      Text('Smith Sha',style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20, 
                      ),
                      ),
                      SizedBox(
                        height: 24.0,
                        child: Image.asset("assets/images/verify.png"),
                      )
                    ],
                  ),
                ),
                Text('Smith@gmail.com',style: TextStyle(
                    color: Colors.black54.withOpacity(.3),
                ),),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: size.height *.7,
                width: SizeConfig.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person,color: Colors.black54.withOpacity(.5),),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Text('MyProfile',style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,color: Colors.black54.withOpacity(.4),size: 16.0,),
                      ],
                    ),
                    Text("\n"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.settings,color: Colors.black54.withOpacity(.5),),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Text('Setting',style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,color: Colors.black54.withOpacity(.4),size: 16.0,),
                      ],
                    ),
                    Text("\n"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.logout,color: Colors.black54.withOpacity(.5),),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Text('Logout',style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,color: Colors.black54.withOpacity(.4),size: 16.0,),
                      ],
                    ),
                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}







