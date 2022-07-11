import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_shop/providers/products_provider.dart';
import 'package:flutter_shop/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String productId;

  UserProductItem(this.title, this.imageUrl, this.productId);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      elevation: 5,
      child: ListTile(
        title: Text(this.title),
        leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName,
                      arguments: productId);
                },
                icon: Icon(Icons.edit, color: Theme.of(context).primaryColor),
              ),
              IconButton(
                onPressed: () => {
                  Provider.of<Products>(context, listen: false)
                      .removeProduct(productId)
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
