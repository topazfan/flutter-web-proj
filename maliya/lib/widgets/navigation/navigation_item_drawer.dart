import 'package:flutter/material.dart';
import 'package:maliya/locator.dart';
import 'package:maliya/views/templates/navigator_service.dart';

class NavigationItemDrawer extends StatefulWidget {
  final String title;
  final String navigationPath;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onPressed;
  const NavigationItemDrawer({
    this.title,
    this.navigationPath,
    this.index,
    this.selectedIndex,
    this.onPressed,
  });
  @override
  _NavigationItemDrawerState createState() => _NavigationItemDrawerState();
}

class _NavigationItemDrawerState extends State<NavigationItemDrawer> {
  bool isActive = false;
  void _onTapActive() {
    setState(() {
      if (widget.index == widget.selectedIndex)
        isActive = true;
      else
        isActive = false;
    });
  }

  @override
  void initState() {
    super.initState();
    print('${widget.index} ${widget.selectedIndex} ${isActive} child state');
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // onEnter: (value) {
      //   setState(() {
      //     isActive = true;
      //   });
      // },
      // onExit: (value) {
      //   setState(() {
      //     isActive = false;
      //   });
      // },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () {
            print('${widget.index} ${widget.selectedIndex} ${isActive} child');
            widget.onPressed(widget.index);
            _onTapActive();

            locator<NavigatorService>().navigatorTo(widget.navigationPath);
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

// class NavigationItemDrawer extends StatelessWidget {
//   final String title;
//   final String navigationPath;
//   final int index;
//   final int selectedIndex;
//   final Function onPressed;
//   const NavigationItemDrawer({
//     this.title,
//     this.navigationPath,
//     this.index,
//     this.selectedIndex,
//     this.onPressed,
//   });
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Container();
//   // }
// // }
//   @override
//   Widget build(BuildContext context) {
//     bool isActive = (index == selectedIndex);
//     print(isActive);
//     return MouseRegion(
//       // onEnter: (value) {
//       //   setState(() {
//       //     isActive = true;
//       //   });
//       // },
//       // onExit: (value) {
//       //   setState(() {
//       //     isActive = false;
//       //   });
//       // },
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           splashColor: Colors.white60,
//           onTap: () {
//             locator<NavigatorService>().navigatorTo(navigationPath);
//             print('$index child');
//             onPressed(index);
//           },
//           child: Container(
//             alignment: Alignment.centerLeft,
//             margin: EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: isActive ? Colors.deepPurple : Colors.grey),
//                 ),
//                 SizedBox(height: 6),
//                 isActive
//                     ? Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 12, vertical: 2),
//                         decoration: BoxDecoration(
//                           color: Colors.deepPurple,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       )
//                     : SizedBox(height: 6),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
