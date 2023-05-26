import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_dnd/models/personagem.dart';

class Conexao{
  static late Database _database; 
  static bool _fechado = true;

  Future<Database> criar() async {
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db');                  
      _database = await openDatabase(                 
        path,                                         
        version: 1,                                    
        onCreate: _createDB 
      );
      _fechado = false;
    }
    return _database;
  }

  Future _createDB(Database db, int version) async {
    final idConstraints = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textConstraints = 'TEXT';
    final boolConstraints = 'BOOLEAN';
    final intConstraints = 'INTEGER';
    final nn = 'NOT NULL';

    await db.execute('''
    CREATE TABLE $tablePersonagem(
      ${PersonagemFields.id} ${idConstraints},
      ${PersonagemFields.nome} $textConstraints $nn,
      ${PersonagemFields.classe} $textConstraints $nn
    )
    ''');    
    Personagem p = Personagem(nome: 'Dominique', classe: 'Clerigo');
    Personagem p2 = Personagem(nome: 'Miriam', classe: 'Feiticeiro');
    Personagem p3 = Personagem(nome: 'Zangetsu', classe: 'Guerreiro');
    await db.insert(tablePersonagem, p.toJson());
    await db.insert(tablePersonagem, p2.toJson());
    await db.insert(tablePersonagem, p3.toJson());
  }
}