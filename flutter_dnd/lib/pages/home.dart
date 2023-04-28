import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Home', showHomeButton: false),
      body: Align(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            BigButton(
              'Personagens', 
              () {Navigator.pushNamed(context, '/personagens');}
            ),
            const SizedBox(height: 8.0),
            BigButton(
              'Monstros', 
              () {Navigator.pushNamed(context, '/monstros');}
            ),
            const SizedBox(height: 8.0),
            BigButton(
              'Calculos', 
              () {Navigator.pushNamed(context, '/calculos');}
            ),
            const SizedBox(height: 16.0)
          ],
        ),
      )
    );
  }

}