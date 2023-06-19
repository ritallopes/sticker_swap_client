import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/album_manager.dart';
import 'package:sticker_swap_client/src/core/entities/auth.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/chat/qrcode/presenter/qrcode_module.dart';
import 'package:sticker_swap_client/src/modules/home/presenter/home_module.dart';
import 'package:sticker_swap_client/src/modules/login/domain/usecases/get_user.dart';
import 'package:sticker_swap_client/src/modules/login/presenter/login_module.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/message_chat_module.dart';
import 'package:sticker_swap_client/src/modules/splashscreen/presenter/splash_screen.dart';
import 'package:sticker_swap_client/src/modules/splashscreen/presenter/splash_screen_bloc.dart';

import 'modules/register/presenter/register_module.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [
    Bind<Dio>((i)=>Dio()),
    Bind<Auth>((i)=>Auth()),
    Bind<AlbumManager>((i) => AlbumManager()),
    Bind<User>((i)=>User()),

    Bind<SplashScreenBloc>((i) => SplashScreenBloc()),
    Bind<IGetUser>((i) => GetUserImpl()),
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => const SplashScreen()),
    ModuleRoute(
        '/login',
        module: LoginModule(),
        transition: TransitionType.fadeIn
    ),
    ModuleRoute(
        '/home',
        module: HomeModule(),
        transition: TransitionType.fadeIn
    ),
    ModuleRoute(
        '/message_chat',
        module: MessageChatModule(),
        transition: TransitionType.fadeIn
    ),
    ModuleRoute(
        '/register',
        module: RegisterModule(),
        transition: TransitionType.fadeIn
    ),
     ModuleRoute(
        '/qrcode',
        module: QRCodeModule(),
        transition: TransitionType.fadeIn
    ),
  ];

}