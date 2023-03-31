import 'package:flutter/material.dart';

class LeadingBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return const Size.fromHeight(60.0);
  }
  LeadingBar(this.title, {super.key, this.showHomeButton = true});

  final String title;
  bool showHomeButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
      if(showHomeButton)
      IconButton(
        onPressed: () => {Navigator.pushNamed(context, '/')},
        icon:Icon(
          Icons.home, 
          color: Colors.blue.shade700, 
          size: 30,
        )
      ),
      
      ],
      title: Text(title),
    );
  }
  
}