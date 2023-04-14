import 'package:flutter/material.dart';
import 'package:flutter_dnd/pages/home.dart';
import 'package:flutter_dnd/pages/login.dart';
import 'package:flutter_dnd/pages/monstros.dart';
import 'package:flutter_dnd/pages/monstros_cadastro.dart';
import 'package:flutter_dnd/pages/personagemList.dart';
import 'package:flutter_dnd/pages/personagens_cadastro.dart';
import 'package:flutter_dnd/pages/rolar_combate.dart';
import 'package:flutter_dnd/pages/rolar_dados.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => Home(),
        '/login': (context) => Login(),
        '/Personagens':(context) => PersonagemList(), 
        '/Personagens_cadastro':(context) => PersonagemCadastro(), 
        '/monstros':(context) => MonstrosList(), 
        '/monstros_cadstro':(context) => MonstrosCadastro(), 
        '/rolar_dados':(context) => RolarDados(), 
        '/rolar_combate':(context) => RolarCombate(), 
      },
      home: Login(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}