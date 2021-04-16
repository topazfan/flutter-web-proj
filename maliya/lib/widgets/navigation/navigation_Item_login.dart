import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/locator.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/services/user/login.dart';
import 'package:maliya/viewmodels/user/user_auth_view_model.dart';
import 'package:maliya/viewmodels/user/user_view_model.dart';
import 'package:maliya/views/templates/navigator_service.dart';

// class NavigationItemLogin extends StatefulWidget {
//   @override
//   _NavigationItemLoginState createState() => _NavigationItemLoginState();
// }

// class _NavigationItemLoginState extends State<NavigationItemLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Consumer(
//         // Rebuild only the Text when counterProvider updates
//         builder: (context, watch, child) {
//           final userAuth = watch(userAuthProvider.state);
//           return Text('$userAuth');
//         },
//       ),
//     );
//   }
// }

// class NavigationItemLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Consumer(
//         builder: (context, watch, child) {
//           // if here use watch(userAuthProvider), when the state changed, This will not change again. because it's not watch the state change.
//           final userAuth = watch(userAuthProvider.state);
//           return Text('$userAuth');
//         },
//       ),
//     );
//   }
// }

class NavigationItemLogin extends StatelessWidget {
  void _logout(Function callback) {
    var result = logout();
    result.then((resp) => {
          print("logout" + resp.toString()),
          if (resp != null && resp.statusCode == 200)
            {
              print('_logout'),
              callback(),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer(
        builder: (context, watch, child) {
          // if here use watch(userAuthProvider), when the state changed, This will not change again. because it's not watch the state change.
          final userAuth = watch(userAuthProvider.state);
          final currentUser = watch(userProvider.state);

          return userAuth != AuthStatus.Authenticated
              ? GestureDetector(
                  onTap: () => {
                    print(userAuth),
                    locator<NavigatorService>().navigatorTo(LoginRoutes),
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          spreadRadius: 10,
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                  ),
                )
              : Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        currentUser == null ? 'Hi' : '${currentUser?.name}',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () => {
                          _logout(context
                              .read(userAuthProvider)
                              .setAuthStatus(AuthStatus.Uninitialized)),
                          print('logout unauth'),
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Sign Out',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
