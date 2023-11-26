import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:startwithyou/model/user_model.dart';

class FireStoreUser  {
  final CollectionReference _collectionReference =
   FirebaseFirestore.instance.collection('Users');

 Future<void> addUserInFirebase(UserModel userModel)async {
   await _collectionReference.doc(userModel.userId).set(userModel.toJson());
 }
 Future<DocumentSnapshot> getCurrentUser(String uId) async{
   return await _collectionReference.doc(uId).get();

}
}
