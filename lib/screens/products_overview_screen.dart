import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/cart_screen.dart';
import 'package:flutter_shop/widgets/app_drawer.dart';
import 'package:flutter_shop/widgets/badge.dart';
import 'package:flutter_shop/widgets/product_item.dart';
import 'package:flutter_shop/widgets/product_grid.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../providers/cart.dart';

enum FilterOptions { favourites, all }

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavouritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);

    // Scaffold is returning because it is screen and APP BAR AND BODY IS REQUIRED
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              if (value == FilterOptions.favourites) {
                setState(() {
                  _showFavouritesOnly = true;
                });
              } else {
                setState(() {
                  _showFavouritesOnly = false;
                });
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOptions.favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.all,
              ),
              PopupMenuItem(
                child: Text('Cart'),
                value: FilterOptions.all,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, __) => Badge(
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () =>
                      Navigator.pushNamed(context, CartScreen.routeName),
                ),
                value: cart.itemCount.toString(),
                color: Colors.red),
          ),

          // Consumer(child: Badge(child: IconButton(icon: Icons.shopping_cart),0 , color:Colors.red)),
        ],
      ),
      drawer: AppDrawer(),
      // Using Grid View Builder for building long grid ( Performance Effective )
      body: ProductsGrid(_showFavouritesOnly),
    );
  }
}
