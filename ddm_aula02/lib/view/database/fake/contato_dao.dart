
import 'package:ddm_aula02/view/dto/contato.dart';
import 'package:ddm_aula02/view/interface/contato_dao_interface.dart';

class ContatoDAO implements ContatoDAOInterface {
  var listaContatos = <Contato> [
    Contato.dados(id: 1, nome: 'nome', email: 'email', telefone: '12341234', urlAvatar: 'https://d1jyxxz9imt9yb.cloudfront.net/medialib/3078/image/s1300x1300/IP202207_GlassFrogs_009_365211_reduced.jpg'),
    Contato.dados(id: 2, nome: 'nome2', email: 'email2', telefone: '123412342', urlAvatar: 'https://d1jyxxz9imt9yb.cloudfront.net/medialib/3078/image/s1300x1300/IP202207_GlassFrogs_009_365211_reduced.jpg')
  ];

  @override
  Future<List<Contato>> buscarTodos() {
    return Future.value(listaContatos);
  }

  @override
  Future<Contato> salvar(Contato contato){
    return Future.value(contato);
  }
  
  @override
  Future<Contato> buscar(dynamic id){
    return Future.value(listaContatos[0]);
  }
  
  @override
  Future<Contato> alterar(Contato contato){
    return Future.value(contato);
  }
  
  @override
  Future<bool> excluir(dynamic id){
    return Future.value(true);
  }
}