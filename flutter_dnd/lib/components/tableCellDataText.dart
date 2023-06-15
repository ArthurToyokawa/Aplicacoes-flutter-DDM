import 'package:flutter/material.dart';
import 'package:flutter_dnd/routes.dart';

class TableCellDataText extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return const Size.fromHeight(60.0);
  }
  TableCellDataText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding( 
          padding: const EdgeInsets.only(left:8), 
          child: Center(
            child: Text(text,
              style: TextStyle(fontSize: 20)
            ),
          )
        )
      ),
    );
  }
  
}