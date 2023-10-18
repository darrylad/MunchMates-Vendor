import 'package:flutter/material.dart';
import 'package:munchmates_vendor/login_page.dart';
import 'package:munchmates_vendor/theme.dart';

bool isLoggedin = false;

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = lightMode.colorScheme;
    return Drawer(
      width: 170,
      elevation: 16,
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        1,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: colorScheme.surface,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text('Drawer Header')),
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              selectedColor: colorScheme.primary,
              title: const Text('Dashboard'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                setState(() {
                  isLoggedin = false;
                });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage(
                              colorScheme: colorScheme,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
