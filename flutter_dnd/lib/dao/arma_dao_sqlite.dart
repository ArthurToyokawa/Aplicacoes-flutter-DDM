

import 'package:flutter_dnd/dao/arma_dao_interface.dart';
import 'package:flutter_dnd/db/sqlite/create_db.dart';
import 'package:flutter_dnd/models/arma.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ArmaDAOSQLite implements ArmaDAOInterface {

  @override
  Future<List<Arma>> buscarTodos() async {
    Database db = await  Conexao().criar();
    final orderBy = '${ArmaFields.id} ASC';
    final result = await db.query(tableArma, orderBy: orderBy);
    
    return result.map((json) => Arma.fromJson(json)).toList();

  }

  @override
  Future<Arma> buscar(int id) async {
    Database db = await  Conexao().criar();

    final maps = await db.query(
      tableArma,
      columns: ArmaFields.values,
      where: '${ArmaFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('ID $id not found');
    } else {
      return Arma.fromJson(maps.first);
    }
  }

  @override
  Future<int> salvar(Arma arma) async {
    Database db = await  Conexao().criar();
    
    final id = await db.insert(tableArma, arma.toJson());
    return id;
  }

  @override
  Future<int> alterar(Arma arma) async {
    Database db = await  Conexao().criar();
    
    return db.update(
      tableArma,
      arma.toJson(),
      where: '${ArmaFields.id} = ?',
      whereArgs: [arma.id],
    );
  }
  
  @override
  Future<int> excluir(dynamic id) async {
    Database db = await  Conexao().criar();

    return await db.delete(
      tableArma,
      where: '${ArmaFields.id} = ?',
      whereArgs: [id],
    );
  }
}