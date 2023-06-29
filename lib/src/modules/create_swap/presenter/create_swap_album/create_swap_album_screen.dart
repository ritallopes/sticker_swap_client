import 'package:flutter/material.dart';

class CreateSwapAlbumScreen extends StatefulWidget {
  @override
  _CreateSwapAlbumScreenState createState() => _CreateSwapAlbumScreenState();
}

class _CreateSwapAlbumScreenState extends State<CreateSwapAlbumScreen> {
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
