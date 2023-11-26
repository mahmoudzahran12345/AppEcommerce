import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startwithyou/model/user_model.dart';

import '../constant.dart';

class LocalStorage extends GetxController{
  UserModel? userModel ;

  Future<UserModel?> get getUser async{
    try{
      if(userModel == null){
        return null;

      }
      else{
        return userModel = await _getUserData(userModel!);
      }

    }catch(e){
      print (e);
      return null;
    }
  }
    _getUserData(UserModel userModel) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var value = sharedPreferences.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }
  setUser(UserModel userModel) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(CACHED_USER_DATA, jsonEncode(userModel.toJson()));
  }
   void deleteUser()async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.clear();

   }

}