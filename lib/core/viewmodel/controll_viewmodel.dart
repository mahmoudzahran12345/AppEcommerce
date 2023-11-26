import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:startwithyou/view/cart_view.dart';
import 'package:startwithyou/view/home_screen.dart';
import 'package:startwithyou/view/profile_view.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue = 0;
   Widget _currentScreen = HomeScreen();
   get currentScreen => _currentScreen;

  get navigatorValue =>_navigatorValue;
  void changeSelected(int selectedValue){
    _navigatorValue = selectedValue;
    switch(selectedValue){
      case 0:
        {
          _currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          _currentScreen =  CartView();
          break;
        }
      case 2:
        {
          _currentScreen = const ProfileView();
        }
    }
    update();
  }

}