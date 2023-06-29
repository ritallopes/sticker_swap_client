import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_type/create_swap_type_screen.dart';

class CreateSwapType extends WidgetModule {
  Function(int) proximaTela;

  CreateSwapType({required this.proximaTela});

  @override
  List<Bind<Object>> get binds => [];

  @override
  Widget get view => CreateSwapTypeScreen(
        proximaTela: proximaTela,
      );
}
