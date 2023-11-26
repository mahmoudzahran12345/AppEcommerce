import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:startwithyou/constant.dart';
import 'package:startwithyou/model/cart_model.dart';

class CartDatabaseHelper{
  CartDatabaseHelper._();
  static final CartDatabaseHelper db =   CartDatabaseHelper._();
  static Database? _database;
  Future<Database?> get database async {
      if(_database != null){
        return _database;
      }
      _database = await initDB();
      return _database;

  }

  initDB() async {
    String path = join( await getDatabasesPath(),'CartProduct.db');
    return await openDatabase(path,version: 1,
    onCreate: (Database db , int version) async{
      await db.execute('''
      CREATE TABLE $tableCartProduct (
       $columnName TEXT NOT NULL,
       $columnImage TEXT NOT NULL,
       $columnQuantity INTEGER NOT NULL,
       $columnPrice TEXT NOT NULL,
       $columnProductId TEXT NOT NULL)
      ''');
    }
    );
  }
  Future<void> insert( CartModel model) async{
    var dbClient = await database;
    await dbClient!.insert(tableCartProduct,(model.toJson()) ,
    conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
 Future<List<CartModel>> getAllProduct()async{
    var dbClient = await database;
    List<Map>? maps = await dbClient?.query(tableCartProduct);

    List<CartModel> list = maps!.isNotEmpty ? maps.map((e)  => CartModel.fromJson(e as Map<String, dynamic>) ).toList()
        :[];
    return list;
  }
  updateProduct(CartModel model)async{
    var dbClient = await database;
    return await dbClient?.update(tableCartProduct, model.toJson(),
    where: '$columnProductId = ?',whereArgs: [model.productId]
    );

  }

}