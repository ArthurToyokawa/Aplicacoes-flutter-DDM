import 'dart:convert';
import 'package:flutter_dnd/models/arma.dart';
import 'package:flutter_dnd/utils/json.dart';


final String tablePersonagem = 'personagem';

class PersonagemFields {
    static final List<String> values = [
    id, nome, classe, arma
  ];
  static final String id = 'id'; 
  static final String nome = 'nome';
  static final String classe = 'classe';
  static final String arma = 'arma';
}
class Personagem {
  int? id;
  String nome;
  String classe;
  Arma arma;

  Personagem({
    this.id,
    required this.nome,
    required this.classe,
    required this.arma,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[PersonagemFields.id] = id;
    data[PersonagemFields.nome] = nome;
    data[PersonagemFields.classe] = classe;
    data[PersonagemFields.arma] = arma.toJson().toString();
    return data;
  }

  static Personagem fromJson(Map<String, Object?> json) => Personagem(
    id: json[PersonagemFields.id] as int?,
    nome: json[PersonagemFields.nome] as String,
    classe: json[PersonagemFields.classe] as String,
    arma: Arma.fromJson(jsonStringToMap(json[PersonagemFields.arma] as String)),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Personagem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nome == other.nome &&
          classe == other.classe &&
          arma == other.arma;

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode ^
      classe.hashCode ^
      arma.hashCode;
}