import 'package:fashion_store/logic/cubits/cart_cubit.dart';
import 'package:flutter/material.dart';

import 'package:fashion_store/presentation/screens/new_product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: NewProductScreen(),
      // ),
    );
  }
}
