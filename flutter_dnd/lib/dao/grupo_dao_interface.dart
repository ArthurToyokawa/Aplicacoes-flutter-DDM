import 'package:flutter_dnd/models/grupo.dart';

abstract class GrupoDAOInterface {
  Future<int> salvar(Grupo grupo);
  Future<List<Grupo>> buscarTodos();
  Future<List<Grupo>> buscarTodosTest();
  Future<Grupo> buscar(int id);
  Future<int> alterar(Grupo grupo);
  Future<int> excluir(int id);
}