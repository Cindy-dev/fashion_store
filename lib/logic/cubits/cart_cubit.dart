import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit():super(CartState(quantity: 0 ));


  void addToCart()=> emit(CartState(quantity: state.quantity + 1));
}