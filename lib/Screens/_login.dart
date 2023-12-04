import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/Screens/_signup.dart';
import 'package:untitled1/Screens/_welcome.dart';
import 'package:untitled1/utils/_auth_controller.dart';
import 'package:untitled1/utils/app_styles.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Column(
          children: [
            Gap(h*0.15),
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
            Gap(h*0.06),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      offset: Offset(1, 1)
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        label: const Text("Email" ),
                        prefixIcon: const Icon(Icons.email, color: CupertinoColors.systemIndigo),
                        focusedBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Gap(h*0.02),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      offset: Offset(1, 1)
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: const Text("Password" ),
                        prefixIcon: const Icon(Icons.password, color: CupertinoColors.systemIndigo),
                        focusedBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Gap(h*0.07),
            Container(
              height: h*0.08,
              width: w*0.4,
              decoration: BoxDecoration(
                color: Styles.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                  onPressed: () => {
                     FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim()),
                     Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()),)
                  },
                  child: Text("Log In", style: Styles.headLineStyle2.copyWith(color: Colors.white, fontSize: 25),)
              ),
            ),
            Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: const TextSpan(
                      text: "Don\'t have an account?",
                      style: TextStyle(color: Color(0xFF687daf), fontWeight: FontWeight.bold, fontSize: 15)
                    ),
                ),
                RichText(
                  text:TextSpan(
                    text: " Create",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                    recognizer: TapGestureRecognizer()..onTap = ()  {Get.to(SignUp());},
                  ),
                ),
              ],
            ),

          ],
        ),
    ],
      ),
    );
  }
}
