import 'package:flutter/services.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/widgets_common/our_button.dart';
Widget exitDialog(context){
  return Dialog(
    child: Column(

      mainAxisSize: MainAxisSize.min,
      children: [
        
        
        "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        Divider(),
        10.heightBox,
        "Are you sure you want to exit ? ".text.size(16).color(darkFontGrey).make(),
        10.heightBox, 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourbutton(color: Colors.green,onpress: (){
              SystemNavigator.pop();
            },
            textcolor: whiteColor,title: "Yes"),
             ourbutton(color: Colors.green,onpress: (){
              Navigator.pop(context);
             },
             textcolor: whiteColor,title: "No"),
          ],
        )

      ],
    ).box.color(lightGrey).padding(const EdgeInsets.all(12)).roundedSM
    .make(),
  );
}