import 'dart:convert';
import 'package:flutter_dnd/models/arma.dart';

final String tablePersonagem = 'personagens';

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
    arma: jsonDecode(json[PersonagemFields.arma] as String),
  );
}