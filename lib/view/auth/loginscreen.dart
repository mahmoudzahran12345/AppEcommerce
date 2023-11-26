import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:startwithyou/constant.dart';
import 'package:startwithyou/core/viewmodel/auth_view_model.dart';
import 'package:startwithyou/view/auth/registerscreen.dart';
import 'package:startwithyou/view/widgets/custom_button.dart';
import 'package:startwithyou/view/widgets/custom_button_media.dart';
import 'package:startwithyou/view/widgets/custom_text.dart';
import 'package:startwithyou/view/widgets/custom_textformfeild.dart';

class LoginScreen extends GetWidget<AuthViewModel> {

   LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 16.0,
            right: 15.0,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: 'Welcome,', size: 30, color: secondColor,fontWeight: FontWeight.bold),
                    InkWell(
                        onTap: (){
                           Get.to(RegisterScreen());
                        },
                        child: const CustomText(text: 'sign', size: 18, color: primaryColor))
                  ],
                ),
                const SizedBox(height: 10,),
                const CustomText(text: ' Sign in to Continue', size: 14, color: greyColor,alignment: Alignment.topLeft),
                const SizedBox(height: 30,),
                CustomTextFormFeild('Email', 'iamdavid@gmail.com', (value){
                  controller.email = value;
                },
                        (value){
                          if(value!.isEmpty)
                          {
                            return 'Please enter email';
                          }
                          return null;
                }),
                const SizedBox(height: 40.0,),
                CustomTextFormFeild('Password', '*************',
                        (value){
                  controller.password = value;
                        },
                        (value){
                          if(value!.isEmpty)
                          {
                            return 'Please enter password';
                          }
                          return null;

                        }),
                const SizedBox(height: 10,),
                const CustomText(text: ' Forgot Password?',
                 size: 14, color: secondColor,alignment: Alignment.topRight),
                const SizedBox(height: 20.0,),
                CustomButton(() {
                  formKey.currentState?.save();
                  if(formKey.currentState!.validate()){
                    controller.signInWithEmailPassword();
                  }
                }, double.infinity, 50, 'SIGN IN', 16, Alignment.center),
                const SizedBox(height: 20.0,),
                const CustomText(text: '-OR-', size: 18, color: secondColor),
                const SizedBox(height: 40.0,),
                CustomButtonMedia(() {
                  controller.facebookSignMethod();

                }, double.infinity, 50,'Sign In with Facebook' , 14, Alignment.center, 'assets/images/facebookicon.png'),
                const SizedBox(height: 20.0,),
                CustomButtonMedia(() {
                  controller.googleSignMethod();
                }, double.infinity, 50,'Sign In with Google' , 14, Alignment.center, 'assets/images/googleicon.png'),











              ],
            ),
          ),
        ),
      ),
    );
  }
}
// GET X
// state management
// routing
// dependency injection