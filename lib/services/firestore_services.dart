import 'package:hattabio/consts/consts.dart';

class Firestoreservices {
  //get users detail 
  static getUser(uid){
    return firestore.collection(userscollection).where('id',isEqualTo: uid).snapshots();

  }
  // get products accordinng to category
  static getProducts(category){


    return firestore.collection(productscollection).where('p_category',isEqualTo: category).snapshots();

  }
  //get cart 
  static getCart(uid){
    return firestore.collection(cartcollection).where('added_by',isEqualTo: uid).snapshots();
  }
  //delete document 
  static deleteDocument(docId){
    return firestore.collection(cartcollection).doc(docId).delete();
  }
}