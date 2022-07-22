import 'package:fashion_store/logic/core/view_models/cart_view_model.dart';
import 'package:fashion_store/presentation/router/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../constants/colors.dart';
import '../../logic/core/view_models/provider.dart';
import '../../logic/cubits/cart_cubit.dart';

class CartScreen extends StatefulHookConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(cartVM);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => navigateBack(context),
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: viewModel.cartItems.isEmpty
          ? const Center(
              child: Text('your cart is empty'),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              child: ListView.builder(
                  itemCount: viewModel.cartItems.length,
                  itemBuilder: (context, i) {
                    final item = viewModel.cartItems[i];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(state.quantity.toString()),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .15,
                          decoration: BoxDecoration(
                            color: AppColors.rowTextColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor:
                                      AppColors.containerTransparent,
                                  child: Image.asset(viewModel
                                      .cartItems[i].productModel!.image),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      viewModel.cartItems[i].productModel!.name,
                                      textAlign: TextAlign.center,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              ref
                                                  .read(cartVM)
                                                  .decreaseCartItem(item);
                                            },
                                            icon: const Icon(Icons.remove)),
                                        Text(viewModel.cartItems[i].quantity
                                            .toString()),
                                        IconButton(
                                            onPressed: () {
                                              ref
                                                  .read(cartVM)
                                                  .increaseCartItem(item);
                                            },
                                            icon: const Icon(Icons.add)),
                                        Text(
                                            '\$ ${item.quantity * item.productModel!.price}'),
                                      ],
                                    )
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      ref.read(cartVM).removeCartItem(item);
                                    },
                                    icon: const Icon(Icons.cancel_outlined))
                              ]),
                        ),
                      ],
                    );
                  }),
            ),
      persistentFooterButtons: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.rowTextColor,
              border: Border.all(color: AppColors.borderColor)),
          child: Text(
            'Total Amount : \$ ${ref.watch(cartVM).totalAmount()}',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
