import 'package:fashion_store/constants/colors.dart';
import 'package:fashion_store/logic/core/view_models/cart_view_model.dart';
import 'package:fashion_store/logic/core/view_models/provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fashion_store/presentation/router/navigators.dart';
import 'package:fashion_store/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:fashion_store/data/models/product_model.dart';

class ProductDetailsScreen extends StatefulHookConsumerWidget {
  final ProductModel productModel;
  CartItem? cartItem = CartItem();

  ProductDetailsScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 46, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => navigateBack(context),
                  icon: const Icon(Icons.arrow_back)),
              Text(
                widget.productModel.name,
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        navigatePush(context, const CartScreen());
                      },
                      icon: const Icon(
                        Icons.shopping_bag,
                        color: AppColors.rowTextColor,
                      )),
                ],
              )
            ],
          ),
          Container(
            height: 410,
            width: 261,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.productModel.image),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'color',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: const [
                    CircleAvatar(),
                    SizedBox(width: 5),
                    CircleAvatar(),
                    SizedBox(width: 5),
                    CircleAvatar(),
                    SizedBox(width: 20)
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 2,
            color: AppColors.borderColor,
            endIndent: 25,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  'size',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('XS'),
                    Text('S'),
                    Text('M'),
                    Text('L'),
                    Text('XL'),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              ref.read(cartVM).addToCart(
                  CartItem(productModel: widget.productModel, quantity: 1));
              navigatePush(context, const CartScreen());
            },
            child: Container(
              margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
              height: 45,
              width: 315,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_cart),
                    Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 16),
                    )
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
