import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/locator.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/viewmodels/user/user_auth_view_model.dart';
import 'package:maliya/views/login/login_page.dart';
import 'package:maliya/views/templates/layout_template.dart';
import 'package:maliya/views/templates/navigator_service.dart';

// class BodyTemplate extends ConsumerWidget {
//   final Widget child;

//   const BodyTemplate({Key key, this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context, watch) {
//     final userAuth = watch(userAuthProvider.state);

//     return Container(
//       // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//       alignment: Alignment.topCenter,
//       // 限制整体页面的最大宽度
//       // child: ConstrainedBox(
//       //   constraints: BoxConstraints(maxWidth: 1200),
//       //   child: child,
//       // ),
//       // child: child,
//       child: userAuth == AuthStatus.Uninitialized
//           ? LoginPage()
//           // locator<NavigatorService>().navigatorTo(LoginRoutes)
//           : (userAuth == AuthStatus.Authenticating
//               ? Center(child: const CircularProgressIndicator())
//               : (userAuth == AuthStatus.Unauthenticated
//                   ? Center(child: Text('User auth failed! Please login'))
//                   : (userAuth == AuthStatus.Authenticated
//                       ? child
//                       : Center(child: Text('Auth status not exists'))))),
//       decoration: new BoxDecoration(color: Colors.green[50]),
//     );
//   }
// }

class BodyTemplate extends StatelessWidget {
  final Widget child;

  const BodyTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      alignment: Alignment.topCenter,
      // 限制整体页面的最大宽度
      // child: ConstrainedBox(
      //   constraints: BoxConstraints(maxWidth: 1200),
      //   child: child,
      // ),
      child: child,
      decoration: new BoxDecoration(color: Colors.green[50]),
    );
  }
}
