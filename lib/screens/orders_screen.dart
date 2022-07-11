import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/orders.dart';
import 'package:flutter_shop/widgets/app_drawer.dart';
import 'package:flutter_shop/widgets/order_item.dart' as ODI;
import 'package:provider/provider.dart';

class OrdersScreeen extends StatelessWidget {
  static String routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) => ODI.OrderItem(orderdata.orders[index]),
        itemCount: orderdata.orders.length,
      ),
    );
  }
}
