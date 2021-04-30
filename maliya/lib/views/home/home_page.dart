import 'package:flutter/material.dart';
import 'package:maliya/views/home/home_content_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: HomeContentTablet(),
      mobile: Container(),
    );
  }
}
