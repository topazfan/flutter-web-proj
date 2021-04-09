import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  final bool isActive;
  final String title;

  const NavigationMenu({this.title, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 45),
      child: Column(
        children: [
          Text(
            '$title',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.deepPurple : Colors.grey),
          ),
          SizedBox(height: 6),
          isActive
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
              : SizedBox(height: 6),
        ],
      ),
    );
  }
}
