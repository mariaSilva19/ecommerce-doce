import 'package:ecommecer/componentes/slide.dart';
import 'package:ecommecer/controllers/product_controller.dart';
import 'package:ecommecer/controllers/screens/favorite_page.dart';
import 'package:ecommecer/controllers/user_controller.dart';
import 'package:ecommecer/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: DrawerHeader(
                child: CircleAvatar(
                  child: Image.asset('assets/avatar.png'),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              subtitle: const Text('Va para o menu'),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              subtitle: const Text('Procure por doces'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Favoritos'),
              subtitle: const Text('Favoritos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Favoritos()),
                );
              },
            ),
            ListTile(
              onTap: () {},
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Carrinho'),
              subtitle: const Text('Veja seu carrinho'),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              subtitle: const Text('Procure por doces'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Favoritos'),
              subtitle: const Text('Favoritos'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Color.fromARGB(255, 202, 151, 211)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 213, 191, 218),
        title: const Text('Crème Brûlée', style: TextStyle(fontSize: 16)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Favoritos()),
              );
            },
            icon: const Icon(Icons.favorite),
            color: const Color.fromARGB(255, 202, 151, 211),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Color.fromARGB(255, 223, 219, 224),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Slide(),
          const Divider(),
          Consumer2<ProductController, UserController>(
            builder: (context, product, userController, child) {
              List<ProductModel> products = product.products;
              return ListView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    padding: const EdgeInsets.all(19.0),
                    width: double.infinity,
                    height: 150.0,
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
                    child: ListTile(
                      leading: SizedBox(
                        width: 100,
                        height: 200,
                        child: Image.asset(
                          products[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(products[index].name),
                      trailing: IconButton(
                        onPressed: () {
                          ProductModel product = ProductModel(
                            name: products[index].name,
                            price: products[index].price,
                            description: products[index].description, 
                            imagePath: products[index].imagePath,
                          );
                          userController.addFavorite('maria.silva@gmail.com', product);
                        },
                        icon: const Icon(Icons.favorite_outline),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0,20,0,20),
            child: Image.asset('assets/gifultimo.gif', width: double.infinity, height: 300,)
          ),
        ],
      ),
    );
  }
}
