import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/leading_bar.dart';


class RolarCombate extends StatefulWidget {
  const RolarCombate({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('RolarCombate'),
      body: Center(
        child: Text('RolarCombate'),
      ),
    );
  }
}