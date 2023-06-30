import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputCreateSwap extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const InputCreateSwap({super.key, 
    required this.controller, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: false,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color.fromRGBO(83, 78, 78, 1), width: 3)
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color.fromRGBO(83, 78, 78, 1), width: 3)
            ),
            constraints: const BoxConstraints(
              maxWidth: 46,
              maxHeight: 42,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10)
          ),
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
            maxLines: 2,
          )
        )]
    );
  }
}