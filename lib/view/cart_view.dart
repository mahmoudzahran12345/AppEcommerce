import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startwithyou/constant.dart';
import 'package:startwithyou/core/viewmodel/cart_view_model.dart';
import 'package:startwithyou/view/widgets/custom_button.dart';
import 'package:startwithyou/view/widgets/custom_text.dart';

class CartView extends StatelessWidget {


  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Column(
           children: [
             Expanded(
               child: GetBuilder<CartViewModel>(
                 init: Get.put(CartViewModel()),
                 builder: (controller)=> Container(
                   child: ListView.separated(
                       itemBuilder: (context,index){
                         return Container(
                           height: 140,
                           //color: secondColor,
                           child:Row(
                             children: [
                               Container(
                                   height: 200,width: 140,
                                 child: Image.network(controller.cartModel1[index].image as String,fit: BoxFit.fill,),
                                   ),
                               Padding(
                                 padding:  const EdgeInsets.only(left: 30.0,top: 20.0),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     CustomText(text: controller.cartModel1[index].name as String, size: 24, color: secondColor),
                                     CustomText(text: '\$ ${controller.cartModel1[index].price.toString()}' , size: 16, color: primaryColor,),
                                     const SizedBox(height: 20.0,),
                                     Container(
                                       width: 140, height: 30,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10.0),
                                         color: Colors.grey.shade200,
                                       ),
                                       child:  Padding(
                                         padding: EdgeInsets.only(left: 20.0,right: 20.0),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                            GestureDetector(
                                                child: CustomText(text: "+", size: 20, color: secondColor),
                                              onTap: (){controller.increaseQuantity(index);},

                                            ),
                                             CustomText(text: controller.cartModel1[index].quantity.toString(), size: 20, color: secondColor),
                                             GestureDetector(
                                                 onTap: (){
                                                   controller.decreaseQuantity(index);
                                                 },
                                                 child: CustomText(text: "-", size: 20, color: secondColor)),



                                           ],
                                         ),
                                       ),
                                     ),


                                   ],
                                 ),
                               )
                             ],
                           )
                         );
                       },
                       separatorBuilder: (context,index)=>SizedBox(width: double.infinity,height: 15,),
                       itemCount: controller.cartModel1.length),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                    GetBuilder<CartViewModel>(
                      init: Get.find(),
                      builder: (controller)=>
                       Column(
                       children: [
                         CustomText(text: 'TOTAL', size: 12, color: greyColor),
                         CustomText(text: '\$ ${controller.totalPrice}', size: 18, color: primaryColor,fontWeight: FontWeight.bold,),
                       ],
                   ),
                    ),
                   CustomButton(() { }, 140, 60, 'CHECKOUT', 14, Alignment.center)

                 ],
               ),
             )
           ],
         ),
    );
  }
}
