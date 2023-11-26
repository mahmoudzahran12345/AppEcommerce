import 'package:get/get.dart';
import 'package:startwithyou/core/viewmodel/auth_view_model.dart';
import 'package:startwithyou/core/viewmodel/profile_view_model.dart';

import '../core/viewmodel/cart_view_model.dart';
import '../core/viewmodel/controll_viewmodel.dart';
import '../core/viewmodel/home_view_model.dart';
import 'local_storage.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() =>  LocalStorage());
    Get.lazyPut(() => ProfileViewModel());





  }


}