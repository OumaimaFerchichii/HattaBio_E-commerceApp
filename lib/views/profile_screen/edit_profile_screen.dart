// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/controllers/profile_controller.dart';
import 'package:hattabio/widgets_common/bg_widget.dart';
import 'package:hattabio/widgets_common/custom_textfield.dart';
import 'package:hattabio/widgets_common/our_button.dart';

class Editprofile extends StatelessWidget {
  final dynamic data;
  const Editprofile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<profilecontroller>();

    return bgWidget
    (
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          ()=>Column(
            mainAxisSize: MainAxisSize.min,
            children: [
        
        
        
        
               controller.profileimagepath.isEmpty? Image.asset(profileimg1,width:80,fit: BoxFit.cover,).
               box.roundedFull.
               clip(Clip.antiAlias).make():Image.network((controller.profileimagepath.value),
               width:80,
               fit: BoxFit.cover,
               
               ).box.roundedFull.clip(Clip.antiAlias).make(),
        
        
               10.heightBox,
               ourbutton(
                color: Colors.green,onpress: (){
                  controller.changeimage(context);
           
                },textcolor: whiteColor,title: "Change "
               ),
               const Divider(),
               20.heightBox,
               customtextfield(
                controller: controller.namecontroller,
                hint: nameHint,
                title: name,
                isPass: false,
          
               ),
               customtextfield(
                controller: controller.passwordcontroller,
                hint: passwordHint,
                title: password,
                isPass: true,
                
                
               ),
               20.heightBox,
               controller.isloading.value?CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation (Colors.green),
               ): SizedBox(
                width: context.screenHeight-60,
                 child: ourbutton(
                  color: Colors.green,onpress: ()async{
                    controller.isloading(true);
                    await controller.uploadprofileimage();
                    await controller.updateprofile(
                      imgUrl: controller.profileimagelink,
                      name: controller.namecontroller.text,
                      password: controller.passwordcontroller.text,
                    );
                    VxToast.show(context, msg: "Updated");
                  },textcolor: whiteColor,title: "Save "
                 ),
               ),
              
            ],
          ).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50,left: 12,right: 12)).rounded.make(),
        ),
      )
    );
  }
}
