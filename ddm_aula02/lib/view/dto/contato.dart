class Contato {
  dynamic id;
  String?  nome;
  String?  telefone;
  String?  email;
  String?  urlAvatar;

  Contato();

  Contato.dados({
    this.id,
    this.nome,
    this.telefone,
    this.email,
    this.urlAvatar,
  });

  @override
  String toString(){
    return '''
      $nome
      $telefone
      $email
      $urlAvatar
    ''';
  }

}