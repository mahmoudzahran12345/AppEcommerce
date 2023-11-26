import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:startwithyou/helper/local_storage.dart';
import 'package:startwithyou/model/user_model.dart';

class ProfileViewModel extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }
  final LocalStorage localStorage = Get.find();
  UserModel? get userModel =>_userModel;
  UserModel? _userModel;
  Future<void> signOutAuth()async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorage.deleteUser();
  }

  void getCurrentUser()async {
    await localStorage.getUser.then((value){
      _userModel =value;
    });
    update();
  }
}