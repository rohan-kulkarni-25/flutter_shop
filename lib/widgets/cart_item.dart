import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;

  CartItem(this.id, this.productId, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(id),
      onDismissed: (direction) => product.removeItem(productId),
      background: Container(
        color: Theme.of(context).secondaryHeaderColor.withOpacity(0.1),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                      child: Text(
                    '\$ \n ${price}',
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
              title: Text(title),
              subtitle: Text('Total : \$${price * quantity}'),
              trailing: Text('${quantity} x'),
            ),
          )),
    );
  }
}
