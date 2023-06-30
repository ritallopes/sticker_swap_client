import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_type/create_swap_type_bloc.dart';

class CreateSwapTypeScreen extends StatefulWidget {
  const CreateSwapTypeScreen({Key? key}) : super(key: key);

  @override
  State<CreateSwapTypeScreen> createState() => _CreateSwapTypeScreenState();
}

class _CreateSwapTypeScreenState extends State<CreateSwapTypeScreen> {
  final controller = Modular.get<CreateSwapTypeBloc>();

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
              Expanded(
                child: Text(
                  "${controller.nameOtherUser} tem ${controller.quantNeedSticker} figurinha(s) que você precisa."
                      "\n\nVocê tem ${controller.quantSendSticker} figurinha(s) que ele deseja.",
                  style: const TextStyle(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                "Como deseja elaborar a proposta de troca?",
                style: theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
            onPressed: controller.orgSwap,
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
