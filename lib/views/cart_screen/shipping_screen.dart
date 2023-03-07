import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/controllers/cart_controller.dart';
import 'package:hattabio/views/cart_screen/payment_method.dart';
import 'package:hattabio/widgets_common/custom_textfield.dart';
import 'package:hattabio/widgets_common/our_button.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<cartcontroller>();
    return Scaffold(
      
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info".text.fontFamily(semibold).color(darkFontGrey).make(),

      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourbutton(
          onpress: (){
            if(controller.addresscontroller.text.length>10){
              Get.to(()=>PaymentMethod());


              

            }else{
              VxToast.show(context, msg: "Please fill the form");
            }
          },
          color: Colors.green,
          textcolor: whiteColor,
          title: "Continue", 
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            customtextfield(hint: "Address",isPass: false,title: "Address",controller: controller.addresscontroller),
             customtextfield(hint: "City",isPass: false,title: "City",controller: controller.citycontroller),
              customtextfield(hint: "State",isPass: false,title: "State",controller: controller.statecontroller),
               customtextfield(hint: "Postal code",isPass: false,title: "Postal code",controller: controller.postalcodecontroller),
                customtextfield(hint: "Phone",isPass: false,title: "Phone",controller: controller.phonecontroller), 
          ],
        ),
      ),
    );
  }
}