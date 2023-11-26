import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:startwithyou/model/product_model.dart';

import '../../model/categorymodel.dart';
import '../../services/home_services.dart';

class HomeViewModel extends GetxController{
   List<CategoriesModel> _categoriesModel = [];
   List<CategoriesModel>get  categoriesModel =>_categoriesModel;
   final ValueNotifier<bool> _loading = ValueNotifier(true);
   ValueNotifier<bool>get loading =>_loading;
   List<ProductModel> _productModelModel = [];
   List<ProductModel>get  productsModel =>_productModelModel;

 HomeViewModel(){
   getCategory();
   getProductsBestSelling();
 }
 Future getCategory()async{
    await HomeServices().getCategories().then((value) {
      _loading.value = true;
      for(int i =0 ;i<value.length; i++){
          _categoriesModel.add(CategoriesModel.fromJson(value[i].data() as dynamic));
          _loading.value = false;
      }
      update();
    });

  }

   Future getProductsBestSelling()async{
     await HomeServices().getProductsBestSelling().then((value) {
       _loading.value = true;
       for(int i =0 ;i<value.length; i++){
         _productModelModel.add(ProductModel.fromJson(value[i].data() as dynamic));
         _loading.value = false;
       }
       update();
     });

   }


}