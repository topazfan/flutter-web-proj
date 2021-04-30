import 'package:flutter/material.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/widgets/navigation/navigation_Item_login.dart';
import 'package:maliya/widgets/navigation/navigation_item.dart';

List<Widget> navBarItems = [
  NavigationItem(
    title: 'Home',
    navigationPath: HomeRoutes,
  ),
  NavigationItem(
    title: 'Malis',
    navigationPath: MalisRoutes,
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
    navigationPath: AboutRoutes,
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
                    children: navBarItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NavigationItemLogin(),
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
