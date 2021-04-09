import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/routes/routes.dart';
import 'package:maliya/views/home/home_page.dart';
import 'package:maliya/views/templates/layout_template.dart';
import 'package:maliya/views/templates/navigator_service.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maliya',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        textTheme: GoogleFonts.secularOneTextTheme(),
      ),
      builder: (context, child) => LayoutTemplate(child: child),
      navigatorKey: locator<NavigatorService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoutes,
      // home: HomePage(),
    );
  }
}
