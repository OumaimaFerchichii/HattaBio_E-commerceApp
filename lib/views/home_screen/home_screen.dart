import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hattabio/consts/colors.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/consts/lists.dart';
import 'package:hattabio/consts/strings.dart';
import 'package:hattabio/views/home_screen/components/featured_button.dart';
import 'package:hattabio/widgets_common/home_buttons.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color:lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child:SafeArea(child: Column(
     
        children: [
          Container(
            alignment: Alignment.center,
            
            height:50,
            color: Colors.green,
            child: TextFormField(
              decoration:  const InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
                filled:true,
                fillColor: whiteColor,
                hintText: searchanything,
                hintStyle: TextStyle(color: textfieldGrey),
            ),
            
            ),
          ),
          10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                   VxSwiper.builder(
                aspectRatio: 16/9,
                autoPlay: true,
               height: context.screenHeight*0.23,
               
                enlargeCenterPage: true,
                
                
                itemCount: slidersList1.length,
               itemBuilder:(context, index){
                return Image.asset(
                  slidersList1[index],
                  fit: BoxFit.fitWidth,
                ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
              }),
              10.heightBox,
              
            
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children : List.generate(
                  1,
                  (index) => homeButtons(
                    height: context.screenHeight*0.14,
                    width: context.screenWidth/1.3,
                    icon: icTopCategories ,
                    title:  topcategories,
                  ),
                ),
              ),
              10.heightBox,
               VxSwiper.builder(
                aspectRatio: 16/9,
                autoPlay: true,
               height: context.screenHeight*0.23,
                enlargeCenterPage: true,
                
                
                itemCount: slidersList2.length,
               itemBuilder:(context, index){
                return Image.asset(
                  slidersList2[index],
                  fit: BoxFit.fitWidth,
                ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
              }),
            
              20.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make()),
    20.heightBox,
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          1,
          (index)=>Column(
            children: [
              featuredButton(icon: FreaturedImages1[index],title: FreaturedTitles1[index]),
              10.heightBox,
              featuredButton(icon: FreaturedImages2[index],title: FreaturedTitles2[index]),
              10.heightBox,
              featuredButton(icon: FreaturedImages3[index],title: FreaturedTitles3[index]),
            ],
          )
          ).toList()
      
      ),
    ),
    //freatured products 
    20.heightBox,
    Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration:  const BoxDecoration(color:Color.fromARGB(255, 33, 92, 37)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        freaturedProducts.text.white.fontFamily(bold).size(18).make(),
        10.heightBox,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: 
              List.generate(4, 
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Image.asset(imgp1,width: 150,fit: BoxFit.cover,),
                  10.heightBox,
                  "Men Shirt".text.fontFamily(semibold).color(darkFontGrey).make(),
                  10.heightBox,
                  "90 TND ".text.color(Color.fromARGB(255, 10, 73, 12)).fontFamily(bold).size(16).make(),
                  
        
                 ],
              ).box.white.margin(const EdgeInsets.symmetric(horizontal: 6)).roundedSM.padding(const EdgeInsets.all(8)).make()),
              
            
          ),
        ),

      ],
      ),

      ),
      20.heightBox,
      //third swiper 
        VxSwiper.builder(
                aspectRatio: 16/9,
                autoPlay: true,
               height: context.screenHeight*0.23,
                enlargeCenterPage: true,
                
                
                itemCount: slidersList3.length,
               itemBuilder:(context, index){
                return Image.asset(
                  slidersList3[index],
                  fit: BoxFit.fitWidth,
                ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
              }),
//all products section 

20.heightBox,
GridView.builder(
  physics: const NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  itemCount: 4,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300,), 
  itemBuilder:(context,index){
   
    return  Column(
      
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Image.asset(imgp3,height: 200,
                  width: 200,fit: BoxFit.cover,),
                const Spacer(),
                  "Men Jumpsuit".text.fontFamily(semibold).color(darkFontGrey).make(),
                  10.heightBox,
                  "199.99 TND ".text.color(Color.fromARGB(255, 10, 73, 12)).fontFamily(bold).size(16).make(),
                  
        
                 ],
              ).box.white.margin(const EdgeInsets.symmetric(horizontal: 6)).roundedSM.padding(const EdgeInsets.all(12)).make();







  }),
  
    ],
    ),

                    
              ),
            ),
          
            ],
          )
        
        
        
      ),
      

    
    );
  }
}