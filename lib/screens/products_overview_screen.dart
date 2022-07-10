import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/product_item.dart';
import 'package:flutter_shop/widgets/product_grid.dart';
import '../providers/product.dart';

class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Scaffold is returning because it is screen and APP BAR AND BODY IS REQUIRED
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      // Using Grid View Builder for building long grid ( Performance Effective )
      body: ProductsGrid(),
    );
  }
}


