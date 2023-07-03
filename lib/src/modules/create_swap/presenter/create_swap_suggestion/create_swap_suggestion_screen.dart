import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/suggestion_swap_type.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_suggestion/create_swap_suggestion_module.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/widgets/button_create_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/widgets/input_create_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/widgets/radio_create_swap.dart';

import 'create_swap_suggestion_bloc.dart';

class CreateSwapSuggestionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateSwapSuggestionScreenState();
}

class _CreateSwapSuggestionScreenState extends State<CreateSwapSuggestionScreen> {
  final controller = Modular.get<CreateSwapSuggestionBloc>();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 32, right: 32, top: 64),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white
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
                  "Configure a sugestão",
                  style: TextStyle(
                    color: Color.fromRGBO(70, 98, 235, 1),
                    fontSize: 16,
                  ),
                  maxLines: 1,
                ),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.only(left: 32, right: 32, top: 64), child: Column(
          children: [
            RadioCreateSwap(
                text: "Troca entre especiais",
                value: SuggestionSwapType.special,
                groupValue: controller.suggestionType,
                onChanged: (value) {
                  setState(() {
                    controller.changeSuggestionType(value);
                  });
                }),
            RadioCreateSwap(
                text: "Troca entre comuns",
                value: SuggestionSwapType.standard,
                groupValue: controller.suggestionType,
                onChanged: (value) {
                  setState(() {
                    controller.changeSuggestionType(value);
                  });
                }),
            RadioCreateSwap(
                text: "Sugestão aleatória",
                value: SuggestionSwapType.random,
                groupValue: controller.suggestionType,
                onChanged: (value) {
                  setState(() {
                    controller.changeSuggestionType(value);
                  });
                }),
          ],
        )),
        Padding(
            padding: EdgeInsets.only(left: 32, right: 32, top: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputCreateSwap(
                    controller: controller.maxTradedStickers,
                    text: "Número de figurinhas máximo que deseja receber"
                ),
                const SizedBox(height: 16,),
                InputCreateSwap(
                    controller: controller.maxReceivedStickers,
                    text: "Número de figurinhas máximo que deseja receber"
                ),
              ],
            ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 64),
            child: ButtonCreateSwap(
              onPressed: controller.generateSuggestion,
              text: "Obter sugestão de troca"
            ))
      ],
    );
  }
}