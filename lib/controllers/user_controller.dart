
import 'package:ecommecer/models/product_model.dart';
import 'package:ecommecer/models/user_model.dart';
import 'package:flutter/material.dart';

class UserController with ChangeNotifier {
  List<UserModel> users = [
    UserModel(username: 'Jaique', email: 'maria.silva@gmail.com')
  ];
  void addToCart(String userEmail, ProductModel product) {
    UserModel? user = users.firstWhere((u) => u.email == userEmail);
    if (user.email.isNotEmpty) {
      user.products.add(product);
    }
  }

  void addFavorite(String userEmail, ProductModel product) {
    print("Produto $product");
    UserModel? user = users.firstWhere((u) => u.email == userEmail);
    if (user.email.isNotEmpty) {
      if (!user.favorites.contains(product)) {
        user.favorites.add(product);
      }
    }
  }

  Future<List<ProductModel>> favoriteProductsUser(index) async {
    return users[index].favorites;
  }
}
