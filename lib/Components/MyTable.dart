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
    final Size screenSize = MediaQuery.of(context).size;

    return Table(
      border: TableBorder.all(color: grey),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: Color(0xFF92A78E),// Updated color here
          ),
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'font1',
                      fontSize: screenSize.width * 0.04,
                      fontWeight: FontWeight.bold
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'font1',
                      fontSize: screenSize.width * 0.04,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
