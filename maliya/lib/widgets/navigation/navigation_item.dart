import 'package:flutter/material.dart';
import 'package:maliya/locator.dart';
import 'package:maliya/views/templates/navigator_service.dart';

class NavigationItem extends StatefulWidget {
  final String title;
  final String? navigationPath;
  const NavigationItem({
    required this.title,
    this.navigationPath,
  });

  @override
  _NavigationItemState createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isActive = true;
        });
      },
      onExit: (value) {
        setState(() {
          isActive = false;
        });
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () {
            locator<NavigatorService>().navigatorTo(widget.navigationPath!);
            // widget.onPressed(widget.index);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isActive ? Colors.deepPurple : Colors.grey),
                ),
                SizedBox(height: 6),
                isActive
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      )
                    : SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
