import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/DropdownFormField.dart';
import 'package:flutter_dnd/components/FormTextField.dart';
import 'package:flutter_dnd/components/bigLabel.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/dao/arma_dao_interface.dart';
import 'package:flutter_dnd/dao/arma_dao_sqlite.dart';
import 'package:flutter_dnd/dao/personagem_dao_interface.dart';
import 'package:flutter_dnd/dao/personagem_dao_sqlite.dart';
import 'package:flutter_dnd/models/arma.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:flutter_dnd/routes.dart';

class PersonagemCadastro extends StatefulWidget {
  const PersonagemCadastro({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<PersonagemCadastro> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final classController = TextEditingController();
  var classes = [
    'Guerreiro',
    'Clerigo',
    'Paladino',
    'Ladino',
    'Feiticeiro',
    'Druida',
  ];
  ValueNotifier<String?> selectedClass = ValueNotifier<String?>('Guerreiro');
  ValueNotifier<Arma?> selectedWeapon = ValueNotifier<Arma?>(null);
  int? id;

  @override
  void dispose() {
    nameController.dispose();
    classController.dispose();
    selectedClass.dispose();
    selectedWeapon.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      receberPersonagemParaAlteracao(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PersonagemDAOInterface dao = PersonagemDAOSQLite();
    ArmaDAOInterface daoArma = ArmaDAOSQLite();

    Future<List<Arma>> loadArmas() {
      setState(() {});
      return daoArma.buscarTodos();
    }

    savePersonagem() {
      if (_formKey.currentState!.validate()) {
        if(id == null){
          Personagem p = Personagem(
            nome: nameController.text, 
            classe: selectedClass.value!, 
            arma: selectedWeapon.value!
          );
          dao.salvar(p).then((value) => {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Personagem ${p.nome} com classe ${p.classe} criado com sucesso!'),
              ),
            ),
            Navigator.pushNamed(context, Routes.personagens),
          });
        } else {
          Personagem p = Personagem(
            id: id,
            nome: nameController.text, 
            classe: selectedClass.value!, 
            arma: selectedWeapon.value!
          );
          dao.alterar(p).then((value) => {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Personagem ${p.nome} com classe ${p.classe} alterado com sucesso!'),
              ),
            ),            
            Navigator.pushNamed(context, Routes.personagens),
          });
        }
      }
    }

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
                    BigLabel(title: 'Nome'),
                    const SizedBox(height: 8.0),
                    FormTextField(
                      fieldName: 'nome',
                      controller: nameController,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16.0),
                    BigLabel(title: 'Classe'),
                    const SizedBox(height: 8.0),
                    ValueListenableBuilder<String?>(
                      valueListenable: selectedClass,
                      builder: (context, value, _) {
                        return DropdownButtonFormField<String>(
                          value: value,
                          items: classes.map((entry) {
                            return DropdownMenuItem(
                              value: entry,
                              child: Text(entry),
                            );
                          }).toList(),
                          onChanged: (value) {
                            selectedClass.value = value!;
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
                        );
                      },
                    ),
                    const SizedBox(height: 16.0),
                    BigLabel(title: 'Arma'),
                    const SizedBox(height: 8.0),
                    DropdownFormField(
                      opcaoSelecionado: selectedWeapon,
                      consultarTodos: daoArma.buscarTodos,
                    )
                  ],
                ),
              ),
              BigButton(
                id == null? 'Criar novo personagem': 'Alterar personagem', 
                savePersonagem
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  void receberPersonagemParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Personagem personagem = parametro.settings.arguments as Personagem;
      id = personagem.id;
      nameController.text = personagem.nome;
      selectedClass.value = personagem.classe;
      selectedWeapon.value = personagem.arma;
      setState(() {});
    }
  }
}
