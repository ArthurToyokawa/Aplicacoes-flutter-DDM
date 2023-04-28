import 'package:flutter/material.dart';

class BigButton extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return const Size.fromHeight(60.0);
  }
  BigButton(this.title, this.onclick, {super.key, this.showHomeButton = true});

  final String title;
  final onclick;
  bool showHomeButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
        minimumSize: const Size(150, 60), 
      ),
      onPressed: onclick,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        )
      ),
    );
  }
}