import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_shop/screens/orders_screen.dart';
import 'package:flutter_shop/screens/products_overview_screen.dart';
import 'package:flutter_shop/screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text('Hello Friends!'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          title: Text('Shop'),
          leading: Icon(Icons.shop),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          title: Text('Orders'),
          leading: Icon(Icons.shopping_cart),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrdersScreeen.routeName);
          },
        ),
        ListTile(
          title: Text('Products'),
          leading: Icon(Icons.subject),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductScreen.routeName);
          },
        ),
      ]),
    );
  }
}
