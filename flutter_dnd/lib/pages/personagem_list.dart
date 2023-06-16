import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/components/tableCellDataText.dart';
import 'package:flutter_dnd/components/tableCellDeleteEdit.dart';
import 'package:flutter_dnd/components/tableCellTitle.dart';
import 'package:flutter_dnd/dao/personagem_dao_sqlite.dart';
import 'package:flutter_dnd/dao/personagem_dao_interface.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:flutter_dnd/routes.dart';


class PersonagemList extends StatefulWidget {
  const PersonagemList({super.key});

  @override
  _PersonagemListState createState() {	
    return _PersonagemListState();	
  }
}
class _PersonagemListState extends State<PersonagemList> {
  List<Personagem> personagens = [];

  @override
  Widget build(BuildContext context) {
    PersonagemDAOInterface dao = PersonagemDAOSQLite();

  Future<List<Personagem>> loadPersonagens() {
    setState(() {});
    return dao.buscarTodos();
  }

  deletePersonagem(int id) {
    dao.excluir(id).then((v) => 
      loadPersonagens()
    );
  }

    return Scaffold(
      appBar: LeadingBar('Personagens'),
      body: FutureBuilder(
        future: loadPersonagens(),
        builder: (BuildContext context, AsyncSnapshot<List<Personagem>> lista){
          if(!lista.hasData) return const CircularProgressIndicator();
          if(lista.data == null) return Container();
          List<Personagem> listaPersonagem = lista.data!;
          return listaPersonagens(listaPersonagem, loadPersonagens, deletePersonagem);
        },  
      )
    );
  }
  Widget listaPersonagens(List<Personagem> listaPersonagem, loadPersonagens, deletePersonagem) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(width: 1.5),
            columnWidths: const {
              0: FlexColumnWidth(1.5),
              1: FlexColumnWidth(2),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                children: [
                  TableCellTitle('Nome'),
                  TableCellTitle('Classe'),
                  TableCellTitle('Arma'),
                  TableCellTitle('Ações'),
                ],
              ),
              // ...personagens.map(
              ...listaPersonagem.map(
                (p) => TableRow(
                  children: [
                    TableCellDataText(p.nome),
                    TableCellDataText(p.classe),
                    TableCellDataText(p.arma.nome),
                    TableCellDeleteEdit(
                      () => {
                        Navigator.pushNamed(
                          context, 
                          Routes.personagens_cadastro, 
                          arguments: p
                          ).then((value) => loadPersonagens())                                    
                      },
                      () => {
                        deletePersonagem(p.id),
                        loadPersonagens()
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        BigButton(
          'Criar novo personagem',
          () {
            Navigator.pushNamed(context, Routes.personagens_cadastro);
          },
        ),
      ],
    );
  }
}
