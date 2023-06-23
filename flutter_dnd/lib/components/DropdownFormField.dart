import 'package:flutter/material.dart';

class DropdownFormField extends StatefulWidget {
  final ValueNotifier<dynamic> opcaoSelecionado;
  final Future<List<dynamic>> Function() consultarTodos;

  DropdownFormField({
      Key? key,     
      required this.opcaoSelecionado,
      required this.consultarTodos,
    }) : super(key: key);
  
  @override
  State<DropdownFormField> createState() => _DropdownFormFieldState();
}

class _DropdownFormFieldState extends State<DropdownFormField> {
  
  late Future<List<dynamic>> dadosBD;

  @override
  void initState() {
    super.initState();
    dadosBD = widget.consultarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dadosBD,
      builder: (BuildContext context,AsyncSnapshot<List<dynamic>> resultado){
        if(!resultado.hasData) return const CircularProgressIndicator();
        if(resultado.data == null) return const Text('Faça o cadastro de arma primeiro.');
        List<dynamic> armas = resultado.data!;
        return DropdownButtonFormField<dynamic>(
          value: widget.opcaoSelecionado.value,
          items: armas.map((arma) {
            return DropdownMenuItem<dynamic>(
              value: arma,
              child: Text(arma.nome),
            );
          }).toList(),
          onChanged: (value) {
            // selectedWeapon.value = value;
            setState(() {
              widget.opcaoSelecionado.value = value;
            });
          },
          validator: (value) {
            if (value == null) {
              return 'Por favor, Selecione uma arma';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Selecione uma arma',
          ),
        );
      }
    );
  }
}