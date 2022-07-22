import 'package:fashion_store/constants/colors.dart';
import 'package:fashion_store/logic/core/view_models/cart_view_model.dart';
import 'package:fashion_store/logic/core/view_models/provider.dart';
import 'package:fashion_store/presentation/screens/new_product_screen.dart';
import 'package:fashion_store/presentation/utility/icon_button_counter.dart';
import 'package:riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fashion_store/presentation/router/navigators.dart';
import 'package:fashion_store/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:fashion_store/data/models/product_model.dart';

class ProductDetailsScreen extends StatefulHookConsumerWidget {
  final ProductModel productModel;
  CartItem cartItem = CartItem(quantity: 1);

  ProductDetailsScreen({
    Key? key,
    required this.cartItem,
    required this.productModel,
  }) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  int? selectedItem;
  onSelect(int index) {
    setState(() {
      selectedItem = index;
    });
  }

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
                  IconBtnWithCounter(
                      icon: const Icon(Icons.shopping_cart_rounded),
                      numOfitem: ref.watch(cartVM).items.length,
                      press: () {
                        navigatePush(
                          context,
                          const CartScreen(),
                        );
                      })
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
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: cartItem.color.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              onSelect(i);
                            },
                            child: selectedItem != null && selectedItem == i
                                ? Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: cartItem.color[i]),
                                      const Positioned(
                                        top: 0,
                                        right: 0,
                                        left: 0,
                                        bottom: 0,
                                        child: Center(
                                            child: Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                        )),
                                      ),
                                    ],
                                  )
                                : CircleAvatar(
                                    backgroundColor: cartItem.color[i]),
                            //  ),
                          );
                        }
                        // )
                        ),
                  ),
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
                child: SizedBox(
                  height: 20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: cartItem.size.length,
                    itemBuilder: (context, i) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                       onTap:  (){
                         onSelect(i);
                  },
                     child: selectedItem != null && selectedItem == i
                          ? Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text(cartItem.size[i]),
                           Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black)
                                  ),

                                )),
                        ],
                      )
                          : Text(cartItem.size[i])),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
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
