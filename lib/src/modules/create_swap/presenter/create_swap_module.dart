import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/repositories/interface_get_reference_swap_repository.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/usecases/get_reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/external/datasources/get_reference_swap_datasource.dart';
import 'package:sticker_swap_client/src/modules/create_swap/infra/datasources/interface_get_reference_swap_datasource.dart';
import 'package:sticker_swap_client/src/modules/create_swap/infra/repositories/get_reference_swap_repository.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_bloc.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_screen.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';

class CreateSwapModule extends WidgetModule {

  Chat? chat;
  MessageSwapStickers? messageSwap;
  final Function(ReferenceSwap referenceSwap) sendRefereceSwap;
  CreateSwapModule({
    super.key,
    this.chat,
    this.messageSwap,
    required this.sendRefereceSwap
  });

  @override
  List<Bind<Object>> get binds => [
    Bind<CreateSwapBloc>((i) => CreateSwapBloc()),

    Bind<IGetReferenceSwapDatasource>((i) => GetReferenceSwapDatasource()),
    Bind<IGetReferenceSwapRepository>((i) => GetReferenceSwapRepository(i.get<IGetReferenceSwapDatasource>())),
    Bind<GetReferenceSwap>((i) => GetReferenceSwap(i.get<IGetReferenceSwapRepository>())),
  ];

  @override
  Widget get view => CreateSwapScreen(
    chat: chat,
    messageSwap: messageSwap,
    sendRefereceSwap: sendRefereceSwap,
  );
}
