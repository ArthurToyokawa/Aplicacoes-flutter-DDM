import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';


class MonstroCadastro extends StatefulWidget {
  const MonstroCadastro({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
class _MyStatefulWidgetState extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final hpController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    hpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Monstros'),
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
                      'HP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: hpController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um HP';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite o numero de pontos de vida',
                      ),
                    ),
                  ],
                ),
              ),
              BigButton(
                'Criar novo monstro', 
                () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Monstro ${nameController.text} com hp ${hpController.text} criado com sucesso!')),
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