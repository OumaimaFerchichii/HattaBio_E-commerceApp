import 'package:flutter/material.dart';
import 'package:hattabio/consts/consts.dart';
Widget detailsCard({String?count,String?title,width}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      
            count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
            5.heightBox,
            title!.text.color(darkFontGrey).make(),
            5.heightBox,
            
          ],
        ).box.white.rounded.width(width).height(80).padding(const EdgeInsets.all(4)).make();
    
  
}