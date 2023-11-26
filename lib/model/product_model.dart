import 'package:flutter/cupertino.dart';
import 'package:startwithyou/helper/extenation.dart';

class ProductModel{
 String? image, name, productId ,desc ,sized , price;
 Color? color;

 ProductModel(
      this.image, this.name, this.desc, this.color, this.sized, this.price,this.productId);
 ProductModel.fromJson(Map <dynamic , dynamic>map){
   if(map == null){
     return;
   }
   image = map['image'];
   name =map['name'];
   desc =map['desc'];
   color = HexColor.fromHex(map['color']);
   sized = map['sized'];
   price = map['price'] ;
   productId = map['productId'];
 }
 toJson(){
   return{
   image : 'image',
   name : 'name',
   desc : 'desc',
   color : 'color',
   sized : 'sized',
   price : 'price',
   productId : 'productId',
   };

 }
}