import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:flutter_dnd/services/personage_service.dart';


class PersonagemList extends StatefulWidget {
  const PersonagemList({super.key});

  @override
  _PersonagemListState createState() {	
    return _PersonagemListState();	
  }
}
class _PersonagemListState extends State<PersonagemList> {
  final _personagemService = PersonagemService();
  List<Personagem> _personagens = [];

  @override
  void initState() {
    super.initState();
    _personagens = _personagemService.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Personagens'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Table(
            border: TableBorder.all( width: 1.5),
            columnWidths: const {
              0: FlexColumnWidth(1.5),
              1: FlexColumnWidth(2),
            },
            children: _personagens.map((p) => 
              TableRow(
                children: [
                  Text(p.nome),
                  Text(p.classe),
                ]
              )
            ).cast<TableRow>().toList()
          ),
          BigButton(
            'Criar novo personagem', 
            () {Navigator.pushNamed(context, '/personagens_cadastro');}
          ),
          
        ]
      )
    );
  }
}
