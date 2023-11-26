
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:startwithyou/constant.dart';
import 'package:startwithyou/helper/local_storage.dart';
import 'package:startwithyou/model/user_model.dart';
import 'package:startwithyou/view/controll_veiw.dart';
import 'package:startwithyou/view/home_screen.dart';

import '../../services/firestore_user.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth firebaseAuth  = FirebaseAuth.instance;
  late String email , password;
  String? name;
  final Rxn<User> _user = Rxn<User>();
   get user => _user.value?.email;
   final LocalStorage localStorage = Get.find();



  @override
  void onInit() {
    // TODO: implement onInit fetch DataBase
    super.onInit();
    _user.bindStream(firebaseAuth.authStateChanges());
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  void googleSignMethod() async{
     GoogleSignInAccount? googleUser = await googleSignIn.signIn();
     GoogleSignInAuthentication? googleSignInAuthentication = await googleUser?.authentication;
     final AuthCredential authCredential =  GoogleAuthProvider.credential(
         idToken:googleSignInAuthentication?.idToken ,
         accessToken:googleSignInAuthentication?.accessToken );
         await firebaseAuth.signInWithCredential(authCredential).then((value) {
          saveUser(value);
          Get.offAll( ControlView());
         });
  }
  Future<void> facebookSignMethod() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
     OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
     FirebaseAuth.instance.signInWithCredential(facebookAuthCredential).then((value) {
      saveUser(value);
      Get.offAll( HomeScreen());
     });
  }

  void signInWithEmailPassword()async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value)async {
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
          setUserLocal(UserModel.fromJson(value.data() as Map));
        });
      });
      Get.offAll( ControlView());
    }catch(error){
      Get.snackbar('Error login ',error.toString() ,colorText: secondColor,
      snackPosition: SnackPosition.BOTTOM
      );
    }
  }
  void createAccountWithEmailPassword()async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
         saveUser(value);
      });
      Get.offAll( ControlView());

    }catch(error){
      Get.snackbar('Error Register ',error.toString() ,colorText: secondColor,
          snackPosition: SnackPosition.BOTTOM
      );
    }
  }
  void saveUser(UserCredential value)async{
    UserModel userModel =UserModel(
        value.user?.uid,
        name ?? value.user?.displayName,
        value.user?.email,
        '');
     await FireStoreUser().addUserInFirebase(userModel);
     setUserLocal(userModel);
  }

void setUserLocal(UserModel userModel )async{
 await localStorage.setUser(userModel);
}



}