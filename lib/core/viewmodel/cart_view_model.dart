import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:startwithyou/services/database/cart_database_helper.dart';

import '../../constant.dart';
import '../../model/cart_model.dart';

class CartViewModel extends GetxController {

  final ValueNotifier<bool> _loading = ValueNotifier(true);

  ValueNotifier<bool> get loading => _loading;
  List<CartModel> _cartModel = [];

  List<CartModel> get cartModel1 => _cartModel;
  double _totalPrice = 0.0;
  double get totalPrice =>_totalPrice;
  var dbHelper = CartDatabaseHelper.db;




  CartViewModel() {
    getAllProduct();



  }

  addProduct(CartModel? cartModel) async {
    if (_cartModel.isEmpty) {
      var dbHelper = CartDatabaseHelper.db;
      await dbHelper.insert(cartModel!);
      _cartModel.add(cartModel);
    } else {
      for (int i = 0; i < _cartModel.length; i++) {
        if (_cartModel[i].productId == cartModel?.productId) {
          return Get.snackbar('Error add ', 'The Product is already exist',
              colorText: secondColor,
              snackPosition: SnackPosition.BOTTOM
          );
        }
        var dbHelper = CartDatabaseHelper.db;
        await dbHelper.insert(cartModel!);
        _cartModel.add(cartModel);
        _totalPrice = (double.parse(cartModel.price! )* cartModel.quantity);

      }
    }

    update();
  }
  getTotalPrice(){
    for(int i = 0 ; i<_cartModel.length ; i++ ){
      _totalPrice += (double.parse(_cartModel[i].price! )* _cartModel[i].quantity);

      print(_totalPrice);
      print(_totalPrice.runtimeType);
      update();
          
    }
  }

  getAllProduct() async {
    _loading.value = true;
    _cartModel = await dbHelper.getAllProduct();
    print(_cartModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }
  increaseQuantity(int index)async{
    _cartModel[index].quantity++;
    _totalPrice += (double.parse(_cartModel[index].price! ));
    await dbHelper.updateProduct(_cartModel[index]);
    update();

  }
  decreaseQuantity(int index)async{
    _cartModel[index].quantity--;
    _totalPrice -= (double.parse(_cartModel[index].price! ));
   await dbHelper.updateProduct(_cartModel[index]);
    update();

  }


}
