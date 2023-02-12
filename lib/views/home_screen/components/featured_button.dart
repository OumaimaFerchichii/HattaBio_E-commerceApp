import 'package:flutter/material.dart';
import 'package:hattabio/consts/consts.dart';
Widget featuredButton({String?title,icon}){
  return Row(
    children: [
      Image.asset(icon,width:70,fit: BoxFit.fill,),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),

    ],
  
  ).box.width(350).margin(const EdgeInsets.symmetric(horizontal:6)).white.padding(const EdgeInsets.all(4)).roundedSM.outerShadow.make();
}