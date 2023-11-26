import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startwithyou/constant.dart';
import 'package:startwithyou/core/viewmodel/profile_view_model.dart';
import 'package:startwithyou/view/auth/loginscreen.dart';
import 'package:startwithyou/view/widgets/custom_button.dart';
import 'package:startwithyou/view/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller)=>
       Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left: 10.0,right: 20.0,top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 120,height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child:controller.userModel == null?  Image.asset('assets/images/Avatar.png'):
                        controller.userModel?.pic == "default" ? Image.asset('assets/images/Avatar.png'):
                            NetworkImage(controller.userModel?.pic as String) as dynamic
                      ),
                      /*Column(
                        children: [
                          CustomText(text: controller.userModel?.name as String, size:26 , color: secondColor),
                          const SizedBox(height: 5.0,),
                          CustomText(text: controller.userModel?.email as String, size:26 , color: secondColor),


                        ],
                      )*/
                      CustomButton(() {
                        //print(controller.userModel?.pic);
                        //Get.offAll(LoginScreen());
                      }, 50, 50, 'text', 16, Alignment.center)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),//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
      ),
    );
  }
}
