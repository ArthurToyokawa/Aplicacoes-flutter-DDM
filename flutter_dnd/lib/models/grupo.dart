import 'dart:convert';
import 'package:flutter_dnd/models/arma.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:flutter_dnd/utils/json.dart';


final String tableGrupo = 'grupo';

class GrupoFields {
    static final List<String> values = [
    id, nome
  ];
  static final String id = 'id'; 
  static final String nome = 'nome';
}
class Grupo {
  int? id;
  String nome;
  List<Personagem>? personagens;

  Grupo({
    this.id,
    required this.nome,
    this.personagens,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[GrupoFields.id] = id;
    data[GrupoFields.nome] = nome;
    return data;
  }

  static Grupo fromJson(Map<String, Object?> json) => Grupo(
    id: json[GrupoFields.id] as int?,
    nome: json[GrupoFields.nome] as String,
  );

  static Grupo fromJsonPersonagens(Map<String, Object?> json) => Grupo(
    nome: json['grupo.nome'] as String,
    personagens: [json['personagem'] as Personagem],
  );


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Grupo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nome == other.nome;

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode;
}