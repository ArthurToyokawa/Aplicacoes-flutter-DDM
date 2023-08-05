import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/components/tableCellDataText.dart';
import 'package:flutter_dnd/components/tableCellDeleteEdit.dart';
import 'package:flutter_dnd/components/tableCellTitle.dart';
import 'package:flutter_dnd/dao/grupo_dao_sqlite.dart';
import 'package:flutter_dnd/dao/grupo_dao_interface.dart';
import 'package:flutter_dnd/models/grupo.dart';
import 'package:flutter_dnd/routes.dart';


class GrupoList extends StatefulWidget {
  const GrupoList({super.key});

  @override
  _GrupoListState createState() {	
    return _GrupoListState();	
  }
}
class _GrupoListState extends State<GrupoList> {
  List<Grupo> grupos = [];

  @override
  Widget build(BuildContext context) {
    GrupoDAOInterface dao = GrupoDAOSQLite();

  Future<List<Grupo>> loadGrupos() {
    setState(() {});
    return dao.buscarTodosTest();
    // return dao.buscarTodos();
  }

  deleteGrupo(int id) {
    dao.excluir(id).then((v) => 
      loadGrupos()
    );
  }

    return Scaffold(
      appBar: LeadingBar('Grupos'),
      body: FutureBuilder(
        future: loadGrupos(),
        builder: (BuildContext context, AsyncSnapshot<List<Grupo>> lista){
          if(!lista.hasData) return const CircularProgressIndicator();
          if(lista.data == null) return Container();
          List<Grupo> listaGrupo = lista.data!;
          return listaGrupos(listaGrupo, loadGrupos, deleteGrupo);
        },  
      )
    );
  }
  Widget listaGrupos(List<Grupo> listaGrupo, loadGrupos, deleteGrupo) {
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
                  TableCellTitle('Grupos'),
                  TableCellTitle('Ações'),
                ],
              ),
              // ...grupos.map(
              ...listaGrupo.map(
                (g) => TableRow(
                  children: [
                    TableCellDataText(g.nome),
                    TableCellDataText('p'),//g.personagens![0].nome),
                    // TableCellDataText(p.arma.nome),
                    TableCellDeleteEdit(
                      () => {
                        Navigator.pushNamed(
                          context, 
                          Routes.grupos_cadastro, 
                          arguments: g
                          ).then((value) => loadGrupos())                                    
                      },
                      () => {
                        deleteGrupo(g.id),
                        loadGrupos()
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        BigButton(
          'Criar novo grupo',
          () {
            Navigator.pushNamed(context, Routes.grupos_cadastro);
          },
        ),
      ],
    );
  }
}
