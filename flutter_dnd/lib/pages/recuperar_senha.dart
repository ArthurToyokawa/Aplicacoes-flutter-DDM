import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/leading_bar.dart';


class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('RecuperarSenha'),
      body: Container(
        width: 100,
        height: 100,
        child: ElevatedButton(
            style: ButtonStyle(alignment: Alignment.center, ),
            onPressed: () => (Navigator.pushReplacementNamed(context, '/home')),
            child: const Text('Home')
          )
      )
    );
  }
}