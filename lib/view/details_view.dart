import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startwithyou/constant.dart';
import 'package:startwithyou/core/viewmodel/cart_view_model.dart';
import 'package:startwithyou/model/cart_model.dart';
import 'package:startwithyou/model/product_model.dart';
import 'package:startwithyou/view/widgets/custom_button.dart';
import 'package:startwithyou/view/widgets/custom_text.dart';

class DetailedView extends StatelessWidget {
  ProductModel model;

   DetailedView({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: [
           Container(
             width: MediaQuery.of(context).size.width,
               height: 270,
               color: whiteColor,
               child: Image.network(model.image as String,fit: BoxFit.fill )),
           const SizedBox(height: 10.0,),
           Expanded(
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
                 child: Column(
                   children: [
                      CustomText(text: model.name as String, size: 26, color: secondColor,alignment: Alignment.topLeft,fontWeight: FontWeight.bold,),
                     const SizedBox(height: 15.0,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(30.0),
                             border: Border.all(
                               color: Colors.grey
                             )
                           ),
                           padding: const EdgeInsets.all(16.0),
                           width: MediaQuery.of(context).size.width *0.44,height: 50,
                           child: const Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               CustomText(text: 'Size', size: 14, color: secondColor),
                               SizedBox(width: 30,),
                               CustomText(text: 'XL', size: 16, color: secondColor,fontWeight: FontWeight.bold,)

                             ],
                           ),
                         ),

                         Container(
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30.0),
                               border: Border.all(
                                   color: Colors.grey
                               )
                           ),
                           padding: const EdgeInsets.all(16.0),
                           width: MediaQuery.of(context).size.width *0.44,height: 50,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               const CustomText(text: 'Color', size: 14, color: secondColor),
                               const SizedBox(width: 30,),
                               Container(
                                 width: 40,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(30),
                                   color: model.color
                                 ),
                               )



                             ],
                           ),
                         )

                       ],
                     ),
                     const SizedBox(height: 30.0,),
                     const CustomText(text: 'Details', size: 18, color: secondColor,fontWeight: FontWeight.bold,alignment: Alignment.topLeft,),
                      CustomText(text: model.desc as String, size: 14, color: secondColor,alignment: Alignment.topLeft,height: 2.5,),

                   ],
                 ),
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(top: 30.0,left: 30,right: 15,bottom: 30),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   children: [
                     const CustomText(text: 'PRICE', size: 12, color: greyColor),
                     CustomText(text: model.price as String, size: 18, color: primaryColor,fontWeight: FontWeight.bold,),

                   ],
                 ),
                 GetBuilder<CartViewModel>(
                   init: CartViewModel(),
                     builder: (controller)=>
                     CustomButton(() {
                       controller.addProduct(
                         CartModel(
                            model.image as String ,
                            model.name as String,
                             model.price as String,
                             1,
                             model.productId
                         )
                       );
                     }, 150, 40, 'ADD', 14, Alignment.center))
               ],
             ),
           )


         ],
       ),
    );
  }
}
