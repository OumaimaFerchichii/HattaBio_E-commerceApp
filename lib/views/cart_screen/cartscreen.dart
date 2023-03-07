import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hattabio/consts/colors.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/controllers/cart_controller.dart';
import 'package:hattabio/services/firestore_services.dart';
import 'package:hattabio/views/cart_screen/shipping_screen.dart';
import 'package:hattabio/widgets_common/loading_indicator.dart';
import 'package:hattabio/widgets_common/our_button.dart';

import '../../consts/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
  var controller=Get.put(cartcontroller());



    return Scaffold(

      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
           
            
            child: ourbutton(color:
Colors.green,
onpress: (){
  Get.to(()=>const ShippingDetails());
},
textcolor: whiteColor,
title: "Proceed to shipping",
            ),
            ),


      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shopping cart".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
    body:StreamBuilder(
      stream: Firestoreservices.getCart(currentUser!.uid),
     

      
      builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot){
       if(!snapshot.hasData){
        return Center(
          child: loadingIndicator(),
        );
       }else if(snapshot.data!.docs.isEmpty){
        return Center(
          child:"Cart is empty".text.color (darkFontGrey).make(),
        );

       }else{
        var data=snapshot.data!.docs;
        controller.calculate(data);
        controller.productsnapshot=data;
        return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child: Container(
           child: ListView.builder(
            itemCount: data.length,
            
            itemBuilder: (BuildContext context, int  index) {
              return ListTile(
                leading: Image.network("${data[index]['img']}"),
                width:80,
                fit:BoxFit.cover,
                title: "${data[index]['title']} ${data[index]['qty']}"
                .text.fontFamily(semibold).
                size(16)
                
                .make(),
                subtitle: "${data[index]['tprice']}".numCurrency.text.color(Colors.green).fontFamily(semibold).make(),
                trailing: Icon(Icons.delete,color: Colors.green,).onTap(() { 
                  Firestoreservices.deleteDocument(data[index].id);
                }),
              );
              
            }),)),


          Row(
            children: [
              "Total price".text.fontFamily(semibold).color(darkFontGrey).make(),
                 Obx(
                  ()=>"${controller.totalP.value}".numCurrency.text.color(Colors.green).fontFamily(semibold).make()),




            ],
          ).box
          .padding(EdgeInsets.all(12))
          .color(lightgolden).
          width(context.screenWidth-60)

          .roundedSM
          .make(),
          10.heightBox,



          



        ],
      ),
      
      
      );
       }
    
      },
    ),
    );
    
  }
}