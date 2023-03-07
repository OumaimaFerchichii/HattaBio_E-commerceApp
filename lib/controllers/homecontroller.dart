
import 'package:get/get.dart';
import 'package:hattabio/consts/consts.dart';

class HomeController extends GetxController{
    @override
    void onInit(){
      getusername();
      super.onInit();
    }
 var currentNavIndex=0.obs;
 
var username='';
getusername() async{
  await firestore.collection(userscollection).where('id',isEqualTo: currentUser!.uid).get().then((value) {
    if(value.docs.isNotEmpty){
      return value.docs.single['name'];
    }
  }
  );
  username='n';


}


  
  }
