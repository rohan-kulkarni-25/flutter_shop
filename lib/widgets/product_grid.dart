import 'package:flutter_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).item;
    return GridView.builder(
      // Added Const because this padding will not change ( Performance Effective )
      padding: const EdgeInsets.all(10),
      itemCount: productsData.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (context) => productsData[i],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
