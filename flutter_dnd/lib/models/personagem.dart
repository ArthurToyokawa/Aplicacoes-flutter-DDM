final String tablePersonagem = 'personagens';

class PersonagemFields {
    static final List<String> values = [
    id, nome, classe,
  ];
  static final String id = 'id'; 
  static final String nome = 'nome';
  static final String classe = 'classe';
}
class Personagem {
  int? id;
  String nome;
  String classe;

  Personagem({
    this.id,
    required this.nome,
    required this.classe
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[PersonagemFields.id] = id;
    data[PersonagemFields.nome] = nome;
    data[PersonagemFields.classe] = classe;
    return data;
  }

  static Personagem fromJson(Map<String, Object?> json) => Personagem(
    id: json[PersonagemFields.id] as int?,
    nome: json[PersonagemFields.nome] as String,
    classe: json[PersonagemFields.classe] as String,
  );

  static List<Personagem> generatePersonagens(int numberOfPersonagens) {
    return List<Personagem>.generate(numberOfPersonagens, (int index) {
      return Personagem(
        nome: 'personagem ${index}',
        classe: 'classe ${index}'
      );
    });
  }
}