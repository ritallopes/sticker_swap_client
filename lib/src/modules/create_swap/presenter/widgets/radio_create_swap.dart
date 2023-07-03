import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/suggestion_swap_type.dart';
import '../../domain/entities/suggestion_swap_type.dart';

class RadioCreateSwap extends StatelessWidget {

  final String text;
  final dynamic value;
  final SuggestionSwapType? groupValue;
  final void Function(dynamic) onChanged;
  const RadioCreateSwap({
    Key? key, required this.text, required this.value, required this.groupValue, required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile<SuggestionSwapType>(
      title: Text(text, style: const TextStyle(
        fontSize: 20
      ),),
      value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: const Color.fromRGBO(70, 98, 235, 1),
      );
  }


}