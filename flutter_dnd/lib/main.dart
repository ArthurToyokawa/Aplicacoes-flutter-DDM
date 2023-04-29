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
        '/home':(context) => const Home(),
        '/login': (context) => const Login(),
        '/recuperar_senha': (context) => const RecuperarSenha(),
        '/personagens':(context) => const PersonagemList(), 
        '/personagens_cadastro':(context) => const PersonagemCadastro(), 
        '/monstros':(context) => const MonstroList(), 
        '/monstros_cadastro':(context) => const MonstroCadastro(), 
        '/calculos':(context) => const Calculos(), 
        '/rolar_dados':(context) => const RolarDados(), 
        '/rolar_ataque':(context) => const RolarAtaque(), 
      },
      home: const Login(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}