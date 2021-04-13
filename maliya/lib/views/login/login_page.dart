import 'package:flutter/material.dart';
import 'package:maliya/services/user/login.dart';
import 'package:maliya/views/login/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginBody();
  }
}

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _register() {
      var result = sign(null);
      result.then((value) => print(value));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 300,
          // constraints: BoxConstraints(maxWidth: 300),
          padding: EdgeInsets.symmetric(
              horizontal: 30, vertical: MediaQuery.of(context).size.height / 6),
          child: LoginForm(),
        ),
        Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 160),
              Text(
                'Sign in to \nMy Application',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              SizedBox(height: 40),
              Text(
                "If you don't have an accout",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "you can",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                  SizedBox(width: 15),
                  Container(
                    child: GestureDetector(
                      child: Text(
                        "Register here!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                      onTap: () => _register(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Image.asset(
          'assets/images/hehua.png',
          width: 400,
        ),
      ],
    );
  }
}
