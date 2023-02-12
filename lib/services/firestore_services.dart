import 'package:hattabio/consts/consts.dart';

class Firestoreservices {
  //get users detail 
  static getUser(uid){
    return firestore.collection(userscollection).where('id',isEqualTo: uid).snapshots();

  }
}