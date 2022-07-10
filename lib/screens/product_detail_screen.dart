import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_shop/providers/product.dart';
import 'package:flutter_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // const ProductDetailScreen({Key? key}) : super(key: key);

  static String routeName = '/product-detail-screen';

  // late Product productItem;

  // ProductDetailScreen(this.productItem);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final productId = args['id'];
    final productItem =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(productItem.title),
      ),
      body: Center(
        child: Text(productItem.description.toString()),
      ),
    );
  }
}
