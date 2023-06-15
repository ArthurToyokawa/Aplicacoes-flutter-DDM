import 'package:flutter/material.dart';
import 'package:flutter_dnd/routes.dart';

class BigLabel extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return const Size.fromHeight(60.0);
  }
  BigLabel({super.key, required this.title,});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    );
  }
  
}