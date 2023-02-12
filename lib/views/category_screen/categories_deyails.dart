import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/views/category_screen/Items_details.dart';
import 'package:hattabio/widgets_common/bg_widget.dart';

class CategoriesDetails extends StatelessWidget {
  final String ? title;
  
  const CategoriesDetails({Key? key,required  this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(
            
          ),
        
        
        ),
        body: Container(
          padding: const EdgeInsets.all(12),

          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                 

                ),
              ),
              20.heightBox,
              Expanded(
              
                
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250,mainAxisSpacing: 8,crossAxisSpacing: 8)
                , itemBuilder: (context,index){
                   return  Column(
      
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Image.asset(imgp1,height:150,
                  width: 200,fit: BoxFit.cover,),
                const Spacer(),
                  "Men shirts".text.fontFamily(semibold).color(darkFontGrey).make(),
                  10.heightBox,
                  "99.99 TND ".text.color(Color.fromARGB(255, 10, 73, 12)).fontFamily(bold).size(16).make(),
                  
        
                 ],
              ).box.white.margin(const EdgeInsets.symmetric(horizontal: 6)).roundedSM.outerShadow.padding(const EdgeInsets.all(12))
              .make().onTap(() {
                Get.to(()=>ItemsDetails(title: "Men shirt"));
              });

                }),
              )
              
            ],
          ),
          
        ),
        
             

        //items container :
      
      ),
      
    );
  }
}