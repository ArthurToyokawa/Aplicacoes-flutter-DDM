import 'package:flutter_dnd/models/monstro.dart';

class MonstroService {
  List<Monstro> getAll(){
    return Monstro.generateMonstros(10);
  }

  Monstro save(Monstro monstro) {
    return monstro;
  }

}