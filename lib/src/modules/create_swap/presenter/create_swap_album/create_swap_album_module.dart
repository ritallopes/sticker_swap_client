import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';

import 'create_swap_album_screen.dart';

class CreateSwapAlbum extends WidgetModule {

  ReferenceSwap referenceSwap;
  CreateSwapAlbum({required this.referenceSwap,});

  @override
  List<Bind<Object>> get binds => [];

  @override
  Widget get view => CreateSwapAlbumScreen(referenceSwap: referenceSwap,);
}
