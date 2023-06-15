import 'package:flutter/material.dart';
import 'package:flutter_dnd/routes.dart';

class TableCellDeleteEdit extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return const Size.fromHeight(60.0);
  }
  TableCellDeleteEdit(this.onclickEdit, this.onclickDelete, {super.key});

  final onclickEdit;  
  final onclickDelete;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [ 
            IconButton(
              onPressed: onclickEdit, 
              icon: const Icon(Icons.edit), 
              color: Colors.orange,
              padding: const EdgeInsets.only(left:20)
            ),
            IconButton(
              onPressed: onclickDelete, 
              icon: const Icon(Icons.delete), 
              color: Colors.red,
                padding: const EdgeInsets.only(left:20)
            ),
          ],
        ),
      ),
    );
  }
  
}