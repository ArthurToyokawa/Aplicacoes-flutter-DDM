// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ddm_aula02/view/database/fake/contato_dao.dart';
import 'package:ddm_aula02/view/dto/contato.dart';
import 'package:ddm_aula02/view/interface/contato_dao_interface.dart';
import 'package:flutter/material.dart';
import 'package:ddm_aula02/rota.dart';

class ContatoLista extends StatelessWidget {
  const ContatoLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Contatos')),
      body: criarLista(),
      floatingActionButton: criarBotao(context),
      bottomNavigationBar: criarBarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget criarLista() {
    ContatoDAOInterface dao = ContatoDAO();
    return FutureBuilder(
      future: dao.buscarTodos(),
      builder: (BuildContext context, AsyncSnapshot<List<Contato>> lista){
        if(!lista.hasData) return CircularProgressIndicator();
        if(lista.data == null) return Container();
        List<Contato> listaContato = lista.data!;
        return ListView.builder(
          itemCount: listaContato.length,
          itemBuilder: (context, index) {
            var contato = listaContato[index];
            return CriarItemLista(contato);
          },
        );
      },  
    );
  }

  Widget CriarItemLista(Contato contato){
    return Column(
      children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Expanded(
            flex: 1, 
            child: Column(children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(contato.urlAvatar!),
                  fit: BoxFit.fill
                ),
                ),
              ),
            ],),
          ),
          Expanded(
            flex: 3, 
            child: Column(children: [
              Text(contato.email!),
              Text(contato.nome!)
            ],),
          ),
          Expanded(
            flex: 1, 
            child: Column(children: [
              Icon(Icons.edit, color: Colors.blue,),
            ],),
          ),
          Expanded(
            flex: 1, 
            child: Column(children: [
              Icon(Icons.delete, color: Colors.red,),
            ],)
          )
        ],)
      ),
      Divider(
        thickness: 1,
        endIndent: 0,
        color: Colors.black,
      )]
    );
  }

  BottomAppBar criarBarraNavegacao(){
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(height: 50.0),
    );
  }

  FloatingActionButton criarBotao(BuildContext context){
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context,Rota.contatoForm),
      tooltip: 'Adicionar novo contato',
      child: const Icon(Icons.add),
    );
  }
}