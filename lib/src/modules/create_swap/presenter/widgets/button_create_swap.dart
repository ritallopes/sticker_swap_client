import 'package:flutter/material.dart';

class ButtonCreateSwap extends StatelessWidget {

  final String text;
  final Function() onPressed;
  const ButtonCreateSwap({
    Key? key, required this.text, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        backgroundColor: const Color.fromRGBO(154, 16, 50, 1),
        side: const BorderSide(color: Color(0xff9A1032)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)),
      ),
      child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          )),
    );
  }
}
