import 'package:flutter/material.dart';
import 'package:munchmates_vendor/dashboard_page.dart';
import 'package:munchmates_vendor/login_page.dart';
import 'package:munchmates_vendor/orders_page.dart';
import 'package:munchmates_vendor/restaurant_food_menu_page.dart';
import 'package:munchmates_vendor/theme.dart';
import 'package:provider/provider.dart';

bool isLoggedin = false;
// bool isSelected = false;
Widget page = const OrdersPage();
String title = 'Orders';

class PageNotifier with ChangeNotifier {
  // Widget _page = const OrdersPage();
  Widget _page = page;
  Widget get pageVar => _page;

  String _title = title;
  String get titleVar => _title;

  // set page(Widget newPage) {
  //   _page = newPage;
  //   notifyListeners();
  // }
  void changePage(Widget newPage, String newTitle) {
    _page = newPage;
    _title = newTitle;
    notifyListeners();
  }
}

// Hamburger menu
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
      width: 250,
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
      child: Consumer<PageNotifier>(
        builder: (context, value, child) {
          return drawerContents(colorScheme, value, context);
        },
      ),
    );
  }

  Padding drawerContents(
      ColorScheme colorScheme, PageNotifier value, BuildContext context) {
    return Padding(
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

          const SizedBox(height: 15),
          // tile to go to orders page that shows active and past orders, which is the default page
          drawerListTileMember(
              colorScheme, value, context, 'Live Orders', const OrdersPage()),

          // tile to go to statistics and billing page
          drawerListTileMember(
              colorScheme, value, context, 'Dashboard', const DashboardPage()),

          // tile to go to menu edit page
          drawerListTileMember(colorScheme, value, context, 'Edit Food Menu',
              const RestaurantFoodMenuPage()),

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
    );
  }

  Padding drawerListTileMember(ColorScheme colorScheme, PageNotifier value,
      BuildContext context, String listTitle, Widget destinationPage) {
    bool isSelected = value.pageVar == destinationPage;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        splashColor: colorScheme.primary,
        tileColor: isSelected ? colorScheme.primary : null,
        focusColor: colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        selectedColor: colorScheme.primary,
        title: Text(
          listTitle,
          style: TextStyle(
              color:
                  isSelected ? colorScheme.surface : colorScheme.onBackground),
        ),
        onTap: () {
          value.changePage(destinationPage, listTitle);
          Navigator.pop(context);
        },
      ),
    );
  }
}
