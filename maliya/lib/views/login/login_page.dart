import 'package:flutter/material.dart';
import 'package:maliya/services/user/login.dart';

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
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
          'assets/images/regular.jpg',
          width: 200,
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 30, vertical: MediaQuery.of(context).size.height / 6),
          child: Container(
            width: 300,
            child: _formLogin(),
          ),
        ),
      ],
    );
  }

  _formLogin() {
    var _name = '';
    var _password = '';
    final _loginFormKey = GlobalKey<FormState>();

    _login() {
      if (_loginFormKey.currentState.validate()) {
        _loginFormKey.currentState.save();
      }
      var result = login(_name, _password);
      result.then((value) => print(value));
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
