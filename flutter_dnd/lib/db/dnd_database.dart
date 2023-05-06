import 'dart:async';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DndDatabase {
  static final DndDatabase instance = DndDatabase._init();

  static Database? _database;

  DndDatabase._init();

  Future<Database> get database async {
    if(_database != null) 
      return _database!;
    _database = await _initDB('dnd.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    // databaseFactory = databaseFactoryFfi;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);


    return await openDatabase(path, version: 1, onCreate: _createDB);
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
    Personagem p = Personagem(nome: 'Arthur', classe: 'Clerigo');
    await db.insert(tablePersonagem, p.toJson());
  }

  Future<List<Personagem>> getAll() async {
    final db = await instance.database;

    final orderBy = '${PersonagemFields.id} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tablePersonagens ORDER BY $orderBy');

    final result = await db.query(tablePersonagem, orderBy: orderBy);

    return result.map((json) => Personagem.fromJson(json)).toList();
  }
  
    Future<Personagem> getById(int id) async {
    final db = await instance.database;

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

  Future<int> create(Personagem personagem) async {
    final db = await instance.database;

    final id = await db.insert(tablePersonagem, personagem.toJson());
    return id;
  }


  Future<int> update(Personagem personagem) async {
    final db = await instance.database;

    return db.update(
      tablePersonagem,
      personagem.toJson(),
      where: '${PersonagemFields.id} = ?',
      whereArgs: [personagem.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tablePersonagem,
      where: '${PersonagemFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

}

//TODO MUDAR
// void main() async{

// // Avoid errors caused by flutter upgrade.
// // Importing 'package:flutter/widgets.dart' is required.
// WidgetsFlutterBinding.ensureInitialized();
// // Open the database and store the reference.
// final database = openDatabase(
//   // Set the path to the database. Personagem: Using the `join` function from the
//   // `path` package is best practice to ensure the path is correctly
//   // constructed for each platform.
//   join(await getDatabasesPath(), 'doggie_database.db'),
// );
// }