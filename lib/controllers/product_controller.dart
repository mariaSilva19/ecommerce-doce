
import 'package:ecommecer/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductController with ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(
      name: 'Bolo de chocolate',
      price: 200.00,
      description: 'escolha o sabor',
      imagePath: 'assets/bolo.jfif', // Adicione o imagePath aqui
    ),
    ProductModel(
      name: 'cookie',
      price: 7.00,
      description: 'chocolate e outros sabores',
      imagePath: 'assets/cookie.png', // Adicione o imagePath aqui
    ),
    ProductModel(
      name: 'cupcake',
      price: 15.00,
      description: 'escolha o sabor da massa',
      imagePath: 'assets/cupcake.jpg', // Adicione o imagePath aqui
    ),
    ProductModel(
      name: 'donuts',
      price: 12.00,
      description: 'escolha o sabor da cobertura',
      imagePath: 'assets/donuts.jfif', // Adicione o imagePath aqui
    ),
  ];

  List<ProductModel> get products => _products;
}
