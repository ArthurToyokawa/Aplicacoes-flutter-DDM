import 'package:flutter_dnd/models/personagem.dart';

abstract class PersonagemDAOInterface {
  Future<int> salvar(Personagem personagem);
  Future<List<Personagem>> buscarTodos();
  Future<Personagem> buscar(int id);
  Future<int> alterar(Personagem personagem);
  Future<int> excluir(int id);
}