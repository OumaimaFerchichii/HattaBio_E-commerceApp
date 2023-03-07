import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hattabio/consts/colors.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/controllers/product_controller.dart';
import 'package:hattabio/widgets_common/our_button.dart';

class ItemsDetails extends StatelessWidget {
  final String? title;
   final dynamic data;
  const ItemsDetails({super.key,required this.title, this.data });

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async{
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        
        appBar: AppBar(leading: IconButton(onPressed: () {
          controller.resetValues();
          Get.back();
          
        },icon: Icon(Icons.arrow_back),),
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
              
              
              itemCount: data['p_images'].length,
              aspectRatio: 16/9,
              viewportFraction: 1.0,
              
               itemBuilder:
            
             (context,index){
              return Image.network
              (data["p_images"][index],
              width: double.infinity
              ,fit: BoxFit.cover,);
             }),
             10.heightBox,
             //title and details 
             title!.text.size(20).color(darkFontGrey).fontFamily(semibold).make(),
                10.heightBox,
                VxRating
    
                (isSelectable: false,
                  
                  value: double.parse(data['p_rating']),
                  onRatingUpdate: (value){}
                ,normalColor: textfieldGrey,
                selectionColor: golden,
                count: 5,
                maxRating: 5,
                size: 25,
                ),
                10.heightBox,
                " ${data["p_price"]}".numCurrency.text.color(Colors.green).fontFamily(semibold).make(),
                10.heightBox,
                Row(
                  children: [
                    SizedBox(
                      width:100,
                      child: "Quantity".text.color(textfieldGrey).make(),
                    ),
                    Obx(
                    ()=>
                       Row(
                        children: [
                          IconButton(onPressed: (){
                            controller.decreaseQuantity();
                            controller.calculatetotalPrice(int.parse(data['p_price']));
                          }, 
                          icon: const Icon(Icons.remove)),
                          controller.quantity.value.text.size(20).color(darkFontGrey).fontFamily(bold).make(),
                          IconButton(onPressed: (){
                            controller.increaseQuantity(int.parse(data['p_quantity']));
                            controller.calculatetotalPrice(int.parse(data['p_price']));
                          }, 
                            icon: const Icon(Icons.add)),
                          10.widthBox,
                          "(${data['p_quantity']} available)".text.color((textfieldGrey)).size(20).make(),
                        ],
                      ),
                    ),
                  ],
                ).box.padding(const EdgeInsets.all(8)).make(),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: "Total : ".text.color(textfieldGrey).size(20).fontFamily(bold).make(),
                      
                    ),
                    
      "${controller.totalPrice.value}".numCurrency.text.color(Colors.green).size(16).fontFamily(bold).make(),
                    10.heightBox,
                    
                  ],
                  
                ).box.white.shadowSm.make(),
                //description section 
                "Description ".text.color(darkFontGrey).fontFamily(semibold).make(),
    
                10.heightBox,
                "${data['p_description']}".text.color(darkFontGrey).make(),
                
                
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
        onpress: (){
          controller.addToCart(
          img: data['p_images'][0],
          qty: controller.quantity.value,
          title: data['p_name'],
          tprice:controller.totalPrice.value,
          );
          VxToast.show(context, msg: "Added to cart");
          
        },
        textcolor:whiteColor,
    title: "Add to cart",    ),
      )
    ],
        ),
      ),
    );
  }
}