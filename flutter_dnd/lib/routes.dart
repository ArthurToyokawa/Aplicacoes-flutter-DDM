// ignore_for_file: constant_identifier_names

import 'package:flutter_dnd/pages/calculos.dart';
import 'package:flutter_dnd/pages/grupos_list.dart';
import 'package:flutter_dnd/pages/home.dart';
import 'package:flutter_dnd/pages/login.dart';
import 'package:flutter_dnd/pages/monstro.dart';
import 'package:flutter_dnd/pages/monstro_cadastro.dart';
import 'package:flutter_dnd/pages/personagem_list.dart';
import 'package:flutter_dnd/pages/personagens_cadastro.dart';
import 'package:flutter_dnd/pages/armas_list.dart';
import 'package:flutter_dnd/pages/armas_cadastro.dart';
import 'package:flutter_dnd/pages/recuperar_senha.dart';
import 'package:flutter_dnd/pages/rolar_ataque.dart';
import 'package:flutter_dnd/pages/rolar_dados.dart';

class Routes{
  static const String home = '/home';
  static const String login = '/login';
  static const String recuperar_senha = '/recuperar_senha';
  static const String personagens = '/personagens'; 
  static const String personagens_cadastro = '/personagens_cadastro'; 
  static const String grupos = '/grupos'; 
  static const String grupos_cadastro = '/grupos_cadastro'; 
  static const String armas = '/arma'; 
  static const String armas_cadastro = '/arma_cadastro'; 
  static const String monstros = '/monstros'; 
  static const String monstros_cadastro = '/monstros_cadastro'; 
  static const String calculos = '/calculos'; 
  static const String rolar_dados = '/rolar_dados'; 
  static const String rolar_ataque = '/rolar_ataque';

  static final routes = {
    home:(context) => const Home(),
    login: (context) => const Login(),
    recuperar_senha: (context) => const RecuperarSenha(),
    personagens:(context) => const PersonagemList(), 
    personagens_cadastro:(context) => const PersonagemCadastro(), 
    grupos:(context) => const GrupoList(), 
    grupos_cadastro:(context) => const PersonagemCadastro(), 
    armas:(context) => const ArmaList(), 
    armas_cadastro:(context) => const ArmaCadastro(), 
    monstros:(context) => const MonstroList(), 
    monstros_cadastro:(context) => const MonstroCadastro(), 
    calculos:(context) => const Calculos(), 
    rolar_dados:(context) => const RolarDados(), 
    rolar_ataque:(context) => const RolarAtaque(),
  };
}