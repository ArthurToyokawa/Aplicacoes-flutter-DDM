import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/leading_bar.dart';


class MonstrosCadastro extends StatefulWidget {
  const MonstrosCadastro({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('MonstrosCadastro'),
      body: Center(
        child: Text('MonstrosCadastro'),
      ),
    );
  }
}