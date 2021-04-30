import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/global/session_manager.dart';
import 'package:maliya/locator.dart';
import 'package:maliya/models/user_model.dart';
import 'package:maliya/routes/route_names.dart';
import 'package:maliya/services/user/login.dart';
import 'package:maliya/viewmodels/user/user_auth_view_model.dart';
import 'package:maliya/viewmodels/user/user_login_view_model.dart';
import 'package:maliya/viewmodels/user/user_view_model.dart';
import 'package:maliya/views/templates/navigator_service.dart';
import 'package:maliya/widgets/dialog/show_dialog.dart';
import 'package:tuple/tuple.dart';

class LoginForm extends ConsumerWidget {
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context, watch) {
    String _name = '';
    String _password = '';
    final _loginFormKey = GlobalKey<FormState>();

    // final userAuth = watch(userAuthProvider.state);
    // final currentUser = context.read(userProvider);

    final userAuth = watch(userAuthProvider.notifier);
    final currentUser = watch(userProvider.notifier);
    AuthStatus authStatus = watch(userAuthProvider);
    UserModel currentUserModel = watch(userProvider);

    // TODO why only get ''?
    final userLogin = watch(userLoginProvider(Tuple2(_name, _password)));

    _login() {
      if (_loginFormKey.currentState!.validate()) {
        _loginFormKey.currentState!.save();
      }
      // userLogin.when(
      //     data: (data) => {
      //           if (data != null && data.statusCode == 200)
      //             {
      //               context
      //                   .read(userAuthProvider)
      //                   .setAuthStatus(AuthStatus.Authenticated),
      //               print('set'),
      //               currentUser.setCurrentUser(
      //                   {"id": 111, "name": "test", "email": "test@eamil.com"}),
      //               print('login1  ${userAuth}'),
      //             },
      //           print('login data  ${userAuth}'),
      //         },
      //     loading: () => {
      //           context
      //               .read(userAuthProvider)
      //               .setAuthStatus(AuthStatus.Authenticating),
      //           print('login loading  ${userAuth}'),
      //         },
      //     error: (data, error) => {
      //           context
      //               .read(userAuthProvider)
      //               .setAuthStatus(AuthStatus.Unauthenticated),
      //           print('login error  ${userAuth}'),
      //           // print('login error : $data'),
      //         });
      // context.read(userAuthProvider).setAuthStatus(AuthStatus.Authenticating);
      userAuth.setAuthStatus(AuthStatus.Authenticating);

      var result = login(_name, _password);
      result
          .then((value) => {
                print("login" + value.toString()),
                if (value != null && value.statusCode == 200)
                  {
                    userAuth.setAuthStatus(AuthStatus.Authenticated),
                    print('login sucess'),
                    currentUser.setCurrentUser(
                        {"id": 111, "name": "test", "email": "test@eamil.com"}),
                    locator<SessionManager>()
                        .save('login_status', jsonEncode(value.data)),
                    locator<NavigatorService>().navigatorTo(HomeRoutes),
                  }
              })
          .catchError((error) => {
                print('login error'),
                userAuth.setAuthStatus(AuthStatus.Unauthenticated),
                showAlertDialog(context, "Alert",
                    "user name or password incorrect, Please try again!")
              });
    }

    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter eamil or phone number',
              fillColor: Colors.blueGrey[100],
              filled: true,
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.blueGrey[100]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.yellow),
              ),
            ),
            onChanged: (value) => _name = value,
          ),
          SizedBox(height: 40),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              counterText: 'Forgot password?',
              suffixIcon:
                  Icon(Icons.visibility_off_outlined, color: Colors.grey),
              fillColor: Colors.blueGrey[100],
              filled: true,
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.blueGrey[100]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.yellow),
              ),
            ),
            onChanged: (value) => _password = value,
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  spreadRadius: 10,
                  color: Colors.grey[100]!,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () => _login(),
              child: Container(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: authStatus != AuthStatus.Authenticating
                      ? Text('Sign In')
                      : CircularProgressIndicator(),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Divider(
                  height: 50,
                  color: Colors.grey[100],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
