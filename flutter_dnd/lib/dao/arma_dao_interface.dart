import 'package:flutter_dnd/models/arma.dart';

abstract class ArmaDAOInterface {
  Future<int> salvar(Arma arma);
  Future<List<Arma>> buscarTodos();
  Future<Arma> buscar(int id);
  Future<int> alterar(Arma arma);
  Future<int> excluir(int id);
}