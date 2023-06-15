final String tableArma = 'armas';

class ArmaFields {
    static final List<String> values = [
    id, nome, modDano, numDados, dadoDano,
  ];
  static final String id = 'id'; 
  static final String nome = 'nome';
  static final String modDano = 'modDano';
  static final String numDados = 'numDados';
  static final String dadoDano = 'dadoDano';
}
class Arma {
  int? id;
  String nome;
  int modDano;
  int numDados;
  int dadoDano;

  Arma({
    this.id,
    required this.nome,
    required this.modDano,
    required this.numDados,
    required this.dadoDano
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ArmaFields.id] = id;
    data[ArmaFields.nome] = nome;
    data[ArmaFields.modDano] = modDano;
    data[ArmaFields.numDados] = numDados;
    data[ArmaFields.dadoDano] = dadoDano;
    return data;
  }

  static Arma fromJson(Map<String, Object?> json) => Arma(
    id: json[ArmaFields.id] as int?,
    nome: json[ArmaFields.nome] as String,
    modDano: json[ArmaFields.modDano] as int,
    numDados: json[ArmaFields.numDados] as int,
    dadoDano: json[ArmaFields.dadoDano] as int,
  );

}