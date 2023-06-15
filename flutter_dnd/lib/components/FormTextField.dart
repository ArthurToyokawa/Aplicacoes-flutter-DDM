import 'package:flutter/material.dart';
import 'package:flutter_dnd/routes.dart';

class FormTextField extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return const Size.fromHeight(60.0);
  }
  FormTextField( 
    {
      super.key, 
      required this.fieldName,
      required this.controller, 
      this.isRequired = false
    });

  final String fieldName;
  final bool isRequired;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'Por favor, insira um $fieldName';
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Digite um $fieldName',
      ),
    );
  }
  
}