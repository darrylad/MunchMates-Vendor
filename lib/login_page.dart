import 'package:flutter/material.dart';
import 'package:munchmates_vendor/constants.dart';

import 'package:munchmates_vendor/main.dart';

class LoginPage extends StatefulWidget {
  final ColorScheme colorScheme;
  const LoginPage({super.key, required this.colorScheme});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.background,
          title: Text('MucnhMates Vendor',
              style: TextStyle(
                color: colorScheme.primary,
              )),
          elevation: 0,
          centerTitle: false,
        ),
        body: Center(
          child: loginBox(colorScheme, context),
        ));
  }

  Container loginBox(ColorScheme colorScheme, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 400,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Login', style: TextStyle(fontSize: 30)),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLoggedin = true;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                    colorScheme: colorScheme,
                                  )));
                    },
                    child: const Text('Next')),
              ],
            ),
          ),
        ));
  }
}
