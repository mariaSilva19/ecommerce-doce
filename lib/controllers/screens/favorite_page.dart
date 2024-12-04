
import 'package:ecommecer/controllers/user_controller.dart';
import 'package:ecommecer/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({super.key });

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: userProvider.favoriteProductsUser(0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<ProductModel>? myFavorites = snapshot.data;
            if (myFavorites!.isEmpty) {
              return const Center(child: Text('Você não tem Favoritos'));
            }
            return ListView.builder(
              itemCount: myFavorites.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myFavorites[index].name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Preço: ${myFavorites[index].price}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Image.asset(
                        myFavorites[index].imagePath,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Text('Você não tem Favoritos');
        },
      ),
    );
  }
}