

import 'dart:convert';

import 'package:flutter_dnd/dao/grupo_dao_interface.dart';
import 'package:flutter_dnd/db/sqlite/create_db.dart';
import 'package:flutter_dnd/models/arma.dart';
import 'package:flutter_dnd/models/grupo.dart';
import 'package:flutter_dnd/models/grupo_personagem.dart';
import 'package:flutter_dnd/utils/json.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class GrupoDAOSQLite implements GrupoDAOInterface {


  List<Grupo> agruparPersonagensGrupo(List<Grupo> grupo) {
    List<Grupo> agrupados = [];
      
    for(int i = 0; i < grupo.length; i++) {
      Grupo g = grupo[i];
      int agi = agrupados.indexWhere((ag) => ag.id == g.id);
      if(agi == -1){
        agrupados.add(g);
      } else {
        agrupados[agi].personagens?.add(g.personagens![0]);
      }
    }
    print('agrupados');
    for (var grupo in agrupados) {
      print("Grupo: ${grupo.nome}");

      if (grupo.personagens != null && grupo.personagens!.isNotEmpty) {
        for (var personagem in grupo.personagens!) {
          print(" - ${personagem.nome}");
        }
      } else {
        print(" - No personagens in this group.");
      }
    }
    return agrupados;
  }

  @override
  Future<List<Grupo>> buscarTodos() async {
    Database db = await  Conexao().criar();
    final orderBy = '${GrupoFields.id} ASC';
    final result = await db.query(tableGrupo, orderBy: orderBy);
    var grupos = result.map((json) => Grupo.fromJson(json)).toList();
    print('grupos');
    for (var grupo in grupos) {
      print("Grupo: ${grupo.nome}");

      if (grupo.personagens != null && grupo.personagens!.isNotEmpty) {
        for (var personagem in grupo.personagens!) {
          print(" - ${personagem.nome}");
        }
      } else {
        print(" - No personagens in this group.");
      }
    }
    return agruparPersonagensGrupo(grupos);
  }

  @override
  Future<List<Grupo>> buscarTodosTest() async {
    Database db = await  Conexao().criar();
    final orderBy = '${GrupoPersonagemFields.grupo} ASC';
    
    // final testGrupo = await db.query(tableGrupo, orderBy: orderBy);
    // print('testGrupo.toString()');
    // print(testGrupo.toString());

    final testgp = await db.query(tableGrupoPersonagem, orderBy: orderBy);
    print('testgp.toString()');
    print(testgp.toString());

    final result = await db.rawQuery('''
      SELECT g.nome
      FROM grupo g
      JOIN grupopersonagem gp ON g.id = gp.grupo
    ''');
    print('result.toString()');
    print(result.toString());
    return [];
    // return result.map((json) => Grupo.fromJson(json)).toList();
  }

  @override
  Future<Grupo> buscar(int id) async {
    Database db = await  Conexao().criar();

    final maps = await db.query(
      tableGrupo,
      columns: GrupoFields.values,
      where: '${GrupoFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('ID $id not found');
    } else {
      return Grupo.fromJson(maps.first);
    }
  }

  @override
  Future<int> salvar(Grupo grupo) async {
    Database db = await  Conexao().criar();
    
    final id = await db.insert(tableGrupo, grupo.toJson());
    return id;
  }

  @override
  Future<int> alterar(Grupo grupo) async {
    Database db = await  Conexao().criar();
    
    return db.update(
      tableGrupo,
      grupo.toJson(),
      where: '${GrupoFields.id} = ?',
      whereArgs: [grupo.id],
    );
  }
  
  @override
  Future<int> excluir(dynamic id) async {
    Database db = await  Conexao().criar();

    return await db.delete(
      tableGrupo,
      where: '${GrupoFields.id} = ?',
      whereArgs: [id],
    );
  }
}