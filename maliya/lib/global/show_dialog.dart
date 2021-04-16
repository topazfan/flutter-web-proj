import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String title, String message) {
  showDialog(
    // 设置点击 dialog 外部不取消 dialog，默认能够取消
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
      child: AlertDialog(
        title: Text(title),
        titleTextStyle: TextStyle(color: Colors.purple), // 标题文字样式
        content: Text(message),
        contentTextStyle: TextStyle(color: Colors.green), // 内容文字样式
        backgroundColor: CupertinoColors.white,
        elevation: 8.0, // 投影的阴影高度
        semanticLabel: 'Label', // 这个用于无障碍下弹出 dialog 的提示
        shape: Border.all(),
        // dialog 的操作按钮，actions 的个数尽量控制不要过多，否则会溢出 `Overflow`
        actions: <Widget>[
          // 点击关闭 dialog，需要通过 Navigator 进行操作
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Close')),
        ],
      ),
    ),
  );
}
