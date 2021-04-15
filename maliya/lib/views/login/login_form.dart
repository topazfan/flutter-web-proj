import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/services/user/login.dart';
import 'package:maliya/viewmodels/user/user_auth_view_model.dart';
import 'package:maliya/viewmodels/user/user_view_model.dart';

class LoginForm extends ConsumerWidget {
  @override
  Widget build(Object context, watch) {
    var _name = '';
    var _password = '';
    final _loginFormKey = GlobalKey<FormState>();

    final userAuth = watch(userAuthProvider);
    final currentUser = watch(userProvider);

    _login() {
      userAuth.setAuthStatus(AuthStatus.Authenticating);
      if (_loginFormKey.currentState.validate()) {
        _loginFormKey.currentState.save();
      }
      var result = login(_name, _password);
      result.then((value) => {
            print("login" + value.toString()),
            if (value != null && value.statusCode == 200)
              {
                userAuth.setAuthStatus(AuthStatus.Authenticated),
                print('set'),
                currentUser.setCurrentUser(
                    {"id": 111, "name": "test", "email": "test@eamil.com"}),
                print('login1  ${userAuth.state}'),
              }
            else
              {
                print('unauth'),
                userAuth.setAuthStatus(AuthStatus.Unauthenticated),
              }
          });
      print('login  ${userAuth.state}');
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
                borderSide: BorderSide(color: Colors.blueGrey[100]),
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
                borderSide: BorderSide(color: Colors.blueGrey[100]),
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
                  color: Colors.grey[100],
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () => _login(),
              child: Container(
                width: double.infinity,
                height: 50,
                child: Center(child: Text('Sign In')),
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
