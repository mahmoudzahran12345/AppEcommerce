import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startwithyou/core/viewmodel/auth_view_model.dart';
import 'package:startwithyou/view/auth/loginscreen.dart';
import 'package:startwithyou/view/home_screen.dart';

import '../constant.dart';
import '../core/viewmodel/controll_viewmodel.dart';

class ControlView extends GetWidget<AuthViewModel> {
   ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
        (){
          return
            (Get.find<AuthViewModel>().user==null)
              ? LoginScreen()
              :GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
                builder: (controller)=>Scaffold(body: controller.currentScreen,bottomNavigationBar: bottomNavigationBar(),
            ),
              );

        }
    );
  }
  Widget bottomNavigationBar(){
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder:(controller)=> BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top:25.0),
              child: Text('Explore'),
            ),
            label: '',
            icon:Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset('assets/images/icon_explore.png',
                fit: BoxFit.cover,
                width: 20.0,
              ),
            ),


          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text('Cart'),
            ),
            label: '',
            icon:Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset('assets/images/icon_cart.png',
                fit: BoxFit.cover,
                width: 20.0,
              ),
            ),


          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top:25.0),
              child: Text('Account'),
            ),
            label: '',
            icon:Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Image.asset('assets/images/icon_user.png',
                fit: BoxFit.cover,
                width: 20.0,
              ),
            ),

          ),

        ],
        onTap: (index){
          controller.changeSelected(index);

        },
        currentIndex: controller.navigatorValue,
        backgroundColor: Colors.grey.shade50,elevation: 0.0,
        selectedItemColor: primaryColor,

      ),
    );
  }

}
