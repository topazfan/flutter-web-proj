import 'package:flutter/material.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/widgets/navigation/navigation_menu.dart';

class NavigationBarTablet extends StatelessWidget {
  List<bool> itemList = [false, false, false, true];

  setItemList(int index) {
    for (int i = 0; i < itemList.length; itemList.length) {
      if (i == index) {
        itemList[i] = true;
      } else {
        itemList[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  children: [
                    NavigationMenu(
                        title: 'Home',
                        navigationPath: HomeRoutes,
                        isActive: itemList[0],
                        onSelected: setItemList(0)),
                    NavigationMenu(
                        title: 'About',
                        navigationPath: AboutRoutes,
                        isActive: itemList[1],
                        onSelected: setItemList(1)),
                    NavigationMenu(
                        title: 'Contact US',
                        isActive: itemList[2],
                        onSelected: setItemList(2)),
                    NavigationMenu(
                        title: 'Help',
                        isActive: itemList[3],
                        onSelected: setItemList(3)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NavigationMenu(
                        title: 'Sign In',
                        navigationPath: LoginRoutes,
                        isActive: itemList[4],
                        onSelected: setItemList(4)),
                    // _registerButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
