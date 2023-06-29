import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'create_swap_album_screen.dart';

class CreateSwapAlbum extends WidgetModule {
  @override
  List<Bind<Object>> get binds => [];

  @override
  Widget get view => CreateSwapAlbumScreen();
}
