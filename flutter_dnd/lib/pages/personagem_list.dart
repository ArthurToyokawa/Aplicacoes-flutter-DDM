import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/big_button.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/dao/personagem_dao_sqlite.dart';
import 'package:flutter_dnd/dao/personagem_dao_interface.dart';
import 'package:flutter_dnd/db/dnd_database.dart';
import 'package:flutter_dnd/models/personagem.dart';


class PersonagemList extends StatefulWidget {
  const PersonagemList({super.key});

  @override
  _PersonagemListState createState() {	
    return _PersonagemListState();	
  }
}
class _PersonagemListState extends State<PersonagemList> {
  List<Personagem> _personagens = [];
  List<Personagem> personagens = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _personagens = _personagemService.getAll();
  //   refreshPersonagem();
  // }

  Future refreshPersonagem() async {
    // setState(() => isLoading = true);

    var p = await DndDatabase.instance.getAll();
    setState(() {
      personagens = p;
    });
    log(personagens[0].nome);
    // setState(() => isLoading = false);
  }



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
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding( 
                        padding: EdgeInsets.only(left:8), 
                        child:  Text(
                          'acoes',
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
              // ...personagens.map(
              ...listaPersonagem.map(
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
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding( 
                          padding: const EdgeInsets.only(left:8), 
                          child:  SizedBox( 
                            width: 30,
                            child: Row(
                              children: [ 
                                IconButton(
                                  onPressed: () => {
                                    //TODO ERRO Could not find a generator for route RouteSettings("personagens_cadastro", Instance of 'Personagem') in the _WidgetsAppState.
                                    print(p.nome),
                                    Navigator.pushNamed(context, 'personagens_cadastro', arguments: p).then((value) => loadPersonagens())                                    
                                  }, 
                                  icon: const Icon(Icons.edit), 
                                  color: Colors.orange,
                                ),
                                IconButton(
                                  onPressed: () => {
                                    deletePersonagem(p.id),
                                    loadPersonagens()
                                  }, 
                                  icon: const Icon(Icons.delete), 
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
