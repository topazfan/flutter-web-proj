import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/views/home/home_page.dart';
import 'package:maliya/views/login/login_page.dart';
import 'package:maliya/routes/string_extensions.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // 使用settings.arguments则无法将参数展示到路径地址上,除非做转换
  // var arguments = settings.arguments;
  // print(settings);
  // switch (settings.name) {
  //   case HomeRoutes:
  //     return _getPageRoutes(HomeView(), settings);
  //   case AboutRoutes:
  //     return _getPageRoutes(AboutView(), settings);
  //   case EpisodeRoutes:
  //     return _getPageRoutes(EpisodeView(), settings);
  //   case EpisodeDetailRoutes:
  //     return _getPageRoutes(EpisodeDetail(model: arguments), settings);
  //   case MuaRoutes:
  //     return _getPageRoutes(MuaView(), settings);
  //   default:
  //     return _getPageRoutes(HomeView(), settings);

  // 将参数写入地址栏进行解析
  var routingData = settings.name.getRoutingData;
  print(settings);
  switch (routingData.route) {
    // case SignupRoutes:
    //   return _getPageRoutes(SignupView(), settings);
    case LoginRoutes:
      return _getPageRoutes(LoginPage(), settings);
    case HomeRoutes:
      return _getPageRoutes(HomePage(), settings);
    // case AboutRoutes:
    //   return _getPageRoutes(AboutView(), settings);
    // case EpisodeRoutes:
    //   return _getPageRoutes(EpisodeView(), settings);
    // case EpisodeDetailRoutes:
    //   var id = int.tryParse(routingData['id']);
    //   return _getPageRoutes(EpisodeDetail(id: id), settings);
    // case MuaRoutes:
    //   return _getPageRoutes(MuaView(), settings);
    default:
      return _getPageRoutes(HomePage(), settings);
  }
}

PageRoute _getPageRoutes(Widget child, RouteSettings settings) {
  return FadeRoutes(child: child, routeName: settings.name);
}

class FadeRoutes extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  FadeRoutes({this.child, this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                child,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(opacity: animation, child: child));
}
