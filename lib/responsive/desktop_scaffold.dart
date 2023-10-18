import 'package:flutter/material.dart';

class DesktopScaffold extends StatelessWidget {
  final ColorScheme colorScheme;
  const DesktopScaffold({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: const Text(
          'Dashboard',
          textAlign: TextAlign.left,
        ),
      ),
      body: Container(
        color: colorScheme.background,
      ),
    );
  }
}
