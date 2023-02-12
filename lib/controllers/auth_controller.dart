import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hattabio/consts/consts.dart';

class Authcontroller extends GetxController{
  var isloading=false.obs;
  //login method 
  var emailcontroller = TextEditingController();
  var passwordcontroller=TextEditingController();
  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;
    try{
      userCredential=
      await auth.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
  //signup method
   Future<UserCredential?> signupMethod({email,password,context}) async{
    UserCredential? userCredential;
    try{
      userCredential=
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data 
  storeuserData({name,password,email}) async{
    DocumentReference store =  firestore.collection(userscollection).doc(currentUser!.uid);
     await store.set({
      'name':name,
      'password':password,
      'email':email,
      'imageUrl':'',
      'id':currentUser!.uid,
      'cart_count':"00",
       'order_count':"00",
      }); 
        


           



           
  }
  //signout method 
  signoutMethod(context) async{
    try {
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
}