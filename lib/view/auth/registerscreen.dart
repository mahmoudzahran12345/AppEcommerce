import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:startwithyou/core/viewmodel/auth_view_model.dart';
import 'package:startwithyou/view/auth/loginscreen.dart';

import '../../constant.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_media.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textformfeild.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
   RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
             onTap: (){
               Get.offAll(LoginScreen());
             },
            child: const Icon(Icons.arrow_back_ios_new)),
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
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Sign Up', size: 30, color: secondColor,fontWeight: FontWeight.bold),
                  ],
                ),

                const SizedBox(height: 40,),
                CustomTextFormFeild('Name', 'David Spade', (value){
                  controller.name = value;
                },
                        (value){
                      if(value!.isEmpty)
                      {
                        return 'Please enter name';
                      }
                      return null;
                    }),
                const SizedBox(height: 40.0,),
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

                const SizedBox(height: 20.0,),
                CustomButton(() {
                  formKey.currentState?.save();
                  if(formKey.currentState!.validate()){
                    controller.createAccountWithEmailPassword();

                  }
                }, double.infinity, 50, 'SIGN UP', 16, Alignment.center),
                const SizedBox(height: 20.0,),











              ],
            ),
          ),
        ),
      ),
    );
  }
}



