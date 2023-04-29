class Monstro {
  Monstro({
    required this.nome,
    required this.classe
  });

  String nome;
  String classe;

  static List<Monstro> generateMonstros(int numberOfMonstros) {
    return List<Monstro>.generate(numberOfMonstros, (int index) {
      return Monstro(
        nome: 'monstro ${index}',
        classe: 'classe ${index}'
      );
    });
  }
}