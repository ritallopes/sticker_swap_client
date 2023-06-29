import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_type/create_swap_type_module.dart';

import '../../../core/components/app_bar_bottom_sheet.dart';
import 'create_swap_album/create_swap_album_module.dart';
import 'create_swap_bloc.dart';

class CreateSwapScreen extends StatefulWidget {
  final Chat? chat;
  const CreateSwapScreen({super.key, this.chat});

  @override
  State<CreateSwapScreen> createState() => _CreateSwapScreenState();
}

class _CreateSwapScreenState extends State<CreateSwapScreen> {
  CreateSwapBloc controller = Modular.get<CreateSwapBloc>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBarBottomSheet("Proposta de troca", context),
        StreamBuilder<int>(
            initialData: 0,
            stream: controller.getIndexTela,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }


              late Widget tela;
              if (snapshot.data == 0) {
                tela = CreateSwapType(
                  idUser: controller.user.id!,
                  idOtherUser: widget.chat!.idUser,
                  proximaTela: controller.mudarTela,
                );
              } else if (snapshot.data == 1) {
                tela = CreateSwapAlbum();
              }

              return Expanded(
                child: tela,
              );
            }),
      ],
    );
  }
}
