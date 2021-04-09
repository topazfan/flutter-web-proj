import 'package:flutter/material.dart';
import 'package:maliya/locator.dart';
import 'package:maliya/views/templates/navigator_service.dart';

class NavigationMenu extends StatelessWidget {
  final bool isActive;
  final String title;
  final String navigationPath;
  final dynamic onSelected;

  const NavigationMenu(
      {this.title, this.navigationPath, this.isActive, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        locator<NavigatorService>().navigatorTo(navigationPath),
        onSelected(),
      },
      child: Padding(
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
      ),
    );
  }
}
