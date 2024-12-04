import 'package:ecommecer/controllers/product_controller.dart';
import 'package:ecommecer/controllers/screens/home_Page.dart';
import 'package:ecommecer/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build (BuildContext context ){
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => ProductController()),
        
      ],
      child: const MaterialApp(
        title: 'Ecommerce Marias',
        home: HomePage(),
      )

    );
  }
}
 