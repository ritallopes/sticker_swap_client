import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_album/create_swap_album_bloc.dart';

import 'create_swap_album_screen.dart';

class CreateSwapAlbum extends WidgetModule {

  final ReferenceSwap referenceSwap;
  final String nameOtherUser;
  CreateSwapAlbum({required this.referenceSwap, required this.nameOtherUser});

  @override
  List<Bind<Object>> get binds => [
    Bind<CreateSwapAlbumBloc>((i) => CreateSwapAlbumBloc(
        referenceSwap: referenceSwap,
        nameOtherUser: nameOtherUser
    ))
  ];

  @override
  Widget get view => CreateSwapAlbumScreen();
}
