import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';


class RolarAtaque extends StatefulWidget {
  const RolarAtaque({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final hitController = TextEditingController();
  final acController = TextEditingController();
  int ?roll;

  @override
  void dispose() {
    hitController.dispose();
    acController.dispose();
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
                      'Modificador de acerto',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: hitController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o modidificador de acerto';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite o modidificador de acerto',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Classe de armadura do oponente',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: acController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a classe de armadura';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite a classe de armadura do oponente',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    BigButton(
                      'Calcular acerto', 
                      () {
                        if (_formKey.currentState!.validate()) {
                          var numOfDice = int.parse(hitController.text);
                          var numOfSides = int.parse(acController.text);
                          setState(() {
                            roll = Random().nextInt(20)+1;
                          });
                        }
                      }
                    ),
                  ],
                ),
              ),
              Text(
                roll != null ? 'Redultado do d20: ${roll}' : '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Text(
                roll != null ? 
                  'Resultado: ${roll! + int.parse(hitController.text) >= int.parse(acController.text)? 'acerto' : 'erro'}'
                  : '',
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