import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputMarkLocation extends StatelessWidget {

  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  InputMarkLocation({
    required this.hintText,
    required this.inputType,
    required this.controller,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xfff8f8f8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.transparent, width: 1,),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.transparent, width: 1,),
        ),
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
      ),
      inputFormatters: inputFormatters,
      validator: validator,
    );
  }
}
