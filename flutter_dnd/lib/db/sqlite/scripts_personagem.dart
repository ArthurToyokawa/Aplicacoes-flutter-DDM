import 'dart:async';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
  
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
    Personagem p = Personagem(nome: 'Arthur', classe: 'Clerigo');
    await db.insert(tablePersonagem, p.toJson());
  }