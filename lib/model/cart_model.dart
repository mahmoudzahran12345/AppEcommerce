import 'package:flutter/cupertino.dart';
import 'package:startwithyou/helper/extenation.dart';

class CartModel{
  String? image, name,productId, price;
 late int quantity;

  CartModel(this.image, this.name,  this.price,this.quantity,this.productId);
  CartModel.fromJson(Map <String , dynamic>map){
    if(map == null){
      return;
    }
    image = map['image'];
    name =map['name'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map ['productId'];
  }
  toJson(){
    return{
      'image': image,
      'name':  name ,
      'price': price ,
       'quantity': quantity,
      'productId':productId
    };

  }
}

