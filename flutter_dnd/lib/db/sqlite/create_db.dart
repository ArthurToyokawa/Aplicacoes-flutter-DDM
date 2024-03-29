import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:flutter_dnd/models/grupo.dart';
import 'package:flutter_dnd/models/grupo_personagem.dart';
import 'package:flutter_dnd/models/arma.dart';

class Conexao{
  static late Database _database; 
  static bool _fechado = true;

  Future<Database> criar() async {
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db');   
      //comentar essa linha se for manter o db entre sessões
      deleteDatabase(path);               
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
    const idConstraints = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textConstraints = 'TEXT';
    const boolConstraints = 'BOOLEAN';
    const intConstraints = 'INTEGER';
    const nn = 'NOT NULL';


    await db.execute('''
    CREATE TABLE $tableArma(
      ${ArmaFields.id} $idConstraints,
      ${ArmaFields.nome} $textConstraints $nn,
      ${ArmaFields.modDano} $intConstraints $nn,
      ${ArmaFields.numDados} $intConstraints $nn,
      ${ArmaFields.dadoDano} $intConstraints $nn
    )
    '''); 

    Arma a = Arma(id: 1, nome: 'Adaga', modDano: 0,numDados: 1, dadoDano: 4);
    Arma a2 = Arma(id: 2, nome: 'Warhammer', modDano: 1,numDados: 1, dadoDano: 8);
    await db.insert(tableArma, a.toJson());
    await db.insert(tableArma, a2.toJson());
    print(a.toJson());

    await db.execute('''
      CREATE TABLE $tablePersonagem(
        ${PersonagemFields.id} $idConstraints,
        ${PersonagemFields.nome} $textConstraints $nn,
        ${PersonagemFields.classe} $textConstraints $nn,
        ${PersonagemFields.arma} $intConstraints $nn,
        FOREIGN KEY (${PersonagemFields.arma}) REFERENCES $tableArma(${ArmaFields.id}) ON DELETE NO ACTION
      )
    '''); 
           
    Personagem p = Personagem(nome: 'Dominique', classe: 'Clerigo', arma: a);
    Personagem p2 = Personagem(nome: 'Miriam', classe: 'Feiticeiro', arma: a);
    Personagem p3 = Personagem(nome: 'Zangetsu', classe: 'Guerreiro', arma: a2);
    print(p.toJson());
    await db.insert(tablePersonagem, p.toJson());
    await db.insert(tablePersonagem, p2.toJson());
    await db.insert(tablePersonagem, p3.toJson());


    await db.execute('''
      CREATE TABLE $tableGrupo(
        ${GrupoFields.id} $idConstraints,
        ${GrupoFields.nome} $textConstraints $nn
      );
      CREATE TABLE $tableGrupoPersonagem(
        ${GrupoPersonagemFields.id} $idConstraints,
        ${GrupoPersonagemFields.grupo} $intConstraints $nn,
        ${GrupoPersonagemFields.personagem} $intConstraints $nn,
        FOREIGN KEY (${GrupoPersonagemFields.grupo}) REFERENCES $tableGrupo(${GrupoFields.id}) ON DELETE NO ACTION,
        FOREIGN KEY (${GrupoPersonagemFields.personagem}) REFERENCES $tablePersonagem(${PersonagemFields.id}) ON DELETE NO ACTION
      )
    ''');
           
    Grupo g = Grupo(nome: 'principais');
    Grupo g2 = Grupo(nome: 'secundarios');
    print(g.toJson());
    await db.insert(tableGrupo, g.toJson());
    await db.insert(tableGrupo, g2.toJson());

    GrupoPersonagem gp = GrupoPersonagem(grupo: g, personagem: p);
    GrupoPersonagem gp2 = GrupoPersonagem(grupo: g, personagem: p2);
    GrupoPersonagem gp3 = GrupoPersonagem(grupo: g2, personagem: p3);
    print(p.toJson());
    await db.insert(tableGrupoPersonagem, gp.toJson());
    await db.insert(tableGrupoPersonagem, gp2.toJson());
    await db.insert(tableGrupoPersonagem, gp3.toJson());



  }
}