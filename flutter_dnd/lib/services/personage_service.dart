import 'package:flutter_dnd/models/personagem.dart';

class PersonagemService {
  List<Personagem> getAll(){
    return Personagem.generatePersonagens(4);
  }

  Personagem save(Personagem personagem) {
    return personagem;
  }

}