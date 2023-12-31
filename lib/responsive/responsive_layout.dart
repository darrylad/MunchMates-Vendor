import 'package:flutter/material.dart';
import 'package:munchmates_vendor/universal.dart';

// this page is now redundant

class ResponsiveLayout extends StatelessWidget {
  // final ColorScheme colorScheme;
  final Widget mobileScaffold;
  final Widget desktopScaffold;

  const ResponsiveLayout({
    super.key,
    // required this.colorScheme,
    required this.mobileScaffold,
    required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    // return LayoutBuilder(builder: (context, constraints) {
    //   if (constraints.maxWidth < 700) {
    //     return mobileScaffold;
    //   } else {
    //     return desktopScaffold;
    //   }
    // });
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return mobileScaffold;
      } else {
        return Row(
          children: [
            const MyDrawer(),
            Expanded(
              child: desktopScaffold,
            ),
          ],
        );
      }
    });
  }
}
