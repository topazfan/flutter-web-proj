import 'package:flutter/material.dart';

class HomeContentTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Home hello"),
        Expanded(
          child: Center(
            child: Text("Join & Start"),
          ),
        ),
      ],
    );
  }
}
