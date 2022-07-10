import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/providers/products_provider.dart';
import 'package:flutter_shop/screens/cart_screen.dart';
import 'package:flutter_shop/screens/product_detail_screen.dart';
import 'package:flutter_shop/screens/products_overview_screen.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ], 
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          secondaryHeaderColor: Colors.limeAccent,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen()
        },
      ),
    );
  }
}
