import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/widgets/navigation/navigation_item.dart';
import 'package:maliya/widgets/navigation/navigation_item_drawer.dart';
import 'package:maliya/widgets/navigation/navigation_menu.dart';

List routeItems = [
  {
    "title": 'Home',
    "navigationPath": HomeRoutes,
  },
  {
    "title": 'About',
    "navigationPath": AboutRoutes,
  },
  {
    "title": 'Help',
  },
];

class NavigationBarDesktop extends StatefulWidget {
  @override
  _NavigationBarDesktopState createState() => _NavigationBarDesktopState();
}

// TODO
class _NavigationBarDesktopState extends State<NavigationBarDesktop> {
  // List<bool> _activeItems = [true, false, false, false];

  // void _setItemActive(int index) {
  //   for (int i = 0; i < _activeItems.length; i++) {
  //     if (i == index)
  //       _activeItems[i] = true;
  //     else
  //       _activeItems[i] = false;
  //   }
  //   print(_activeItems);
  // }
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      print('$index parent');
      _selectedIndex = index;
      // _setItemActive(index);
    });
  }

  List<Widget> _navBarItems = [];

  @override
  void initState() {
    for (int i = 0; i < routeItems.length; i++) {
      var item = routeItems[i];
      Widget widget = NavigationItemDrawer(
        title: item['title'],
        navigationPath: item['navigationPath'],
        index: i,
        selectedIndex: _selectedIndex,
        onPressed: _onItemTapped,
      );
      _navBarItems.add(widget);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text('MALIYA',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _navBarItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NavigationMenu(
                        title: 'Sign In',
                        navigationPath: LoginRoutes,
                        isActive: false,
                        onPressed: () {
                          print("login in");
                        },
                      ),
                      // _registerButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
