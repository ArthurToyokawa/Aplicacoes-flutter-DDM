import 'package:ddm_aula02/view/dto/contato.dart';

abstract class ContatoDAOInterface {
  Future<Contato> salvar(Contato contato);
  Future<List<Contato>> buscarTodos();
  Future<Contato> buscar(dynamic id);
  Future<Contato> alterar(Contato contato);
  Future<bool> excluir(dynamic id);
}