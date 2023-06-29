import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/repositories/interface_get_reference_swap_repository.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/usecases/get_reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/external/datasources/get_reference_swap_datasource.dart';
import 'package:sticker_swap_client/src/modules/create_swap/infra/datasources/interface_get_reference_swap_datasource.dart';
import 'package:sticker_swap_client/src/modules/create_swap/infra/repositories/get_reference_swap_repository.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_bloc.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_screen.dart';

class CreateSwapModule extends WidgetModule {
  @override
  List<Bind<Object>> get binds => [
        Bind<CreateSwapBloc>((i) => CreateSwapBloc()),
        Bind<IGetReferenceSwapDatasource>((i) => GetReferenceSwapDatasource()),
        Bind<IGetReferenceSwapRepository>((i) =>
            GetReferenceSwapRepository(i.get<IGetReferenceSwapDatasource>())),
        Bind<IGetReferenceSwap>(
            (i) => GetReferenceSwap(i.get<IGetReferenceSwapRepository>())),
      ];

  @override
  Widget get view => CreateSwapScreen();
}
