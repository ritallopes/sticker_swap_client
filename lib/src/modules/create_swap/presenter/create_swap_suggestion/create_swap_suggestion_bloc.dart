import 'package:flutter/cupertino.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/suggestion_swap_type.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_suggestion/create_swap_suggestion_module.dart';

import '../../domain/entities/reference_swap.dart';

class CreateSwapSuggestionBloc {
  Function(int) proximaTela;
  String nameOtherUser;
  ReferenceSwap referenceSwap;
  SuggestionSwapType? suggestionType = SuggestionSwapType.special;
  TextEditingController maxTradedStickers = TextEditingController(text: '0');
  TextEditingController maxReceivedStickers = TextEditingController(text: "0");

  CreateSwapSuggestionBloc({
    required this.referenceSwap,
    required this.proximaTela,
    required this.nameOtherUser,
  });

  Future<void> generateSuggestion() async{
    //TODO
    proximaTela(2);
  }

  void changeSuggestionType(SuggestionSwapType? value){
    suggestionType = value;
  }

}
