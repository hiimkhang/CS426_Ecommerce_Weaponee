class Product {
  String image;
  String name;
  String description;
  double price;

  Product(this.image, this.name, this.description, this.price);
}

class Cart {
  Product prod;
  int quantity;

  Cart(this.prod, this.quantity);
}
