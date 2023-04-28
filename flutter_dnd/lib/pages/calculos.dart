import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/leading_bar.dart';

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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)
                ),
                minimumSize: const Size(150, 60), 
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/rolar_dados');
              },
              child: const Text(
                'Personagens',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                )
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)
                ),
                minimumSize: const Size(150, 60), 
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/rolar_combate');
              },
              child: const Text(
                'Rolar Ataque',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                )
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)
                ),
                minimumSize: const Size(150, 60), 
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/calculos');
              },
              child: const Text(
                'Calculos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                )
              ),
            ),
            const SizedBox(height: 8.0),
            const SizedBox(height: 16.0)
          ],
        ),
      )
    );
  }

}