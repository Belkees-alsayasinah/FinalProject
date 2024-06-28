import 'package:flutter/material.dart';

import '../Style/constant.dart';

class MyTable extends StatelessWidget {
  final String title;
  final String text;

  MyTable({
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: grey),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: const [
        TableRow(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Center(child: Text('Title 11')),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Center(child: Text('Value 21')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
