import 'package:flutter/material.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/widgets/navigation/navigation_item.dart';
import 'package:maliya/widgets/navigation/navigation_menu.dart';

List<Widget> navBarItems = [
  NavigationItem(
    title: 'Home',
    navigationPath: HomeRoutes,
  ),
  NavigationItem(
    title: 'About',
    navigationPath: AboutRoutes,
  ),
  NavigationItem(
    title: 'Contact US',
  ),
  NavigationItem(
    title: 'Help',
  ),
];

class NavigationBarTablet extends StatelessWidget {
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
