import 'package:fashion_store/data/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartViewModel extends ChangeNotifier {
  List<CartItem> items = [];
  List<CartItem> get cartItems => items;


  void addToCart(CartItem cartItem) {
    items.add(cartItem);
    notifyListeners();
  }

  void removeCartItem(CartItem cartItem){
    items.remove(cartItem);
    notifyListeners();
  }

  void increaseCartItem(CartItem cartItem){

  }

  void decreaseCartItem(CartItem cartItem){

  }
}

class CartItem {
  ProductModel? productModel;
  int? quantity;

  CartItem({this.productModel, this.quantity});
}
