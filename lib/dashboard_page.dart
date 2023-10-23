import 'package:flutter/material.dart';
import 'package:munchmates_vendor/theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Dashboard'),
        // ),
        body: Container(
            color: colorScheme.background,
            child: const Center(
              child: Text('Dashboard'),
            )));
  }
}
