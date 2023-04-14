import 'package:flutter/material.dart';
import 'package:flutter_dnd/components/leading_bar.dart';
import 'package:flutter_dnd/models/personagem.dart';
import 'package:flutter_dnd/services/personage_service.dart';


class PersonagemList extends StatefulWidget {
  const PersonagemList({super.key});

  @override
  _PersonagemListState createState() {	
    return _PersonagemListState();	
  }
}
class _PersonagemListState extends State<PersonagemList> {
  final _personagemService = PersonagemService();
  List<Personagem> _personagens = [];

  @override
  void initState() {
    super.initState();
    _personagens = _personagemService.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingBar('Personagens'),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _personagens.map((p) => 
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight, 
                        flex: 1,
                        child: Text(p.nome),
                      ),
                      Flexible(
                        fit: FlexFit.tight, 
                        flex: 1,
                        child: Text(p.classe),
                      )
                    ]
                  )
                ).cast<Widget>().toList()
            ),
          ),
          const Flexible(
            fit: FlexFit.tight,
            child: Text('1')
          ),
        ]
      )
    );
  }
}
