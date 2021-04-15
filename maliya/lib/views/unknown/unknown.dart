import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '404! PAGE NOT FOUND',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
