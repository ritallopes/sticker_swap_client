import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/repositories/interface_get_reference_swap_repository.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/usecases/get_reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/external/datasources/get_reference_swap_datasource.dart';
import 'package:sticker_swap_client/src/modules/create_swap/infra/datasources/interface_get_reference_swap_datasource.dart';
import 'package:sticker_swap_client/src/modules/create_swap/infra/repositories/get_reference_swap_repository.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_type/create_swap_type_bloc.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_type/create_swap_type_screen.dart';

class CreateSwapType extends WidgetModule {

  Function(int) proximaTela;
  String idUser, idOtherUser;
  ReferenceSwap referenceSwap;

  CreateSwapType({
    super.key,
    required this.referenceSwap,
    required this.proximaTela,
    required this.idOtherUser,
    required this.idUser
  });

  @override
  List<Bind<Object>> get binds => [
    Bind<CreateSwapTypeBloc>((i) => CreateSwapTypeBloc(
        referenceSwap: referenceSwap,
        proximaTela: proximaTela,
        idUser: idUser,
        idOtherUser: idOtherUser
    )),

    Bind<IGetReferenceSwapDatasource>((i) => GetReferenceSwapDatasource()),
    Bind<IGetReferenceSwapRepository>((i) => GetReferenceSwapRepository(i.get<IGetReferenceSwapDatasource>())),
    Bind<GetReferenceSwap>((i) => GetReferenceSwap(i.get<IGetReferenceSwapRepository>())),
  ];

  @override
  Widget get view => CreateSwapTypeScreen();
}
