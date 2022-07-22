import 'package:fashion_store/data/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartViewModel extends ChangeNotifier {
  List<CartItem> items = [];
  List<CartItem> get cartItems => items;
  int totalAmount() {
    var total = 0;
    double calculateTotal = 0;
    for (CartItem cartItem in items) {
      calculateTotal += cartItem.productModel!.price * cartItem.quantity;
      total = calculateTotal.toInt();
    }
    return total;
  }


  void addToCart(CartItem cartItem) {
    //if product id existing is false
    bool newProduct = items.any(
        (element) => element.productModel?.id == cartItem.productModel?.id);
    //if the above is true, we will like to add product when its true
    if (!newProduct) {
      var addColor = cartItem.color;
      items.add(cartItem);
      notifyListeners();
    }
  }

  void removeCartItem(CartItem cartItem) {
    items.remove(cartItem);
    notifyListeners();
  }

  void increaseCartItem(CartItem cart) {
    //searches through the ids and to check for equality
    CartItem cartItem = cartItems.firstWhere(
        (element) => element.productModel?.id == cart.productModel?.id);
    //in a list of cartItems lets add the id found as the index and increase the quantity
    cartItems[cartItems.indexOf(cartItem)].quantity++;
    notifyListeners();
  }

  void decreaseCartItem(CartItem cart) {
    //searches through the ids and to check for equality
    CartItem cartItem = cartItems.firstWhere(
        (element) => element.productModel?.id == cart.productModel?.id);
    //in a list of cartItems lets add the id found as the index and decrease the quantity
    cartItems[cartItems.indexOf(cartItem)].quantity--;
    //I want to remove the cart immediately it is 0
    if (cartItems[cartItems.indexOf(cartItem)].quantity == 0) {
      items.remove(cart);
    }
    notifyListeners();
  }
}

class CartItem {
  late ProductModel? productModel;
  late int quantity;
  final List<Color> color = <Color>[
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.black
  ];
  final List<String> size = ['XS', 'S', 'M', 'L','XL'];

  CartItem({this.productModel, required this.quantity});
}
