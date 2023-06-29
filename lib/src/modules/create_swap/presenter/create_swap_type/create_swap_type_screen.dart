import 'package:flutter/material.dart';

class CreateSwapTypeScreen extends StatelessWidget {
  Function(int) proximaTela;

  CreateSwapTypeScreen({required this.proximaTela});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 400,
          padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
          margin: const EdgeInsets.only(left: 30, right: 30),
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
              const Expanded(
                child: Text(
                  "Floyd tem disponível para troca 3 Especiais e 6 Comuns. \n\nVocê tem 3 Comuns que interessam a Floyd.",
                  style: TextStyle(
                    color: Color.fromRGBO(70, 98, 235, 1),
                    fontSize: 16,
                  ),
                  maxLines: 6,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "Como deseja elaborar a proposta de troca?",
              style: theme.textTheme.headlineSmall,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
            onPressed: () {
              proximaTela(1);
            },
            style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              backgroundColor: Color.fromRGBO(154, 16, 50, 1),
              side: BorderSide(color: Color(0xff9A1032)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            child: const Text("Manualmente",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              backgroundColor: Color.fromRGBO(154, 16, 50, 1),
              side: BorderSide(color: Color(0xff9A1032)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            child: const Text("Sugestão de troca",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
          ),
        ),
      ],
    );
  }
}
