import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:startwithyou/view/auth/loginscreen.dart';
import 'package:startwithyou/view/controll_veiw.dart';

import 'core/viewmodel/cart_view_model.dart';
import 'helper/binding.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSans',

        useMaterial3: true,
      ),
      home:  Scaffold(
        body:ControlView() ,
      ),
    );
  }
}
// mvvm  Model View ViewModel;
// firebase
// Gitx

