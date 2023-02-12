import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class profilecontroller extends GetxController{
  var profileimagepath=''.obs;
  var profileimagelink='';
  var isloading=false.obs;
  var namecontroller=TextEditingController();
   var passwordcontroller=TextEditingController();
   
  changeimage(context) async{
    try {
  final img= await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
  // ignore: unnecessary_null_comparison
  if(img == null)return;

  profileimagepath.value=img.path;
} on PlatformException catch (e) {
  VxToast.show(context, msg: e.toString());
}

    
    
  }



  uploadprofileimage() async{
    var filename=basename(profileimagepath.value);
    var destination='images/${currentUser!.uid}/$filename';
    Reference ref=FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileimagepath.value));
    profileimagelink= await ref.getDownloadURL();
  }
  
updateprofile({name,password,imgUrl}) async {
  var store = firestore.collection(userscollection).doc(currentUser!.uid);
  await store.set({
     'name':name,
     'password':password,
     'imageUrl':imgUrl,

  },SetOptions(merge: true));
  isloading(false);

}





}