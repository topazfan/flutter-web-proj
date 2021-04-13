import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/widgets/navigation/navigation_item.dart';
import 'package:maliya/widgets/navigation/navigation_menu.dart';

class NavigationBarDesktop extends StatefulWidget {
  @override
  _NavigationBarDesktopState createState() => _NavigationBarDesktopState();
}

class _NavigationBarDesktopState extends State<NavigationBarDesktop> {
  // int _selectedIndex = 0;
  List<bool> activeItems = [true, false, false, false];

  setItemActive(int index) {
    for (int i = 0; i < activeItems.length; i++) {
      if (i == index)
        activeItems[i] = true;
      else
        activeItems[i] = false;
    }
    print(activeItems);
  }

  void _onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
    print(index);
    setItemActive(index);
  }

  List<Widget> navBarItems = [];

  @override
  void initState() {
    super.initState();
    //   navBarItems = [
    //     NavigationItem(
    //       title: 'Home',
    //       navigationPath: HomeRoutes,
    //       index: 0,
    //       isActive: activeItems[0],
    //       onPressed: _onItemTapped,
    //     ),
    //     NavigationItem(
    //       title: 'About',
    //       navigationPath: AboutRoutes,
    //       index: 1,
    //       isActive: activeItems[1],
    //       onPressed: _onItemTapped,
    //     ),
    //     NavigationItem(
    //       title: 'Contact US',
    //       index: 2,
    //       isActive: activeItems[2],
    //       onPressed: setItemActive(2),
    //     ),
    //     NavigationItem(
    //       title: 'Help',
    //       index: 3,
    //       isActive: activeItems[3],
    //       onPressed: setItemActive(3),
    //     ),
    //   ];
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
              padding: const EdgeInsets.only(right: 30),
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
                    children: navBarItems,
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
