import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/core/components/app_bar_bottom_sheet.dart';

class CreateSwapScreen extends StatefulWidget {
  @override
  _CreateSwapScreenState createState() => _CreateSwapScreenState();
}

class _CreateSwapScreenState extends State<CreateSwapScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBarBottomSheet("Proposta de troca", context),
        Container(
          width: 400,
          padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
          margin: EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/info_icon.png',
                height: 25,
              ),
              const SizedBox(
                width: 25,
              ),
              const Text(
                "Selecione as figurinhas que deseja trocar",
                style: TextStyle(
                  color: Color.fromRGBO(70, 98, 235, 1),
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
          child: Text(
            "Figurinhas de ...",
            style: theme.textTheme.headlineSmall,
          ),
        ),
        const Placeholder(
          fallbackHeight: 200,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
          child: Text(
            "Figurinhas de ...",
            style: theme.textTheme.headlineSmall,
          ),
        ),
        const Placeholder(
          fallbackHeight: 200,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              backgroundColor: const Color.fromRGBO(154, 16, 50, 1),
              side: const BorderSide(color: Color(0xff9A1032)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            child: const Text("Confirmar",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}

class CardButton extends StatefulWidget {
  CardButton({super.key, required this.name});

  final String name;
  bool selected = false;

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  Color _colorButton = Colors.transparent;
  Color _colorText = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      leading: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              side: BorderSide(color: Colors.black),
              backgroundColor: _colorButton),
          onPressed: () {
            setState(() {
              widget.selected = !widget.selected;
              if (widget.selected == false) {
                _colorButton = Colors.transparent;
                _colorText = Colors.black;
              } else {
                _colorButton = Color.fromRGBO(154, 16, 50, 1);
                _colorText = Colors.white;
              }
            });
          },
          child: Text(
            widget.name,
            style: TextStyle(color: _colorText),
          )),
    ));
  }
}
