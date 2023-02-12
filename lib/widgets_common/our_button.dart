import 'package:flutter/material.dart';
import 'package:hattabio/consts/colors.dart';
import 'package:hattabio/consts/consts.dart';
Widget ourbutton({onpress,color,textcolor,String? title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: 
      onpress, 
    child: title!.text.color(textcolor).fontFamily(bold).make(),);
}