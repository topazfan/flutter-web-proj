import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigatorTo(String routeName,
      {Map<String, String> queryParameters}) {
    // Future<dynamic> navigatorTo(String routeName, {Object queryParameters}) {
    // if (null != queryParameters) {
    //   routeName =
    //       Uri(path: routeName, queryParameters: queryParameters).toString();
    // }
    // return navigatorKey.currentState
    //     .pushNamed(routeName, arguments: queryParameters);
    if (null != queryParameters) {
      routeName =
          Uri(path: routeName, queryParameters: queryParameters).toString();
    }
    print(routeName);
    return navigatorKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }
}
