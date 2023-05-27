import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/routes.dart';

class Calculos extends StatefulWidget {
  const Calculos({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Rolar Dados'),
      body: Align(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            BigButton('Rolar dados', 
              () {
                Navigator.pushNamed(context, Routes.rolar_dados);
              }
            ),
            const SizedBox(height: 8.0),
            BigButton('Rolar Ataque', 
              () {
                Navigator.pushNamed(context, Routes.rolar_ataque);
              }
            ),
            const SizedBox(height: 16.0)
          ],
        ),
      )
    );
  }

}