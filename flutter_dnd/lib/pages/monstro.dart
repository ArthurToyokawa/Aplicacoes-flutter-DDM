
import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/db/dnd_database.dart';
import 'package:flutter_dnd/models/monstro.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:flutter_dnd/services/monstro_service.dart';


class MonstroList extends StatefulWidget {
  const MonstroList({super.key});

  @override
  _MonstroListState createState() {	
    return _MonstroListState();	
  }
}
class _MonstroListState extends State<MonstroList> {
  final _monstroService = MonstroService();
  List<Monstro> _monstros = [];

  @override
  void initState() {
    super.initState();
    _monstros = _monstroService.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Monstros'),
      body: Column(
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
                  children: const [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding( 
                          padding: EdgeInsets.only(left:8), 
                          child: Text(
                            'Nome',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding( 
                          padding: EdgeInsets.only(left:8), 
                          child:  Text(
                            'Classe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ..._monstros.map(
                  (m) => TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding( 
                            padding: const EdgeInsets.only(left:8), 
                            child: Text(m.nome),
                          )
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding( 
                            padding: const EdgeInsets.only(left:8), 
                            child: Text(m.classe),
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BigButton(
            'Criar novo monstro',
            () {
              Navigator.pushNamed(context, '/monstros_cadastro');
            },
          ),
        ],
      ),
    );
  }
}
