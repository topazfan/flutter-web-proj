import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/models/malis_model.dart';
import 'package:maliya/services/malis/files.dart';

class MalisList extends StatefulWidget {
  @override
  _MalisListState createState() => _MalisListState();
}

class _MalisListState extends State<MalisList> {
  List<MalisModel> _list = [];

  @override
  void initState() {
    var list = getAttributeList();
    list.then(
      (value) => {
        setState(() {
          _list = value;
        })
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        border: TableBorder.symmetric(
            inside: BorderSide(width: 1, color: Colors.blue),
            outside: BorderSide(width: 5)),
        defaultColumnWidth: FlexColumnWidth(50.0),
        columnWidths: const <int, TableColumnWidth>{
          1: FixedColumnWidth(100.0),
        },
        children: _list
            .map(
              (element) => TableRow(
                decoration: BoxDecoration(color: Colors.grey[200]),
                children: <Widget>[
                  Text(element.name!),
                  Text(element.verb!),
                  Text(element.description!),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
