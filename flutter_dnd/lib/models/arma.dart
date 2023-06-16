
import 'package:flutter_dnd/utils/json.dart';

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
    id: jsonCheckStringInt(json[ArmaFields.id]),
    nome: json[ArmaFields.nome] as String,
    modDano: jsonCheckStringInt(json[ArmaFields.modDano]) as int,
    numDados: jsonCheckStringInt(json[ArmaFields.numDados]) as int,
    dadoDano: jsonCheckStringInt(json[ArmaFields.dadoDano]) as int,
  );


}