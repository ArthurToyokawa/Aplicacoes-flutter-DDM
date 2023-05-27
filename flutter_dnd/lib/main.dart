import 'package:flutter/material.dart';
import 'package:flutter_dnd/pages/calculos.dart';
import 'package:flutter_dnd/pages/home.dart';
import 'package:flutter_dnd/pages/login.dart';
import 'package:flutter_dnd/pages/monstro.dart';
import 'package:flutter_dnd/pages/monstro_cadastro.dart';
import 'package:flutter_dnd/pages/personagem_list.dart';
import 'package:flutter_dnd/pages/personagens_cadastro.dart';
import 'package:flutter_dnd/pages/recuperar_senha.dart';
import 'package:flutter_dnd/pages/rolar_ataque.dart';
import 'package:flutter_dnd/pages/rolar_dados.dart';
import 'package:flutter_dnd/routes.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

Future main() async {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      home: const Login(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}