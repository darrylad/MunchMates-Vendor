import 'package:flutter/material.dart';
import 'package:munchmates_vendor/theme.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  ColorScheme colorScheme = lightMode.colorScheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Live Orders'),
      // ),
      body: Container(
          color: colorScheme.background,
          child: const Center(
            child: Text('Live Orders'),
          )),
    );
  }
}
