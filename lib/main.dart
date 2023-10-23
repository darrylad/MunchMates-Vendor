import 'package:flutter/material.dart';
import 'package:munchmates_vendor/universal.dart';
import 'package:munchmates_vendor/login_page.dart';
import 'package:munchmates_vendor/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = lightMode.colorScheme;
    return ChangeNotifierProvider(
      create: (context) => PageNotifier(),
      child: MaterialApp(
        title: 'MunchMates Vendor',
        theme: lightMode,
        home: isLoggedin
            ? const MyHomePage()
            : LoginPage(colorScheme: colorScheme),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // switch (selectedIndex) {
    //   case 0:
    //     // page = WelcomePage(
    //     //   onIndexChanged: changeSelectedIndex,
    //     // );
    //     page = const OrdersPage();
    //     break;
    //   case 1:
    //     page = const DashboardPage();
    //     break;
    //   case 2:
    //     page = const RestaurantFoodMenuPage();
    //     break;
    //   default:
    //     throw UnimplementedError('no widget for $selectedIndex');
    // }
    // var mainArea = ColoredBox(
    //   color: colorScheme.background,
    //   child: AnimatedSwitcher(
    //     duration: const Duration(milliseconds: 200),
    //     child: page,
    //   ),
    // );

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        // return MobileScaffold(
        //   colorScheme: colorScheme,
        // );
        return mobileScaffold();
      } else {
        return Row(
          children: [
            const MyDrawer(),
            Expanded(
              child: Consumer<PageNotifier>(
                builder: (context, value, child) {
                  return ColoredBox(
                    color: colorScheme.background,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: value.pageVar,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
    });
  }

  Consumer<PageNotifier> mobileScaffold() {
    return Consumer<PageNotifier>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(value.titleVar),
        ),
        drawer: const MyDrawer(),
        // body: oldColumnWithBottomNavBar(mainArea),
        body: Consumer<PageNotifier>(
          builder: (context, value, child) {
            return ColoredBox(
              color: colorScheme.background,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: value.pageVar,
              ),
            );
          },
        ),
      );
    });
  }

  // Scaffold mobileScaffold1(ColoredBox mainArea) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(title),
  //     ),
  //     drawer: const MyDrawer(),
  //     // body: oldColumnWithBottomNavBar(mainArea),
  //     body: Consumer<PageNotifier>(
  //       builder: (context, value, child) {
  //         return ColoredBox(
  //           color: colorScheme.background,
  //           child: AnimatedSwitcher(
  //             duration: const Duration(milliseconds: 200),
  //             child: value.pageVar,
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Column oldColumnWithBottomNavBar(ColoredBox mainArea) {
  //   return Column(
  //     children: [
  //       Expanded(child: mainArea),
  //       SafeArea(
  //         child: BottomNavigationBar(
  //           elevation: 20,
  //           items: const [
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.local_activity_rounded),
  //               label: 'Orders',
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.star),
  //               label: 'Dashboard',
  //             ),
  //             BottomNavigationBarItem(
  //                 icon: Icon(Icons.menu_open_rounded), label: 'Edit Menu')
  //           ],
  //           currentIndex: selectedIndex,
  //           onTap: (value) {
  //             setState(() {
  //               selectedIndex = value;
  //             });
  //           },
  //         ),
  //       )
  //     ],
  //   );
  // }

  // NavigationRail navigationRail(int selectedIndex, double groupAlignment,
  //     NavigationRailLabelType labelType) {
  //   return NavigationRail(
  //     selectedIndex: selectedIndex,
  //     groupAlignment: groupAlignment,
  //     onDestinationSelected: (int index) {
  //       setState(() {
  //         selectedIndex = index;
  //       });
  //     },
  //     labelType: labelType,
  //     destinations: const <NavigationRailDestination>[
  //       NavigationRailDestination(
  //         icon: Icon(Icons.favorite_border),
  //         selectedIcon: Icon(Icons.favorite),
  //         label: Text('Orders'),
  //       ),
  //       NavigationRailDestination(
  //         icon: Icon(Icons.bookmark_border),
  //         selectedIcon: Icon(Icons.book),
  //         label: Text('Dashboard'),
  //       ),
  //       NavigationRailDestination(
  //         icon: Icon(Icons.star_border),
  //         selectedIcon: Icon(Icons.star),
  //         label: Text('Third'),
  //       ),
  //     ],
  //   );
  // }
}
