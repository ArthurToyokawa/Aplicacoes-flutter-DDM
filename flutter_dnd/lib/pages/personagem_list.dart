import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:flutter_dnd/services/personagem_service.dart';


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
                ..._personagens.map(
                  (p) => TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding( 
                            padding: const EdgeInsets.only(left:8), 
                            child: Text(p.nome),
                          )
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding( 
                            padding: const EdgeInsets.only(left:8), 
                            child: Text(p.classe),
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
            'Criar novo personagem',
            () {
              Navigator.pushNamed(context, '/personagens_cadastro');
            },
          ),
        ],
      ),
    );
  }
}
