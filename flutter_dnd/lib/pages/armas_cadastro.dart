import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/FormNumberField.dart';
import 'package:flutter_dnd/components/FormTextField.dart';
import 'package:flutter_dnd/components/bigLabel.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/dao/arma_dao_interface.dart';
import 'package:flutter_dnd/dao/arma_dao_sqlite.dart';
import 'package:flutter_dnd/models/arma.dart';
import 'package:flutter_dnd/routes.dart';

class ArmaCadastro extends StatefulWidget {
  const ArmaCadastro({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ArmaCadastro> {
  final _formKey = GlobalKey<FormState>();

  int? id;
  final nameController = TextEditingController();
  final modDanoController = TextEditingController();
  final numDadosController = TextEditingController();
  final dadoDanoController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    modDanoController.dispose();
    numDadosController.dispose();
    dadoDanoController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      receberArmaParaAlteracao(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ArmaDAOInterface dao = ArmaDAOSQLite();

    saveArma() {
      if (_formKey.currentState!.validate()) {
        if(id == null){
          Arma a = Arma(
            nome: nameController.text,
            modDano:  int.parse(modDanoController.text),
            numDados: int.parse(numDadosController.text),
            dadoDano:  int.parse(dadoDanoController.text),

          );
          dao.salvar(a).then((value) => {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Arma ${a.nome} criado com sucesso!'),
              ),
            ),
            Navigator.pushNamed(context, Routes.armas),
          });
        } else {
          Arma a = Arma(
            id: id, nome: nameController.text,
            modDano:  int.parse(modDanoController.text),
            numDados: int.parse(numDadosController.text),
            dadoDano:  int.parse(dadoDanoController.text),
          );
          dao.alterar(a).then((value) => {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Arma ${a.nome} alterado com sucesso!'),
              ),
            ),            
            Navigator.pushNamed(context, Routes.armas),
          });
        }
      }
    }

    return Scaffold(
      appBar: LeadingBar('Armas'),
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
                    BigLabel(title: 'Nome'),
                    const SizedBox(height: 8.0),
                    FormTextField(
                      fieldName: 'nome',
                      controller: nameController,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16.0),
                    BigLabel(title: 'Modificador de dano'),
                    const SizedBox(height: 8.0),
                    FormNumberField(
                      fieldName: 'modDano',
                      controller: modDanoController,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16.0),
                    BigLabel(title: 'Numero de dados'),
                    const SizedBox(height: 8.0),
                    FormNumberField(
                      fieldName: 'numDados',
                      controller: numDadosController,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16.0),
                    BigLabel(title: 'Valor dos dados'),
                    const SizedBox(height: 8.0),
                    FormNumberField(
                      fieldName: 'dadoDano',
                      controller: dadoDanoController,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
              BigButton(
                id == null? 'Criar nova arma': 'Alterar arma', 
                saveArma
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  void receberArmaParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Arma arma = parametro.settings.arguments as Arma;
      id = arma.id;
      nameController.text = arma.nome;
      modDanoController.text =  arma.modDano.toString();
      numDadosController.text = arma.numDados.toString();
      dadoDanoController.text = arma.dadoDano.toString();
      setState(() {});
    }
  }
}
