import 'package:flutter/material.dart';
import 'package:hattabio/consts/colors.dart';
import 'package:hattabio/consts/consts.dart';
Widget customtextfield({String?title,String?hint,controller,isPass}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Colors.green).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextField(
        obscureText: isPass,
        controller: controller,

        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: semibold,
            color:textfieldGrey, 
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.green))

          ),
        ),
        5.heightBox,
      

    ],
  );
}