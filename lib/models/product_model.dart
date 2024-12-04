class ProductModel{
  String name;
  double price;
  String description;
  String imagePath;
  

  ProductModel({required this.name, required this.price, required this.description, required this.imagePath});

  @override
  String toString(){
    return "Name: $name Imagem: $imagePath";
  }
}


