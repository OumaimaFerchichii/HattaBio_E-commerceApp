import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/controllers/auth_controller.dart';

import '../../consts/lists.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';
import '../home_screen/home.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck=false;
  var controller = Get.put(Authcontroller());
  //text controller 
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var passwordretrycontroller = TextEditingController();
   @override
  Widget build(BuildContext context) {
    return bgWidget(
      
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      body:Center(child:Column(children: [
        (context.screenHeight*0.1).heightBox,
        applogowidget(),
        10.heightBox,
        "Join the  $appname ".text.fontFamily(bold).white.size(18).make(),
        15.heightBox,
        Obx(()=>Column(
            children: [
              customtextfield(hint:nameHint,title:name,controller: namecontroller,isPass: false),
              customtextfield(hint:emailHint,title:email,controller: emailcontroller,isPass: false,),
              
             customtextfield(hint:passwordHint,title:password,controller: passwordcontroller,isPass: true),
             customtextfield(hint:passwordHint,title:retypepassword,controller: passwordretrycontroller,isPass: true),
             Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: (){},child:forgetpass.text.make(),),
              
             ),
            
             Row(
              children: [
                Checkbox(
                  checkColor: Colors.green,
                  value: isCheck, onChanged: (newValue){
                    setState(() {
                       isCheck=newValue;
                      
                    });
                   
        
                },),
                10.widthBox,
                Expanded(
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "I agree to the ", style: TextStyle(fontFamily: regular,
                      color: fontGrey,),),
                      TextSpan(text: termAndCond, style: TextStyle(fontFamily: regular,
                      color: Colors.green,),),
                      TextSpan(text: "& ", style: TextStyle(fontFamily: regular,
                      color: fontGrey,),),
                      TextSpan(text: privacyPolicy, style: TextStyle(fontFamily: regular,
                      color: fontGrey,),),
                    ],
                  ),),
                ),
              ],
             ),
              5.heightBox,
            controller.isloading.value?  const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 98, 163, 121)),
             ): ourbutton( color:isCheck==true? Colors.green:lightGrey,title: signup,textcolor: whiteColor,onpress: 
             () async{
              if(isCheck !=false){
                controller.isloading(true);
                try{
                  await controller.signupMethod(context: context,email: emailcontroller.text,password: passwordcontroller.text).then((value) {
                    return controller.storeuserData(
                      email: emailcontroller.text,
                      password: passwordcontroller.text,
                      name: namecontroller.text,
        
                    );
                  }).then((value) {
                    VxToast.show(context, msg: loggedin);
                    Get.offAll(()=> const  Home());
                  });
                  
                }catch (e){
                  auth.signOut();
                  VxToast.show(context, msg: e.toString());  
                  controller.isloading(false);   
                           }
        
              }
        
             },
             ).box.width(context.screenWidth-50)
             .make(),
             10.heightBox,
             Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
              alreadyhaveaccount.text.color(fontGrey).make(),
              login.text.color(Colors.green).make().onTap(() {
                 Get.back();
                
              })
             ],
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