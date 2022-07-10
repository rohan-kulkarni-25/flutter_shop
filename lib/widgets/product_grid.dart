import 'package:flutter_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {

  bool showFavourites;

  ProductsGrid(this.showFavourites);

  @override
  Widget build(BuildContext context) {

    final product = Provider.of<Products>(context);
    final productsData = showFavourites ? product.favouriteItems : product.item;

    return GridView.builder(
      // Added Const because this padding will not change ( Performance Effective )
      padding: const EdgeInsets.all(10),
      itemCount: productsData.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: productsData[i],
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
