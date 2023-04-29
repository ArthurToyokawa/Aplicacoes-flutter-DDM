import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';


class PersonagemCadastro extends StatefulWidget {
  const PersonagemCadastro({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final classController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    classController.dispose();
    super.dispose();
  }

  var classes = [
    'Clerigo',
    'Paladino',
    'Ladino',
    'Feiticeiro',
    'Druida',
  ];
  var selectedClass = -2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Personagens'),
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
                      'Nome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um nome';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite um nome',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Classe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    DropdownButtonFormField<int>(
                      items: classes.asMap().entries.map((entry) {
                        return DropdownMenuItem(
                          value: entry.key,
                          child: Text(entry.value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedClass = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor, Selecione uma classe';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Selecione uma classe',
                      ),
                    ),
                  ],
                ),
              ),
              BigButton(
                'Criar novo personagem', 
                () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Personagem ${nameController.text} com classe ${classes[selectedClass]} criado com sucesso!')),
                    );
                  }
                }
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}