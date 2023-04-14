import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/leading_bar.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Login'),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(alignment: Alignment.center, ),
              onPressed: () => (Navigator.pushReplacementNamed(context, '/home')),
              child: const Text('Home')
            )
          ],
        )
      )
    );
  }
}