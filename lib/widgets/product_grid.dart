import 'package:flutter_shop/widgets/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './../models/product.dart';
import './../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    print(productsData);
    return GridView.builder(
      // Added Const because this padding will not change ( Performance Effective )
      padding: const EdgeInsets.all(10),
      itemCount: 5,
      itemBuilder: (ctx, i) => ProductItem(productsData.item[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}