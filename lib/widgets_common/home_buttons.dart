import 'package:flutter/material.dart';
import 'package:hattabio/consts/consts.dart';
Widget homeButtons({width,height,icon,String? title,onPress}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children : [
        Image.asset(icTodaysDeal,width: 26),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make()
      ],
  ).box.rounded.white.size(width, height).make();
}