import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';


class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({super.key});

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
      appBar: LeadingBar('RecuperarSenha'),
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
                      'email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite o email usado na sua conta',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BigButton(
                      'Enviar email', 
                      () {
                        if (_formKey.currentState!.validate()) {                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Email de recuperação de senha enviado')),
                          );
                          Navigator.pushNamed(context, '/home');
                        }
                      }
                    ),
                    const SizedBox(height: 16.0)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}