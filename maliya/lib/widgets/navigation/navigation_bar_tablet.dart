import 'package:flutter/material.dart';
import 'package:maliya/widgets/navigation/navigation_menu.dart';

class NavigationBarTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    NavigationMenu(title: 'Home', isActive: false),
                    NavigationMenu(title: 'About', isActive: false),
                    NavigationMenu(title: 'Contact US', isActive: false),
                    NavigationMenu(title: 'Help', isActive: false),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NavigationMenu(title: 'Sign In', isActive: true),
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
