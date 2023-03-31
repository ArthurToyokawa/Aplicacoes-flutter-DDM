import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/leading_bar.dart';


class Personagens extends StatefulWidget {
  const Personagens({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Personagens'),
      body: Center(
        child: Text('Personagens'),
      ),
    );
  }
}