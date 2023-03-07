import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/controllers/homecontroller.dart';

class cartcontroller extends GetxController {




  var totalP=0.obs;
  //text controller and shipping details

  var addresscontroller=TextEditingController();
  
  var citycontroller=TextEditingController();
  
  var statecontroller=TextEditingController();
  
  var postalcodecontroller=TextEditingController();
  
  var phonecontroller=TextEditingController();

   var paymentIndex=0.obs;


   late dynamic productsnapshot;

    var products=[];
    var placingOrder=false.obs;

   calculate(data){
    totalP.value=0;
    for (var i=0;i<data.length;i++){
      totalP.value=totalP.value+int.parse(data[i]['tprice'].toString());
    }
   }
   changepaymentindex(index){
    paymentIndex.value=index;
   }
   placemyorder({required orderpaymentmethod,required totalamount}) async{
    placingOrder (true);
    await getproductdetails();
    await firestore.collection(orderscollection).doc().set({
      'order_date':FieldValue.serverTimestamp(),
      'order_by':currentUser!.uid.
      'order_by_name':Get.find<HomeController>().username,
      'order_by_email':currentUser!.email,
      'order_by_address':addresscontroller.text,
      'order_by_city':citycontroller.text,
      'order_by_state':statecontroller.text,
      'order_by_postalcode':postalcodecontroller.text,
      'order_by_phone':phonecontroller.text,
      'shipping_method':"Home Delivery",
      'payment_method':orderpaymentmethod,
      'order_placed':true,
      'order_confirmed':false,
      'order_delivered':false,
      'order_ondelivery':false,
      'total_amount':totalamount,
      'orders':FieldValue.arrayUnion(products),

    });
    placingOrder(false);
   }
   getproductdetails(){
    products.clear();
    for (var i=0;i<productsnapshot.length;i++){
      products.add({
        'img':productsnapshot[i]['img'],
         'qty':productsnapshot[i]['qty'],
         'tprice':productsnapshot[i]['tprice'],
          'title':productsnapshot[i]['title'],
           
      });
    }
   }
  
}