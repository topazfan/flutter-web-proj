import 'package:flutter/material.dart';

class BodyTemplate extends StatelessWidget {
  final Widget child;

  const BodyTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      alignment: Alignment.topCenter,
      // 限制整体页面的最大宽度
      // child: ConstrainedBox(
      //   constraints: BoxConstraints(maxWidth: 1200),
      //   child: child,
      // ),
      child: child,
    );
  }
}
