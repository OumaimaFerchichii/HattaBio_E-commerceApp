import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hattabio/consts/colors.dart';
import 'package:hattabio/consts/lists.dart';
import 'package:hattabio/views/auth_screen/signup_screen.dart';
import 'package:hattabio/views/home_screen/home.dart';
import 'package:hattabio/widgets_common/applogo_widget.dart';
import 'package:hattabio/widgets_common/bg_widget.dart';
import 'package:hattabio/widgets_common/custom_textfield.dart';
import 'package:hattabio/widgets_common/our_button.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/strings.dart';
import '../../consts/styles.dart';
import '../../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Authcontroller());
    return bgWidget(
      
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      body:Center(child:Column(children: [
        (context.screenHeight*0.1).heightBox,
        applogowidget(),
        10.heightBox,
        "Log in $appname ".text.fontFamily(bold).white.size(18).make(),
        10.heightBox,
        Obx(()=> Column(
            children: [
              customtextfield(hint:emailHint,title:email,isPass: false,controller: controller.emailcontroller),
              
             customtextfield(hint:passwordHint,title:password,isPass: true,controller: controller.passwordcontroller),
             Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: (){},child:forgetpass.text.make(),),
              
             ),
             5.heightBox,
             controller.isloading.value?  const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 98, 163, 121)),
             ): ourbutton( color:Colors.green,
             title: login,
             textcolor: whiteColor,onpress: 
             () async {
              controller.isloading(true);
              await controller.loginMethod(context: context).then((value){
                if(value!=null){
                  VxToast.show(context, msg: loggedin);
                  Get.offAll(()=>const Home());
                }else{
                  controller.isloading(false);
                }
        
              });
        
              
             }).box.width(context.screenWidth-50)
             .make(),
             5.heightBox,
             createNewAccount.text.color(fontGrey).make(),
             5.heightBox,
             ourbutton( color:Colors.green,title: signup,textcolor: lightgolden,onpress: 
             (){
              Get.to(() => const SignupScreen());
             }).box.width(context.screenWidth-50)
             .make(),
        
        
             10.heightBox,
             loginWith.text.color(fontGrey).make(),
             5.heightBox,
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:List.generate(3, (index) => CircleAvatar(
                backgroundColor: lightGrey,
                radius: 25,
                child: Image.asset(socialIconList[index]),
              ),), 
             ),
              ],
             
        
            
          ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).make(),
        ),
      ],
      )
      ),
       ),
  
      );
  }
}