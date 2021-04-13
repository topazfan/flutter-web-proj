import 'package:flutter/material.dart';
import 'package:maliya/widgets/navigation/navigation_bar_desktop.dart';
import 'package:maliya/widgets/navigation/navigation_bar_mobile.dart';
import 'package:maliya/widgets/navigation/navigation_bar_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarTablet(),
      // desktop: NavigationBarDesktop(),
    );
  }
}
