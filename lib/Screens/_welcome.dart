import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/Screens/_login.dart';

import '../utils/app_styles.dart';
import '_signup.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Column(
        children: [
          Gap(h*0.16),
          Container(
            height: h*0.15,
            margin: EdgeInsets.symmetric(horizontal: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage("assets/img_7.jpg"),
                  radius: 50,

                ),
              ],
            ),
          ),
          Gap(h*0.08),
          Container(
            height: h*0.08,
            width: w*0.4,
            decoration: BoxDecoration(
              color: Styles.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextButton(
                onPressed: () => {Get.back()},
                child: Text("Sign Out", style: Styles.headLineStyle2.copyWith(color: Colors.white, fontSize: 25),)
            ),
          ),
        ],
      ),
    );
  }
}

