import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hattabio/consts/colors.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/widgets_common/our_button.dart';

class ItemsDetails extends StatelessWidget {
  final String? title;
  const ItemsDetails({super.key,required this.title });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
      ),
      body: Column(

children: [
  Expanded(
    child: Container(
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VxSwiper.builder(
            autoPlay: true,
            height: 350,
            
            
            itemCount: 3,
            aspectRatio: 16/9, itemBuilder:
          
           (context,index){
            return Image.asset(imgp1,width: double.infinity
            ,fit: BoxFit.cover,);
           }),
           10.heightBox,
           //title and details 
           title!.text.size(20).color(darkFontGrey).fontFamily(semibold).make(),
              10.heightBox,
              VxRating(onRatingUpdate: (value){},normalColor: textfieldGrey,selectionColor: golden,count: 5,
              size: 25,stepInt: true,),
              10.heightBox,
              " 99.99 \TND".text.color(Colors.green).fontFamily(semibold).make(),
              10.heightBox,
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                  "0".text.size(20).color(darkFontGrey).fontFamily(bold).make(),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                  "(0 available)".text.color((textfieldGrey)).size(20).make(),
                ],
              ).box.white.shadowSm.make(),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: "Total : ".text.color(textfieldGrey).size(20).fontFamily(bold).make(),
                  ),
                  " 0.00 \TND".text.color(Colors.green).size(16).fontFamily(bold).make(),

                  10.heightBox,
                  
                ],
              ).box.white.shadowSm.make(),
              //description section 
              "Description : put description here ".text.color(darkFontGrey).size(20).fontFamily(semibold).make(),
              10.heightBox,
              
              
        ],
      ),
      ),
      ),
      ),

  SizedBox(
    width: double.infinity,
    height: 60,
    child: ourbutton(
      color: Color.fromARGB(255, 45, 105, 47),
      onpress: (){},
      textcolor:whiteColor,
title: "Add to cart",    ),
  )
],
      ),
    );
  }
}