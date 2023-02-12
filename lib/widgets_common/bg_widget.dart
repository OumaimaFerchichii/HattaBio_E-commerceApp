import 'package:flutter/material.dart';
import 'package:hattabio/consts/colors.dart';
import 'package:hattabio/consts/consts.dart';
Widget bgWidget({Widget? child}){
  return Container(
    decoration:BoxDecoration(color: Color.fromARGB(255, 148, 209, 150),),
  child: child
   );
}