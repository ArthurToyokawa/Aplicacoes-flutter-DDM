import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/components/tableCellDataText.dart';
import 'package:flutter_dnd/components/tableCellDeleteEdit.dart';
import 'package:flutter_dnd/components/tableCellTitle.dart';
import 'package:flutter_dnd/dao/arma_dao_sqlite.dart';
import 'package:flutter_dnd/dao/arma_dao_interface.dart';
import 'package:flutter_dnd/models/arma.dart';
import 'package:flutter_dnd/routes.dart';


class ArmaList extends StatefulWidget {
  const ArmaList({super.key});

  @override
  _ArmaListState createState() {	
    return _ArmaListState();	
  }
}
class _ArmaListState extends State<ArmaList> {
  List<Arma> armas = [];

  @override
  Widget build(BuildContext context) {
    ArmaDAOInterface dao = ArmaDAOSQLite();

  Future<List<Arma>> loadArmas() {
    setState(() {});
    return dao.buscarTodos();
  }

  deleteArma(int id) {
    dao.excluir(id).then((v) => 
      loadArmas()
    );
  }

    return Scaffold(
      appBar: LeadingBar('Armas'),
      body: FutureBuilder(
        future: loadArmas(),
        builder: (BuildContext context, AsyncSnapshot<List<Arma>> lista){
          if(!lista.hasData) return const CircularProgressIndicator();
          if(lista.data == null) return Container();
          List<Arma> listaArma = lista.data!;
          return listaArmas(listaArma, loadArmas, deleteArma);
        },  
      )
    );
  }
  Widget listaArmas(List<Arma> listaArma, loadArmas, deleteArma) {
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
                  TableCellTitle('Dano'),
                  TableCellTitle('Ações'),
                ],
              ),
              // ...armas.map(
              ...listaArma.map(
                (a) => TableRow(
                  children: [
                    TableCellDataText(a.nome),
                    TableCellDataText('${a.modDano} + ${a.numDados}d${a.dadoDano}'),
                    TableCellDeleteEdit(
                      () => {
                        Navigator.pushNamed(
                          context, 
                          Routes.armas_cadastro, 
                          arguments: a
                          ).then((value) => loadArmas())                                    
                      },
                      () => {
                        deleteArma(a.id),
                        loadArmas()
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        BigButton(
          'Criar nova arma',
          () {
            Navigator.pushNamed(context, Routes.armas_cadastro);
          },
        ),
      ],
    );
  }
}
