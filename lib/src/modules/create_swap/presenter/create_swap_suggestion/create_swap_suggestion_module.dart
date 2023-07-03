import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/reference_swap.dart';
import 'create_swap_suggestion_bloc.dart';
import 'create_swap_suggestion_screen.dart';

class CreateSwapSuggestion extends WidgetModule {
  Function(int) proximaTela;
  String nameOtherUser;
  ReferenceSwap referenceSwap;

  CreateSwapSuggestion({
    super.key,
    required this.referenceSwap,
    required this.proximaTela,
    required this.nameOtherUser,
  });


  @override
  List<Bind<Object>> get binds => [
    Bind<CreateSwapSuggestionBloc>((i) => CreateSwapSuggestionBloc(
        proximaTela: proximaTela,
        referenceSwap: referenceSwap,
        nameOtherUser: nameOtherUser,
    ))
  ];

  @override
  Widget get view => CreateSwapSuggestionScreen();
}