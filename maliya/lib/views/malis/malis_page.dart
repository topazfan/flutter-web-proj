import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/views/malis/malis_list.dart';

class MalisPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return Container(
      child: Column(
        children: [
          MalisList(),
        ],
      ),
    );
  }
}
