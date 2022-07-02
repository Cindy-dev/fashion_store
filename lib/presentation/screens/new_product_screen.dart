import 'package:fashion_store/constants/colors.dart';
import 'package:fashion_store/data/data_providers/product_provider.dart';
import 'package:fashion_store/presentation/router/navigators.dart';
import 'package:fashion_store/presentation/screens/product_details_screen.dart';
import 'package:fashion_store/presentation/utility/row_text.dart';
import 'package:flutter/material.dart';
import '../../constants/text.dart';


class NewProductScreen extends StatelessWidget {
  const NewProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(130, 46, 123, 50),
            child: Text(
              newProductText1,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              rowText(newProductRowText1, AppColors.borderColor),
              rowText(newProductRowText2, AppColors.rowTextColor),
              rowText(newProductRowText3, AppColors.rowTextColor),
              rowText(newProductRowText4, AppColors.rowTextColor),
              rowText(newProductRowText5, AppColors.rowTextColor),
            ],
          ),
          Expanded(
              child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 2 * 100,
                crossAxisCount: 2,
                crossAxisSpacing: 0.2,
                mainAxisSpacing: 10),
            itemCount: productList.length,
            itemBuilder: (context, i) => Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => navigatePush(context,
                        ProductDetailsScreen(productModel: productList[i])),
                    child: Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                productList[i].image,
                              ),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  productList[i].name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 2),
                Text(
                  '\$${productList[i].price}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Explore More',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward))
            ],
          ),
        ],
      ),
    );
  }
}
