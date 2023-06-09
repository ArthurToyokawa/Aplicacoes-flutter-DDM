// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';


class RolarDados extends StatefulWidget {
  const RolarDados({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final numController = TextEditingController();
  final sidesController = TextEditingController();
  List<int> rolls = [];

  @override
  void dispose() {
    numController.dispose();
    sidesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Rolar dados'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Numero de dados',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: numController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um numero de dados';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite o numero de dados que seram jogados',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Numero de lados do dado',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: sidesController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o numero de lados do dado';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite o numero de lados do dado',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    BigButton(
                      'Rolar dado', 
                      () {
                        if (_formKey.currentState!.validate()) {
                          var numOfDice = int.parse(numController.text);
                          var numOfSides = int.parse(sidesController.text);
                          setState(() {
                            rolls = List.generate(numOfDice, (index) => (
                              Random().nextInt(numOfSides)+1
                            ));
                          });
                        }
                      }
                    ),
                  ],
                ),
              ),
              Text(
                rolls.isNotEmpty ? 'Resultado: ${rolls.join(', ')}' : '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Text(
                rolls.isNotEmpty ? 'Total: ${rolls.reduce((total, roll) => total + roll)}' : '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}