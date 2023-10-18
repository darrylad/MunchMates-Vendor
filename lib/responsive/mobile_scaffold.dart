import 'package:flutter/material.dart';

class MobileScaffold extends StatelessWidget {
  final ColorScheme colorScheme;
  const MobileScaffold({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('MunchMates Vendor'),
      ),
      body: Container(
        color: colorScheme.surface,
      ),
    );
  }
}
