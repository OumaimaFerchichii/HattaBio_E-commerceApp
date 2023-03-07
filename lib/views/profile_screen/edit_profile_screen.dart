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
        
        
        
        //if image data is empty and controller is empty
             data['imageUrl']==''&&  controller.profileimagepath.isEmpty?
                Image.asset(profileimg1,width:80,fit: BoxFit.cover,).
               box.roundedFull.
               clip(Clip.antiAlias).make():
               //data image is not empty and controller is empty 

               data['imageUrl']!=''&& controller.profileimagepath.isEmpty?
               
               Image.network(data['imageUrl'],width:80,
               fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
        
               :

               
               
               Image.file(File(controller.profileimagepath.value),
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
               10.heightBox,
               customtextfield(
                controller: controller.oldpasswordcontroller,
                hint: passwordHint,
                title: oldpassword,
                isPass: true,
                
                
               ),
               10.heightBox,
                customtextfield(
                controller: controller.newpasswordcontroller,
                hint: passwordHint,
                title: newpassword,
                isPass: true,
                
                
               ),
               20.heightBox,
               controller.isloading.value? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation (Colors.green),
               ): 
               SizedBox(
                width: context.screenHeight-60,
                 child: ourbutton(
                  color: Colors.green,
                  onpress: ()async{



                    controller.isloading(true);

                    //if image not selected 
                    if(controller.profileimagepath.value.isNotEmpty){
                      await controller.uploadprofileimage();

                    }else{
                      controller.profileimagelink=data['imageUrl'];
                    }
// if old paassword match data base 
if (data['password']==controller.oldpasswordcontroller.text){


  
   await controller.changeAuthpassword(
    email: data['email']
,
password: controller.oldpasswordcontroller.text,
newpassword: controller.newpasswordcontroller.text
  );
                    await controller.updateprofile(
                      imgUrl: controller.profileimagelink,
                      name: controller.namecontroller.text,
                      password: controller.newpasswordcontroller.text,
                    );
                    VxToast.show(context, msg: "Updated");

}else {
  VxToast.show(context, msg: 'Wrong old password ' );
  controller.isloading(false);
}
                   
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
