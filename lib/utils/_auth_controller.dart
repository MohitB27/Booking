import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/utils/app_styles.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _intialScreen);
  }

  _intialScreen(User? user){
    if(user==null){
      print("Log In");
      Get.offAll(()=>main());
    }else{
      Get.offAll(()=>main());
    }
  }
  
  void register(String email, password)async{
    try{
     await auth.createUserWithEmailAndPassword(email: email, password: password);

    }catch(e) {
      Get.snackbar("About User", "User Message",
        backgroundColor: Styles.primaryColor,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account creation failed.", style: TextStyle(color: Colors.white),),
        messageText: Text(e.toString(), style: TextStyle(color: Colors.white),),
      );
    }
  }
}