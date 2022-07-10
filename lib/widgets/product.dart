import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/product_detail_screen.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({Key? key}) : super(key: key);

// Taking Product Data from Parent
  final Product productItem;

  const ProductItem(this.productItem);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: {'product-item': productItem});
          },
          child: Image.network(
            productItem.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            productItem.title,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite,
              size: 20,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
          trailing: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.shopping_cart,
              size: 20,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
      ),
    );
  }
}
