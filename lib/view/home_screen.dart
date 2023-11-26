import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startwithyou/constant.dart';
import 'package:startwithyou/core/viewmodel/controll_viewmodel.dart';
import 'package:startwithyou/core/viewmodel/home_view_model.dart';
import 'package:startwithyou/view/cart_view.dart';
import 'package:startwithyou/view/details_view.dart';
import 'package:startwithyou/view/profile_view.dart';

import 'package:startwithyou/view/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  final List <String> names = <String>["men","women","devices","gaming","sss","mmm"];
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller)=>controller.loading.value ? const Center(child: CircularProgressIndicator()): Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 70.0,left: 20.0,right: 20),
            child: Column(
              children: [
                _searchTextFormField(),
                const SizedBox(height: 30.0),
                const CustomText(text: 'Categories', size: 18, color: secondColor,alignment: Alignment.topLeft,),
                const SizedBox(height: 10.0),
                _listViewCategories(),
                const SizedBox(height: 30.0,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Best Selling', size: 18, color: secondColor),
                    CustomText(text: 'See all', size: 16, color: secondColor),

                  ],
                ),
                const SizedBox(height: 30.0,),
                _listViewProducts()

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _searchTextFormField(){
    return   Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey.shade200
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon:Icon(Icons.search,color: secondColor,size: 30,)
        ),
      ),
    );

  }

  Widget _listViewCategories(){
    return  GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller)=> SizedBox(
        height: 100.0,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Column(
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100
                    ),
                    child: Image.network(controller.categoriesModel[index].image as String),
                  ),
                  const SizedBox(height: 20.0,),
                  CustomText(text: controller.categoriesModel[index].name as String, size: 12, color: secondColor)

                  // CustomText(text: text, size: size, color: color)
                ],
              );
            },
            separatorBuilder:(context,index){
              return const SizedBox(width: 10.0,);
            } ,
            itemCount: controller.categoriesModel.length),
      ),
    );
  }


  Widget _listViewProducts(){
    return  GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller)=>SizedBox(
        height: 340.0,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Get.to(DetailedView(model: controller.productsModel[index],));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *.4,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width *.4,
                            height: 250.0,
                            child: Image.network(controller.productsModel[index].image as String ,fit: BoxFit.cover,),

                          ),
                        ],
                      ),
                       CustomText(text: controller.productsModel[index].name as String, size: 16, color: secondColor,alignment: Alignment.bottomLeft),
                       //const SizedBox(height: 5.0,),
                        CustomText(text:controller.productsModel[index].desc as String, size: 12, color: Colors.grey,maxLine: 1,alignment: Alignment.bottomLeft),
                        const SizedBox(height: 10.0,),
                        CustomText(text: '\$ ${controller.productsModel[index].price as String}', size: 12, color: primaryColor,alignment: Alignment.bottomLeft)



                      // CustomText(text: text, size: size, color: color)
                    ],
                  ),
                ),
              );
            },
            separatorBuilder:(context,index){
              return const SizedBox(width: 10.0,);
            } ,
            itemCount: controller.productsModel.length),
      ),
    );
  }




}
