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
  _CartScreenState createState() => _CartScreenState();
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
                                  radius: 30,
                                  backgroundColor:
                                      AppColors.containerTransparent,
                                  backgroundImage: AssetImage(viewModel
                                      .cartItems[i].productModel!.image),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(viewModel
                                        .cartItems[i].productModel!.name),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.remove)),
                                        Text(viewModel.cartItems[i].quantity
                                            .toString()),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.add)),
                                      ],
                                    )
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      final item = viewModel.cartItems[i];
                                      ref.read(cartVM).removeCartItem(item);
                                    },
                                    icon: const Icon(Icons.cancel_outlined))
                              ]),
                        ),
                      ],
                    );
                  }),
            ),
      // Container(
      //   alignment: Alignment.center,
      //   child: Text(
      //     '${viewModel.cartItems[i].quantity! * viewModel.cartItems[i].productModel!.price}',
      //   ),
      // )
      // persistentFooterButtons: [
      //
      // ],
    );
  }
}
