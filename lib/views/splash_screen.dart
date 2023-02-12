import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hattabio/consts/colors.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/views/auth_screen/login_screen.dart';
import 'package:hattabio/views/home_screen/home.dart';
import 'package:hattabio/widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //create method to change the screen
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      //Get.to(() => const LoginScreen());


      auth.authStateChanges().listen((User? user) { 
        if (user ==null && mounted){
          Get.to(()=> const LoginScreen());


        }else{
          Get.to(()=> const Home());
        }


      });
    });

  }


  void initState(){
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 92, 202, 138),
      body: Center(child: Column
      (children: [
        
        Align(alignment:Alignment.topLeft,child: Image.asset(icSplashBg,width: 300)),
        20.heightBox,
        applogowidget(),
        10.heightBox,
        appname.text.fontFamily(bold).size(22).white.make(),
        5.heightBox,
        
         const Spacer(),
         credits.text.white.fontFamily(semibold).make(),
         30.heightBox,
      ],)),
    );
  }
}