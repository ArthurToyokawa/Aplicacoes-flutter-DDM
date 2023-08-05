import 'dart:convert';
import 'package:flutter_dnd/models/arma.dart';
import 'package:flutter_dnd/models/grupo.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:flutter_dnd/utils/json.dart';


final String tableGrupoPersonagem = 'grupopersonagem';

class GrupoPersonagemFields {
    static final List<String> values = [
    id, grupo, personagem
  ];
  static final String id = 'id'; 
  static final String grupo = 'grupo';
  static final String personagem = 'personagem';
}
class GrupoPersonagem {
  int? id;
  Grupo grupo;
  Personagem personagem;

  GrupoPersonagem({
    this.id,
    required this.grupo,
    required this.personagem,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[GrupoPersonagemFields.id] = id;
    data[GrupoPersonagemFields.grupo] = grupo.toJson().toString();
    data[GrupoPersonagemFields.personagem] = personagem.toJson().toString();
    return data;
  }

  static GrupoPersonagem fromJson(Map<String, Object?> json) => GrupoPersonagem(
    id: json[GrupoPersonagemFields.id] as int?,
    grupo: Grupo.fromJson(jsonStringToMap(json[GrupoPersonagemFields.grupo] as String)),
    personagem: Personagem.fromJson(jsonStringToMap(json[GrupoPersonagemFields.personagem] as String)),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrupoPersonagem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          grupo == other.grupo &&
          personagem == other.personagem;

  @override
  int get hashCode =>
      id.hashCode ^
      grupo.hashCode ^
      personagem.hashCode;
}