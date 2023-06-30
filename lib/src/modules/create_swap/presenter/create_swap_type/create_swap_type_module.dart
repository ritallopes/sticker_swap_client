import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_type/create_swap_type_bloc.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_type/create_swap_type_screen.dart';

class CreateSwapType extends WidgetModule {

  Function(int) proximaTela;
  String nameOtherUser;
  ReferenceSwap referenceSwap;

  CreateSwapType({
    super.key,
    required this.referenceSwap,
    required this.proximaTela,
    required this.nameOtherUser,
  });

  @override
  List<Bind<Object>> get binds => [
    Bind<CreateSwapTypeBloc>((i) => CreateSwapTypeBloc(
        referenceSwap: referenceSwap,
        proximaTela: proximaTela,
        nameOtherUser: nameOtherUser
    )),
  ];

  @override
  Widget get view => CreateSwapTypeScreen();
}
