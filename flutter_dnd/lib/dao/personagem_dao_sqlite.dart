

import 'package:flutter_dnd/dao/personagem_dao_interface.dart';
import 'package:flutter_dnd/db/sqlite/create_db.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class PersonagemDAOSQLite implements PersonagemDAOInterface {

  @override
  Future<List<Personagem>> buscarTodos() async {
    Database db = await  Conexao().criar();
    final orderBy = '${PersonagemFields.id} ASC';
    final result = await db.query(tablePersonagem, orderBy: orderBy);
    print(result);
    result.map((e) => print(e));
    return [];
    return result.map((json) => Personagem.fromJson(json)).toList();

  }

  @override
  Future<Personagem> buscar(int id) async {
    Database db = await  Conexao().criar();

    final maps = await db.query(
      tablePersonagem,
      columns: PersonagemFields.values,
      where: '${PersonagemFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('ID $id not found');
    } else {
      return Personagem.fromJson(maps.first);
    }
  }

  @override
  Future<int> salvar(Personagem personagem) async {
    Database db = await  Conexao().criar();
    
    final id = await db.insert(tablePersonagem, personagem.toJson());
    return id;
  }

  @override
  Future<int> alterar(Personagem personagem) async {
    Database db = await  Conexao().criar();
    
    return db.update(
      tablePersonagem,
      personagem.toJson(),
      where: '${PersonagemFields.id} = ?',
      whereArgs: [personagem.id],
    );
  }
  
  @override
  Future<int> excluir(dynamic id) async {
    Database db = await  Conexao().criar();

    return await db.delete(
      tablePersonagem,
      where: '${PersonagemFields.id} = ?',
      whereArgs: [id],
    );
  }
}