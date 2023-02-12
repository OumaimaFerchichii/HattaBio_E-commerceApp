import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/controllers/homecontroller.dart';
import 'package:hattabio/views/cart_screen/cartscreen.dart';
import 'package:hattabio/views/category_screen/category_screen.dart';
import 'package:hattabio/views/home_screen/home_screen.dart';
import 'package:hattabio/views/profile_screen/profilescreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(HomeController());
          var navbarItem=[
      BottomNavigationBarItem(icon:Image.asset(icHome,width: 26,),label: home),
       BottomNavigationBarItem(icon:Image.asset(icCategories,width: 26,),label: categories),
        BottomNavigationBarItem(icon:Image.asset(icCart,width: 26,),label: cart),
         BottomNavigationBarItem(icon:Image.asset(icProfile,width: 26,),label: account),
          ];
          var  navBody=[
            const HomeScreen(),
           const CategoryScreen(),
           const CartScreen(),
           const ProfileScreen(),
          ];
    return Scaffold(
      body:Column(children: [
        Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
      ],),
      
      bottomNavigationBar: Obx(()=>
        BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
      
          selectedItemColor: Colors.green,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type:BottomNavigationBarType.fixed ,
        backgroundColor: whiteColor,
        items: navbarItem,
        onTap: (value){
          controller.currentNavIndex.value=value;

        },
      ),
      ),
    );
  }
}