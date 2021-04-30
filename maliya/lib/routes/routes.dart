import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/global/local_storage.dart';
import 'package:maliya/global/session_manager.dart';
import 'package:maliya/locator.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/viewmodels/user/user_auth_view_model.dart';
import 'package:maliya/views/about/about_page.dart';
import 'package:maliya/views/home/home_page.dart';
import 'package:maliya/views/login/login_page.dart';
import 'package:maliya/routes/string_extensions.dart';
import 'package:maliya/views/malis/malis_page.dart';
import 'package:maliya/views/unknown/unknown.dart';

Route<dynamic> unknownRoute(RouteSettings? settings) {
  switch (settings?.name) {
    case UnknownRoutes:
    default:
      return _getPageRoutes(UnknownPage(), settings!);
  }
}

Route<dynamic> generateRoute(RouteSettings? settings) {
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
  var routingData = settings!.name!.getRoutingData;
  print(settings);

  switch (routingData.route) {
    // case SignupRoutes:
    //   return _getPageRoutes(SignupView(), settings);
    case LoginRoutes:
      return _getPageRoutes(LoginPage(), settings);
    case RootRoutes:
    case HomeRoutes:
      return _getPageRoutes(HomePage(), settings);
    case AboutRoutes:
      return _getPageRoutes(AboutPage(), settings);
    case MalisRoutes:
      return _getPageRoutes(MalisPage(), settings);
    // case EpisodeRoutes:
    //   return _getPageRoutes(EpisodeView(), settings);
    // case EpisodeDetailRoutes:
    //   var id = int.tryParse(routingData['id']);
    //   return _getPageRoutes(EpisodeDetail(id: id), settings);
    // case MuaRoutes:
    //   return _getPageRoutes(MuaView(), settings);
    case UnknownRoutes:
    default:
      return _getPageRoutes(UnknownPage(), settings);
  }
}

PageRoute _getPageRoutes(Widget child, RouteSettings settings) {
  return FadeRoutes(
      child: FutureBuilder<String>(
        initialData: null,
        future: locator<SessionManager>().get('login_status'),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return child;
          } else {
            return LoginPage();
          }
        },
      ),
      routeName: settings.name);

//   return FadeRoutes(
//       child: Consumer(
//         child: child,
//         builder: (context, watch, child) {
//           // return child;
//           // login auth control
//           // final userAuth = watch(userAuthProvider);
//           // print('routes : ${userAuth.state}');
//           // if (userAuth.state == AuthStatus.Authenticated) {
//           //   return child;
//           // } else {
//           //   return LoginPage();
//           // }
//           String loginCheck = locator<SessionManager>().get('login_status');
//           if (loginCheck != null) {
//             return child;
//           } else {
//             return LoginPage();
//           }

//           // if (userAuth == AuthStatus.Authenticated) {
//           //   print(1);
//           //   return child;
//           // } else if (userAuth == AuthStatus.Uninitialized) {
//           //   print(2);
//           //   return LoginPage();
//           //   // } else if (userAuth == AuthStatus.Authenticating) {
//           //   //   print(3);
//           //   //   return Center(child: const CircularProgressIndicator());
//           // } else if (userAuth == AuthStatus.Unauthenticated) {
//           //   print(4);
//           //   return Center(child: Text('User auth failed! Please login'));
//           // } else {
//           //   print(5);
//           //   return LoginPage();
//           //   // return Center(child: Text('Not Authenticated!'));
//           // }
//         },
//       ),
//       routeName: settings.name);
}

class FadeRoutes extends PageRouteBuilder {
  final Widget child;
  final String? routeName;

  FadeRoutes({required this.child, this.routeName})
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
