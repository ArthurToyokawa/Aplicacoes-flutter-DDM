class Personagem {
  Personagem({
    required this.nome,
    required this.classe
  });

  String nome;
  String classe;

  static List<Personagem> generatePersonagens(int numberOfPersonagens) {
    return List<Personagem>.generate(numberOfPersonagens, (int index) {
      return Personagem(
        nome: 'personagem ${index}',
        classe: 'classe ${index}'
      );
    });
  }
}