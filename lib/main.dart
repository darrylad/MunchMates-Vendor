import 'package:flutter/material.dart';
import 'package:munchmates_vendor/constants.dart';
import 'package:munchmates_vendor/login_page.dart';
import 'package:munchmates_vendor/responsive/desktop_scaffold.dart';
import 'package:munchmates_vendor/responsive/mobile_scaffold.dart';
import 'package:munchmates_vendor/responsive/responsive_layout.dart';
import 'package:munchmates_vendor/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var colorScheme = lightMode.colorScheme;
    return MaterialApp(
      title: 'MunchMates Vendor',
      theme: lightMode,
      home: isLoggedin
          ? MyHomePage(
              colorScheme: colorScheme,
            )
          : LoginPage(
              colorScheme: colorScheme,
            ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final ColorScheme colorScheme;
  const MyHomePage({super.key, required this.colorScheme});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ResponsiveLayout(
          mobileScaffold: MobileScaffold(
            colorScheme: lightMode.colorScheme,
          ),
          desktopScaffold: DesktopScaffold(
            colorScheme: lightMode.colorScheme,
          ),
        ),
        Expanded(
          child: DesktopScaffold(
            colorScheme: lightMode.colorScheme,
          ),
        ),
      ],
    );
  }
}
