import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productItem = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: {'id': productItem.id},
            );
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
          leading: Consumer<Product>(
            builder: (ctx, productItem, child) => IconButton(
              onPressed: () => productItem.toggleFavouriteStatus(),
              icon: Icon(
                productItem.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                size: 20,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () => cart.addItem(
                productItem.id, productItem.price, productItem.title),
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
